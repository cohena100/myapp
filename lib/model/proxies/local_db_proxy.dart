class FeedElement {
  final String title;
  final String description;

  const FeedElement(this.title, this.description);
}

enum LocalDBProxyKeys { feedElements }

abstract class LocalDBProxyProvider {
  saveFeedElements(List feedElements);
  List loadFeedElements();
}

class LocalDBProxy implements LocalDBProxyProvider {
  final Map _db = {};

  saveFeedElements(List feed) {
    _db[LocalDBProxyKeys.feedElements] = feed;
  }

  List loadFeedElements() {
    return _db[LocalDBProxyKeys.feedElements];
  }
}
