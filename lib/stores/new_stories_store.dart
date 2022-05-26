import 'package:news_mobx_app/common/enums.dart';
import 'package:news_mobx_app/repository/client.dart';

import 'stories_store.dart';

class NewStoriesStore extends StoriesStore {
  NewStoriesStore(HnpwaClient hnpwaClient)
      : super(StoryFeedType.latest, hnpwaClient);
}
