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

  Future<List<Artist>?> searchRelatedArtists(String? artistId) async {
    final List<Artist> artistAlbums =
        await locator.get<SearchWebClient>().lookForArtistRelated(artistId);
    return artistAlbums;
  }

  setArtistName(String text) {
    artistName = text;
  }
}
