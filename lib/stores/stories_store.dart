import 'package:mobx/mobx.dart';
import 'package:news_mobx_app/common/enums.dart';
import 'package:news_mobx_app/models/feed_item.dart';
import 'package:news_mobx_app/repository/client.dart';
import 'package:url_launcher/url_launcher.dart';

part 'stories_store.g.dart';

class StoriesStore = _StoriesStore with _$StoriesStore;

abstract class _StoriesStore with Store {
  final StoryFeedType _storyFeedType;
  final HnpwaClient _hnpwaClient;
  int _currentPage = 1;
  bool _isLoadingNextPage = false;

  _StoriesStore(this._storyFeedType, this._hnpwaClient);

  @observable
  bool hasNextPage = false;

  @observable
  ObservableList<FeedItem> feedItems = ObservableList<FeedItem>();

  @observable
  ObservableFuture? loadFeedItemsFuture;

  @observable
  bool loadingNextPage = false;

  @action
  Future<void> refresh() {
    return _loadFirstPageStories();
  }

  @action
  Future<void> retry() {
    return loadFeedItemsFuture = ObservableFuture(_loadFirstPageStories());
  }

  @action
  Future<void> loadInitialStories() {
    return loadFeedItemsFuture = ObservableFuture(_loadFirstPageStories());
  }

  Future<void> open(String url) {
    final uri = Uri.parse(url);
    return launchUrl(uri);
  }

  @action
  Future<void> loadNextPage() async {
    try {
      if (_isLoadingNextPage || (_currentPage > 1 && !hasNextPage)) {
        return;
      }
      _isLoadingNextPage = true;
      var feed = _storyFeedType == StoryFeedType.top
          ? (await _hnpwaClient.news(page: _currentPage))
          : (await _hnpwaClient.newest(page: _currentPage));
      // some items from the official API don't have a URL but the HNPWA API will put "item?={id}" as the URL so need to filter those out
      feedItems.addAll(feed.items!.where((fi) {
        var uri = Uri.tryParse(fi.url!);
        return uri != null && uri.hasScheme;
      }));
      hasNextPage = feed.hasNextPage;
      _currentPage++;
    } finally {
      _isLoadingNextPage = false;
    }
  }

  @action
  Future<void> _loadFirstPageStories() async {
    feedItems.clear();
    _currentPage = 1;
    await loadNextPage();
  }
}
