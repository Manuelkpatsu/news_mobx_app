import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:news_mobx_app/models/feed_item.dart';
import 'package:news_mobx_app/services/preferences_service.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  final PreferencesService _preferencesService;

  _FavoritesStore(this._preferencesService);

  @observable
  ObservableList<FeedItem> favourites = ObservableList<FeedItem>();

  @computed
  bool get hasFavourites => favourites.isNotEmpty;

  bool isInFavourites(FeedItem feedItem) =>
      favourites.any((f) => f.id == feedItem.id);

  @action
  void loadFavourites() {
    _preferencesService.favourites
        .map((f) => FeedItem.fromJson(jsonDecode(f)))
        .forEach((f) => favourites.add(f));
  }

  @action
  void addFavourite(FeedItem item) {
    favourites.add(item);
    _saveFavourites();
  }

  @action
  void removeFavourite(FeedItem item) {
    favourites.removeWhere((fi) => fi.id == item.id);
    _saveFavourites();
  }

  void _saveFavourites() {
    _preferencesService.favourites = favourites.map((fi) {
      return jsonEncode(<String, Object>{
        'id': fi.id,
        'title': fi.title,
        'score': fi.score!,
        'user': fi.by!,
        'time': fi.time,
        'descendants': fi.descendants,
        'url': fi.url!,
      });
    }).toList();
  }
}
