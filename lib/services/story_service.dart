import 'package:url_launcher/url_launcher.dart';

class StoryService {
  StoryService();

  Future<void> openInBrowser(String url) {
    final uri = Uri.parse(url);
    return launchUrl(uri);
  }

  Future<void> open(String url) {
    final uri = Uri.parse(url);
    return launchUrl(uri);
  }
}
