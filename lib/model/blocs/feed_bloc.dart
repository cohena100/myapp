import 'dart:async';
import 'package:myapp/model/proxies/local_db_proxy.dart';
import 'package:myapp/model/proxies/network_proxy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webfeed/webfeed.dart';

class FeedBloc {
  final _feedSubject = BehaviorSubject();
  final _feedTypeController = StreamController();
  final NetworkProxyProvider networkProxy;
  final LocalDBProxy localDBProxy;
  Stream get feed => _feedSubject.stream;
  Sink get feedType => _feedTypeController.sink;

  FeedBloc(this.networkProxy, this.localDBProxy) {
    _feedTypeController.stream.listen((feedType) async {
      _feedSubject.add([]);
      final url = 'http://feeds.reuters.com/reuters/businessNews';
      final RssFeed feed = await networkProxy.getFeed(url);
      final feeds = feed.items
          .map((item) => FeedElement(item.title, item.description))
          .toList();
      localDBProxy.saveFeed(feeds);
      _feedSubject.add(feeds);
    });
  }

  void close() {
    _feedSubject.close();
    _feedTypeController.close();
  }
}

enum FeedsBlocOperation {
  one,
  two,
}
