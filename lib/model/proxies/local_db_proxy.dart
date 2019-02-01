class FeedElement {
  final String title;
  final String description;

  const FeedElement(this.title, this.description);
}

enum LocalDBProxyKeys { feedElements, feedElement }

abstract class LocalDBProxyProvider {
  saveFeedElements(List feedElements);
  List loadFeedElements();
  saveFeedElement(FeedElement feedElement);
  FeedElement loadFeedElement();
}

class LocalDBProxy implements LocalDBProxyProvider {
  final Map _db = {};

  saveFeedElements(List feedElements) {
    _db[LocalDBProxyKeys.feedElements] = feedElements;
  }

  List loadFeedElements() {
    return _db[LocalDBProxyKeys.feedElements];
  }

  saveFeedElement(FeedElement feedElement) {
    _db[LocalDBProxyKeys.feedElement] = feedElement;
  }

  FeedElement loadFeedElement() {
    return _db[LocalDBProxyKeys.feedElement];
  }

}
