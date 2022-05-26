import 'feed_item.dart';

class Feed {
  final List<FeedItem>? items;
  final int? currentPage;
  final int? nextPage;

  Feed({
    required this.items,
    required this.currentPage,
    required this.nextPage,
  });

  bool get hasNextPage => nextPage != null;

  factory Feed.from({
    required List<Map<String, dynamic>>? items,
    required int? currentPage,
    required int? nextPage,
  }) {
    return Feed(
      items:
          items != null ? items.map((i) => FeedItem.fromJson(i)).toList() : [],
      currentPage: currentPage,
      nextPage: nextPage,
    );
  }

  @override
  String toString() {
    return 'Feed{items: $items, currentPage: $currentPage, nextPage: $nextPage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Feed &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          currentPage == other.currentPage &&
          nextPage == other.nextPage;

  @override
  int get hashCode => items.hashCode ^ currentPage.hashCode ^ nextPage.hashCode;
}
