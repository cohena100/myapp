import 'dart:async';
import 'package:myapp/model/proxies/local_db_proxy.dart';
import 'package:myapp/model/proxies/network_proxy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webfeed/webfeed.dart';

class FeedBloc {
  final _feedSubject = BehaviorSubject();
  final _operationStreamController = StreamController();
  final NetworkProxyProvider _networkProxy;
  final LocalDBProxy _localDBProxy;
  Stream get feedStream => _feedSubject.stream;
  Sink get operationSink => _operationStreamController.sink;

  FeedBloc(this._networkProxy, this._localDBProxy) {
    _operationStreamController.stream.listen((urls) async {
      _feedSubject.add([]);
      final List feeds = await _networkProxy.getFeeds(urls);
      final feedElements = feeds
          .map((feed) => RssFeed.parse(feed).items)
          .reduce((currentItems, allItems) {
            allItems.addAll(currentItems);
            return allItems;
          })
          .map((item) => FeedElement(item.title, item.description))
          .toList();
      _localDBProxy.saveFeedElements(feedElements);
      _feedSubject.add(feedElements);
    });
  }

  FeedElement loadFeedElement() {
    return _localDBProxy.loadFeedElement();
  }

  saveFeedElement(FeedElement feedElement) {
    _localDBProxy.saveFeedElement(feedElement);
  }

  List loadFeedElements() {
    final elements = _localDBProxy.loadFeedElements();
    return elements == null ? [] : elements;
  }

  void close() {
    _feedSubject.close();
    _operationStreamController.close();
  }
}
