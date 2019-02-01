class FeedElement {
  final String title;
  final String description;

  const FeedElement(this.title, this.description);
}

abstract class LocalDBProxyProvider {
  saveFeeds(List<FeedElement> feeds);
  List<FeedElement> loadFeed();
}

enum DbKeys { feeds }

class LocalDBProxy implements LocalDBProxyProvider {
  final Map<DbKeys, Object> db = {};

  saveFeeds(List<FeedElement> feeds) {
    db[DbKeys.feeds] = feeds;
  }

  List<FeedElement> loadFeed() {
    return db[DbKeys.feeds];
  }
}
