import 'package:share_plus/share_plus.dart';

class SharingService {
  Future<void> share(String url) {
    return Share.share(url);
  }
}
