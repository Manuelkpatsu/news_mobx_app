import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_mobx_app/models/feed.dart';

class HnpwaClient {
  final Client client;
  final Uri baseUri;

  HnpwaClient({
    Client? client,
    Uri? baseUri,
  })  : client = client ?? Client(),
        baseUri = Uri.parse('https://api.hnpwa.com/v0/');

  Future<Feed> news({int page = 1}) {
    assert(page >= 1 && page <= 10, 'News endpoints provide pages 1-10');

    return _fetchFeed(
      url: _buildUrl('news/$page.json'),
      currentPage: page,
      maxPages: 10,
    );
  }

  Future<Feed> newest({int page = 1}) {
    assert(page >= 1 && page <= 12, 'Newest endpoints provide pages 1-12');

    return _fetchFeed(
      url: _buildUrl('newest/$page.json'),
      currentPage: page,
      maxPages: 12,
    );
  }

  String _buildUrl(String path) {
    return baseUri
        .replace(path: '${baseUri.pathSegments.join('/')}$path')
        .toString();
  }

  Future<Feed> _fetchFeed({
    required String url,
    required int currentPage,
    required int maxPages,
  }) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Feed.from(
        items: (_decodeResponse(response) as List).cast<Map<String, dynamic>>(),
        currentPage: currentPage,
        nextPage: currentPage < maxPages ? currentPage + 1 : null,
      );
    } else {
      throw Exception(
        '${response.statusCode} Error Fetching HNPWA Results: ${response.body}',
      );
    }
  }

  _decodeResponse(Response response) =>
      json.decode(utf8.decode(response.bodyBytes));
}
