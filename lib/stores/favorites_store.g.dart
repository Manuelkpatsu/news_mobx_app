// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStore, Store {
  Computed<bool>? _$hasFavouritesComputed;

  @override
  bool get hasFavourites =>
      (_$hasFavouritesComputed ??= Computed<bool>(() => super.hasFavourites,
              name: '_FavoritesStore.hasFavourites'))
          .value;

  late final _$favouritesAtom =
      Atom(name: '_FavoritesStore.favourites', context: context);

  @override
  ObservableList<FeedItem> get favourites {
    _$favouritesAtom.reportRead();
    return super.favourites;
  }

  @override
  set favourites(ObservableList<FeedItem> value) {
    _$favouritesAtom.reportWrite(value, super.favourites, () {
      super.favourites = value;
    });
  }

  late final _$_FavoritesStoreActionController =
      ActionController(name: '_FavoritesStore', context: context);

  @override
  void loadFavourites() {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
        name: '_FavoritesStore.loadFavourites');
    try {
      return super.loadFavourites();
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFavourite(FeedItem item) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
        name: '_FavoritesStore.addFavourite');
    try {
      return super.addFavourite(item);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavourite(FeedItem item) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
        name: '_FavoritesStore.removeFavourite');
    try {
      return super.removeFavourite(item);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favourites: ${favourites},
hasFavourites: ${hasFavourites}
    ''';
  }
}
