import 'package:flutter/material.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';

class AlbumsController extends ChangeNotifier {
  Future<List<Album>?> searchAlbums(String? artistId) async {
    final List<Album> artistAlbums =
        await locator.get<SearchWebClient>().lookForAlbums(artistId);
    return artistAlbums;
  }
}
