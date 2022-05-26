import 'package:flutter/material.dart';
import 'package:news_mobx_app/stores/stories_store.dart';

class StoriesScreen<T extends StoriesStore> extends StatefulWidget {
  final T store;

  const StoriesScreen(this.store, {Key? key}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState<T extends StoriesStore> extends State<StoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.store.loadInitialStories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
