// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoriesStore on _StoriesStore, Store {
  late final _$loadFeedItemsFutureAtom =
      Atom(name: '_StoriesStore.loadFeedItemsFuture', context: context);

  @override
  ObservableFuture<List<FeedItem>>? get loadFeedItemsFuture {
    _$loadFeedItemsFutureAtom.reportRead();
    return super.loadFeedItemsFuture;
  }

  @override
  set loadFeedItemsFuture(ObservableFuture<List<FeedItem>>? value) {
    _$loadFeedItemsFutureAtom.reportWrite(value, super.loadFeedItemsFuture, () {
      super.loadFeedItemsFuture = value;
    });
  }

  late final _$_StoriesStoreActionController =
      ActionController(name: '_StoriesStore', context: context);

  @override
  Future<dynamic> fetchStories() {
    final _$actionInfo = _$_StoriesStoreActionController.startAction(
        name: '_StoriesStore.fetchStories');
    try {
      return super.fetchStories();
    } finally {
      _$_StoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadFeedItemsFuture: ${loadFeedItemsFuture}
    ''';
  }
}
