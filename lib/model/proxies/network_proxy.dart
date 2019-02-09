import 'dart:async';
import 'dart:isolate';
import 'package:http/http.dart' as http;

enum NetworkProxyKeys { urls, port }

abstract class NetworkProxyProvider {
  Future getFeeds(List urls);
}

class NetworkProxy implements NetworkProxyProvider {
  Future getFeeds(List urls) async {
    final response = ReceivePort();
    final params = {
      NetworkProxyKeys.urls: urls,
      NetworkProxyKeys.port: response.sendPort
    };
    await Isolate.spawn(_feedIsolate, params);
    return response.first;
  }
}

void _feedIsolate(Map params) async {
  final List urls = params[NetworkProxyKeys.urls];
  final SendPort port = params[NetworkProxyKeys.port];
  final requests = urls.map((url) => http.get(url));
  final responses = await Future.wait(requests);
  final rssFeeds = responses.map((response) => response.body).toList();
  port.send(rssFeeds);
}
