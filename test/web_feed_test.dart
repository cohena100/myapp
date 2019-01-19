import 'package:myapp/src/feed.dart';
import 'package:test/test.dart';

void main() {
  test('first test', () async {
    final rssFeed = await getFeed();
    expect(rssFeed.title, 'Reuters: Business News');
  });
}
