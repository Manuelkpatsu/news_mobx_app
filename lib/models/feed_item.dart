import 'package:equatable/equatable.dart';
import 'package:news_mobx_app/common/enums.dart';

import 'item_type.dart';

class FeedItem extends Equatable {
  final int id;
  final String title;
  final int? score;
  final String? by;
  final int time;
  final int descendants;
  final ItemType? type;
  final String? url;

  const FeedItem(
    this.id,
    this.title,
    this.score,
    this.by,
    this.time,
    this.descendants,
    this.type,
    this.url,
  );

  FeedItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        score = json['score'],
        by = json['by'],
        time = json['time'],
        descendants = json['descendants'],
        type = json['type'] != null ? itemTypeFromJson(json['type']) : null,
        url = json['url'];

  @override
  List<Object?> get props => [
        id,
        title,
        score,
        by,
        time,
        descendants,
        type,
        url,
      ];
}
