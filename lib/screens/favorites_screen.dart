import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_mobx_app/stores/favorites_store.dart';
import 'package:news_mobx_app/widgets/story.dart';

class FavoritesScreen extends StatefulWidget {
  final FavoritesStore store;

  const FavoritesScreen(this.store, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.store.loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        if (widget.store.hasFavourites) {
          return ListView.builder(
            itemCount: widget.store.favourites.length,
            itemBuilder: (context, index) {
              return Story(widget.store.favourites[index]);
            },
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite),
                Text('No favourites here'),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
