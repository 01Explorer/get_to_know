import 'package:flutter/material.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/artist.dart';

class ArtistController extends ChangeNotifier {
  String? artistName;

  Future<Artist> searchArtist() async {
    Artist artist =
        await locator.get<SearchWebClient>().lookForArtistInfo(artistName);
    return artist;
  }

  setArtistName(String text) {
    artistName = text;
  }
}
