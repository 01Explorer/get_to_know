import 'dart:convert';

import 'package:get_to_know/http/webclient.dart';
import 'package:http/http.dart';

class SearchWebClient {
  String? accessToken;
  // String? artistId;
  List? albums;

  static Future<SearchWebClient> createAsync() async {
    SearchWebClient search = SearchWebClient();
    search.accessToken = await getAccess();
    return search;
  }

  Future lookForArtistInfo(String? searchTerm) async {
    // Get Artist Info
    final Response responseId = await client.get(
      searchUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {'q': searchTerm, 'type': 'artist'},
    );
    return jsonDecode(responseId.body);
  }

  Future lookForAlbums(String? artistId) async {
    final Response responseAlbums =
        await client.get(setArtistUrl(artistId), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    }, params: {
      'available_markets': 'BR',
    });
    albums = jsonDecode(responseAlbums.body)['items'];
  }

  Uri setArtistUrl(String? artistId) {
    String initial = artistUrl.toString();
    String newUrl = '$initial/$artistId/albums/';
    return Uri.parse(newUrl);
  }
}
