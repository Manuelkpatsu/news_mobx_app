import 'package:flutter/material.dart';
import 'package:news_mobx_app/stores/new_stories_store.dart';

import 'stories_screen.dart';

class NewStoriesScreen extends StoriesScreen<NewStoriesStore> {
  const NewStoriesScreen(NewStoriesStore store, {Key? key})
      : super(store, key: key);
}
