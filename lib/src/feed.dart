import 'dart:async';
import 'dart:isolate';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

Future getFeed() async {
  final response = ReceivePort();
  final Map<String, Object> params = {
    'url': 'http://feeds.reuters.com/reuters/businessNews',
    'port': response.sendPort
  };
  await Isolate.spawn(_isolate, params);
  return response.first;
}

void _isolate(Map<String, Object> params) async {
  final String url = params['url'];
  final SendPort port = params['port'];
  final response = await http.get(url);
  final rssFeed = RssFeed.parse(response.body);
  port.send(rssFeed);
}
