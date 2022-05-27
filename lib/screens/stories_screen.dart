import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:news_mobx_app/models/feed_item.dart';
import 'package:news_mobx_app/stores/stories_store.dart';

import '../widgets/placeholder_stories.dart';
import '../widgets/story.dart';

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
    widget.store.loadNews();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        final future = widget.store.loadFeedItemsFuture!;

        switch (future.status) {
          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Oops something went wrong'),
                  ElevatedButton(
                    child: const Text('Retry'),
                    onPressed: () => widget.store.fetchStories,
                  ),
                ],
              ),
            );
          case FutureStatus.fulfilled:
            final List<FeedItem> items = future.result;

            return RefreshIndicator(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final item = items[index];

                  return Story(item);
                },
              ),
              onRefresh: () => widget.store.fetchStories(),
            );
          case FutureStatus.pending:
          default:
            return const PlaceholderStories();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
