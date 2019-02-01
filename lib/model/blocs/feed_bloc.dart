import 'dart:async';
import 'package:myapp/model/proxies/local_db_proxy.dart';
import 'package:myapp/model/proxies/network_proxy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webfeed/webfeed.dart';

enum FeedBlocOperation {
  one,
  two,
}

class FeedBloc {
  final _feedSubject = BehaviorSubject();
  final _operationStreamController = StreamController();
  final NetworkProxyProvider _networkProxy;
  final LocalDBProxy _localDBProxy;
  Stream get feedStream => _feedSubject.stream;
  Sink get operationSink => _operationStreamController.sink;

  FeedBloc(this._networkProxy, this._localDBProxy) {
    _operationStreamController.stream.listen((operation) async {
      _feedSubject.add([]);
      final url = 'http://feeds.reuters.com/reuters/businessNews';
      final RssFeed feed = await _networkProxy.getFeed(url);
      final feeds = feed.items
          .map((item) => FeedElement(item.title, item.description))
          .toList();
      _localDBProxy.saveFeed(feeds);
      _feedSubject.add(feeds);
    });
  }

  void close() {
    _feedSubject.close();
    _operationStreamController.close();
  }
}
