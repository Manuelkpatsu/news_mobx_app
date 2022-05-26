import 'package:news_mobx_app/common/enums.dart';
import 'package:news_mobx_app/repository/client.dart';

import 'stories_store.dart';

class TopStoriesStore extends StoriesStore {
  TopStoriesStore(HnpwaClient hnpwaClient)
      : super(StoryFeedType.top, hnpwaClient);
}
