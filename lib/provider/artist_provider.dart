import 'package:flutter/material.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/models/artist.dart';

class ArtistProvider extends ChangeNotifier {
  String? artistName;

  Future<Artist?> searchArtist(String text) async {
    final SearchWebClient search = await SearchWebClient.createAsync();
    setArtistName(text);
    final Map<String, dynamic> response;
    final Artist artist;
    response = await search.lookForArtistInfo(artistName);
    artist = buildArtist(response);
    return artist;
  }

  setArtistName(String text) {
    artistName = text;
  }

  Artist buildArtist(Map<String, dynamic> response) {
    return Artist(
      artistName,
      response['artists']['items'][0]['id'],
      followers: response['artists']['items'][0]['followers']['total'],
      genres: response['artists']['items'][0]['genres'],
      imagePath: response['artists']['items'][0]['images'][0]['url'],
      popularity: response['artists']['items'][0]['popularity'],
    );
  }
}
