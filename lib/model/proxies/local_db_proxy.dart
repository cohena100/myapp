class FeedElement {
  final String title;
  final String description;

  const FeedElement(this.title, this.description);
}

abstract class LocalDBProxyProvider {
  saveFeeds(List feeds);
  List loadFeed();
}

enum DbKeys { feeds }

class LocalDBProxy implements LocalDBProxyProvider {
  final Map<DbKeys, Object> db = {};

  saveFeeds(List feeds) {
    db[DbKeys.feeds] = feeds;
  }

  List loadFeed() {
    return db[DbKeys.feeds];
  }
}
