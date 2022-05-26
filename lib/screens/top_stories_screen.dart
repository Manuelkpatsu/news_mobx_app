import 'package:flutter/material.dart';
import 'package:news_mobx_app/stores/top_stories_store.dart';

import 'stories_screen.dart';

class TopStoriesScreen extends StoriesScreen<TopStoriesStore> {
  const TopStoriesScreen(TopStoriesStore store, {Key? key})
      : super(store, key: key);
}
