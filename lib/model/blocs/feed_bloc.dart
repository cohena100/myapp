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
  final _operationController = StreamController();
  final NetworkProxyProvider _networkProxy;
  final LocalDBProxy _localDBProxy;
  Stream get feed => _feedSubject.stream;
  Sink get operation => _operationController.sink;

  FeedBloc(this._networkProxy, this._localDBProxy) {
    _operationController.stream.listen((op) async {
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
    _operationController.close();
  }
}
