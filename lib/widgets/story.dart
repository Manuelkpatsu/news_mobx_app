import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:news_mobx_app/models/feed_item.dart';
import 'package:news_mobx_app/services/sharing_service.dart';
import 'package:news_mobx_app/services/story_service.dart';
import 'package:news_mobx_app/stores/favorites_store.dart';
import 'package:provider/provider.dart';

import 'text_spacer.dart';

class Story extends StatelessWidget {
  final FeedItem _item;

  const Story(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storyService = Provider.of<StoryService>(context);
    final sharingService = Provider.of<SharingService>(context);
    final favouritesStore = Provider.of<FavoritesStore>(context);

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: Row(
          children: [
            Center(
              child: CircleAvatar(
                child: Center(
                  child: Text(
                    _item.score.toString(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSpacer(
                      Text(_item.title,
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    TextSpacer(
                      Text(
                        _item.url!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    TextSpacer(
                      Text(
                        '${_item.by} - ${DateFormat().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              _item.time * 1000),
                        )}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    Text(
                      '${_item.descendants} ${_item.descendants == 1 ? 'comment' : 'comments'}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        await storyService.open(_item.url!);
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return Observer(
              builder: (_) => Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: Text(favouritesStore.isInFavourites(_item)
                        ? 'Remove from favourites'
                        : 'Add to favourites'),
                    onTap: () {
                      favouritesStore.isInFavourites(_item)
                          ? favouritesStore.removeFavourite(_item)
                          : favouritesStore.addFavourite(_item);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.open_in_browser),
                    title: const Text('Open in browser'),
                    onTap: () async {
                      await storyService.openInBrowser(_item.url!);
                      Navigator.of(context).pop();
                    },
                  ),
                  if (_item.url != null)
                    ListTile(
                      leading: const Icon(Icons.share),
                      title: const Text('Share'),
                      onTap: () async {
                        await sharingService.share(_item.url!);
                        Navigator.of(context).pop();
                      },
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
