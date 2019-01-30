import 'dart:async';
import 'package:myapp/model/proxies/network_proxy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webfeed/webfeed.dart';

class FeedBloc {
  final _feedSubject = BehaviorSubject<List<String>>();
  final _feedTypeController = StreamController<FeedType>();
  final NetworkProxyProvider networkProxy;
  Stream<List<String>> get feed => _feedSubject.stream;
  Sink<FeedType> get feedType => _feedTypeController.sink;

  FeedBloc(this.networkProxy) {
    _feedTypeController.stream.listen((feedType) async {
      _feedSubject.add([]);
      final url = 'http://feeds.reuters.com/reuters/businessNews';
      final RssFeed feed = await networkProxy.getFeed(url);
      final items = feed.items.map((item) => item.title).toList();
      _feedSubject.add(items);
    });
  }

  void close() {
    _feedSubject.close();
    _feedTypeController.close();
  }
}

enum FeedType {
  one,
  two,
}
