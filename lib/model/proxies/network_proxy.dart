import 'dart:async';
import 'dart:isolate';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

abstract class NetworkProxyProvider {
  Future getFeed(String url);
}

class NetworkProxy implements NetworkProxyProvider {
  Future getFeed(String url) async {
    final response = ReceivePort();
    final params = {'url': url, 'port': response.sendPort};
    await Isolate.spawn(_feedIsolate, params);
    return response.first;
  }
}

void _feedIsolate(Map<String, Object> params) async {
  final String url = params['url'];
  final SendPort port = params['port'];
  final response = await http.get(url);
  final rssFeed = RssFeed.parse(response.body);
  port.send(rssFeed);
}
