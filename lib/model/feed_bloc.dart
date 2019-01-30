import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'dart:isolate';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class FeedBloc {
  final _feedSubject = BehaviorSubject<List<String>>();
  final _feedTypeController = StreamController<FeedType>();
  Stream<List<String>> get feed => _feedSubject.stream;
  Sink<FeedType> get feedType => _feedTypeController.sink;

  FeedBloc() {
    _feedTypeController.stream.listen((feedType) async {
      final RssFeed feed = await getFeed();
      final items = feed.items.map((item) => item.title).toList();
      _feedSubject.add(items);
    });
  }

  void close() {
    _feedSubject.close();
    _feedTypeController.close();
  }

  Future getFeed() async {
    final response = ReceivePort();
    final Map<String, Object> params = {
      'url': 'http://feeds.reuters.com/reuters/businessNews',
      'port': response.sendPort
    };
    await Isolate.spawn(_feedIsolate, params);
    return response.first;
  }
}

enum FeedType {
  one,
  two,
}

void _feedIsolate(Map<String, Object> params) async {
  final String url = params['url'];
  final SendPort port = params['port'];
  final response = await http.get(url);
  final rssFeed = RssFeed.parse(response.body);
  port.send(rssFeed);
}
