import 'package:news_mobx_app/common/enums.dart';

ItemType itemTypeFromJson(String type) {
  switch (type) {
    case 'job':
      return ItemType.job;
    case 'comment':
      return ItemType.comment;
    case 'poll':
      return ItemType.poll;
    case 'pollopt':
      return ItemType.pollopt;
    case 'story':
    case 'link':
    default:
      return ItemType.story;
  }
}
