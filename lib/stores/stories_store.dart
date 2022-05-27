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

  _StoriesStore(this._storyFeedType, this._hnpwaClient);

  @observable
  ObservableFuture<List<FeedItem>>? loadFeedItemsFuture;

  @action
  Future fetchStories() =>
      loadFeedItemsFuture = _storyFeedType == StoryFeedType.top
          ? ObservableFuture(_hnpwaClient.news())
          : ObservableFuture(_hnpwaClient.newest());

  void loadNews() {
    fetchStories();
  }

  void open(String? url) {
    Uri uri = Uri.parse(url ?? '');

    canLaunchUrl(uri).then((bool result) {
      if (result == true) {
        launchUrl(uri);
      } else {
        throw Exception('Could not open $url');
      }
    });
  }
}
