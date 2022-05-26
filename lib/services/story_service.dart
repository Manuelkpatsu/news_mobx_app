import 'package:url_launcher/url_launcher.dart';

class StoryService {
  StoryService();

  Future<void> openInBrowser(String url) async {
    final uri = Uri.parse(url);

    canLaunchUrl(uri).then((bool result) {
      if (result == true) {
        return launchUrl(uri);
      } else {
        throw Exception('Could not open $url');
      }
    });
  }

  Future<void> open(String url) async {
    final uri = Uri.parse(url);

    canLaunchUrl(uri).then((bool result) {
      if (result == true) {
        return launchUrl(uri);
      } else {
        throw Exception('Could not open $url');
      }
    });
  }
}
