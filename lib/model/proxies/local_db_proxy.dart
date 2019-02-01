class FeedElement {
  final String title;
  final String description;

  const FeedElement(this.title, this.description);
}

enum LocalDBProxyKeys { feed }

abstract class LocalDBProxyProvider {
  saveFeed(List feed);
  List loadFeed();
}

class LocalDBProxy implements LocalDBProxyProvider {
  final Map _db = {};

  saveFeed(List feed) {
    _db[LocalDBProxyKeys.feed] = feed;
  }

  List loadFeed() {
    return _db[LocalDBProxyKeys.feed];
  }
}
