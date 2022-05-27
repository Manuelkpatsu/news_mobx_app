import 'dart:convert';

import 'package:news_mobx_app/common/enums.dart';
import 'package:news_mobx_app/models/feed_item.dart';
import 'package:http/http.dart' as http;

extension on StoryFeedType {
  Uri get uri {
    switch (this) {
      case StoryFeedType.latest:
        return Uri.parse(
            'https://hacker-news.firebaseio.com/v0/newstories.json');
      case StoryFeedType.top:
        return Uri.parse(
            'https://hacker-news.firebaseio.com/v0/topstories.json');
    }
  }
}

class HnpwaClient {
  Future<List<FeedItem>> news() async {
    final ids = await _getItems(StoryFeedType.top);
    final items = await Future.wait(ids.map(_getItem));

    return items.toList(growable: false);
  }

  Future<List<FeedItem>> newest() async {
    final ids = await _getItems(StoryFeedType.latest);
    final items = await Future.wait(ids.map(_getItem));

    return items.toList(growable: false);
  }

  Future<FeedItem> _getItem(int id) async {
    final response = await http
        .get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json'));
    Map<String, dynamic> data = jsonDecode(response.body);

    return FeedItem.fromJson(data);
  }

  Future<List<int>> _getItems(StoryFeedType type, {int count = 25}) async {
    final response = await http.get(type.uri);

    final ids = (jsonDecode(response.body) as List)
        .take(count)
        .map((e) => e as int)
        .toList(growable: false);

    return ids;
  }
}
