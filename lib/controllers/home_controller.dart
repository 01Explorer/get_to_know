import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';

class HomeController extends ChangeNotifier {
  List<Album> itemsMusics = [];
  List<Artist> itemsArtists = [];
  bool alreadyRead = false;
  int bottomBarindex = 0;

  void setIndex(int value) {
    bottomBarindex = value;
  }

  Future<void> readJson() async {
    final getInst = locator.get<SearchWebClient>();
    final String responseMusic =
        await rootBundle.loadString('assets/home_data.json');
    final String responseArtists =
        await rootBundle.loadString('assets/home_artists_data.json');
    itemsMusics =
        getInst.parseAlbumResponse(jsonDecode(responseMusic)["albums"]);
    itemsArtists = getInst.parseArtistsResponse(jsonDecode(responseArtists));
    notifyListeners();
  }
}
