// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoriesStore on _StoriesStore, Store {
  late final _$hasNextPageAtom =
      Atom(name: '_StoriesStore.hasNextPage', context: context);

  @override
  bool get hasNextPage {
    _$hasNextPageAtom.reportRead();
    return super.hasNextPage;
  }

  @override
  set hasNextPage(bool value) {
    _$hasNextPageAtom.reportWrite(value, super.hasNextPage, () {
      super.hasNextPage = value;
    });
  }

  late final _$feedItemsAtom =
      Atom(name: '_StoriesStore.feedItems', context: context);

  @override
  ObservableList<FeedItem> get feedItems {
    _$feedItemsAtom.reportRead();
    return super.feedItems;
  }

  @override
  set feedItems(ObservableList<FeedItem> value) {
    _$feedItemsAtom.reportWrite(value, super.feedItems, () {
      super.feedItems = value;
    });
  }

  late final _$loadFeedItemsFutureAtom =
      Atom(name: '_StoriesStore.loadFeedItemsFuture', context: context);

  @override
  ObservableFuture<dynamic>? get loadFeedItemsFuture {
    _$loadFeedItemsFutureAtom.reportRead();
    return super.loadFeedItemsFuture;
  }

  @override
  set loadFeedItemsFuture(ObservableFuture<dynamic>? value) {
    _$loadFeedItemsFutureAtom.reportWrite(value, super.loadFeedItemsFuture, () {
      super.loadFeedItemsFuture = value;
    });
  }

  late final _$loadingNextPageAtom =
      Atom(name: '_StoriesStore.loadingNextPage', context: context);

  @override
  bool get loadingNextPage {
    _$loadingNextPageAtom.reportRead();
    return super.loadingNextPage;
  }

  @override
  set loadingNextPage(bool value) {
    _$loadingNextPageAtom.reportWrite(value, super.loadingNextPage, () {
      super.loadingNextPage = value;
    });
  }

  late final _$loadNextPageAsyncAction =
      AsyncAction('_StoriesStore.loadNextPage', context: context);

  @override
  Future<void> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  late final _$_loadFirstPageStoriesAsyncAction =
      AsyncAction('_StoriesStore._loadFirstPageStories', context: context);

  @override
  Future<void> _loadFirstPageStories() {
    return _$_loadFirstPageStoriesAsyncAction
        .run(() => super._loadFirstPageStories());
  }

  late final _$_StoriesStoreActionController =
      ActionController(name: '_StoriesStore', context: context);

  @override
  Future<void> refresh() {
    final _$actionInfo = _$_StoriesStoreActionController.startAction(
        name: '_StoriesStore.refresh');
    try {
      return super.refresh();
    } finally {
      _$_StoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> retry() {
    final _$actionInfo = _$_StoriesStoreActionController.startAction(
        name: '_StoriesStore.retry');
    try {
      return super.retry();
    } finally {
      _$_StoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> loadInitialStories() {
    final _$actionInfo = _$_StoriesStoreActionController.startAction(
        name: '_StoriesStore.loadInitialStories');
    try {
      return super.loadInitialStories();
    } finally {
      _$_StoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasNextPage: ${hasNextPage},
feedItems: ${feedItems},
loadFeedItemsFuture: ${loadFeedItemsFuture},
loadingNextPage: ${loadingNextPage}
    ''';
  }
}
