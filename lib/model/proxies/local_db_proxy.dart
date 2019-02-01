class FeedElement {
  final String title;
  final String description;

  const FeedElement(this.title, this.description);
}

abstract class LocalDBProxyProvider {
  saveFeed(List feed);
  List loadFeed();
}

enum DbKeys { feeds }

class LocalDBProxy implements LocalDBProxyProvider {
  final Map<DbKeys, Object> db = {};

  saveFeed(List feed) {
    db[DbKeys.feeds] = feed;
  }

  List loadFeed() {
    return db[DbKeys.feeds];
  }
}
