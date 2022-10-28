import 'package:flutter/material.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/models/track.dart';

class SearchController extends ChangeNotifier {
  int tapped = 0;
  String _searchTerm = '';
  List<String> options = ['Artist', 'Album', 'Track'];
  List<String> hintText = ['The Weeknd', 'The Car', 'Snowchild'];
  List<Artist> artistResult = [];
  List<Album> albumResult = [];
  List<Track> trackResult = [];
  List toBeBuilt = [];

  void setTapped(value) {
    tapped = value;
    notifyListeners();
  }

  void setSearch(String value) {
    _searchTerm = value;
    search();
  }

  Future<void> search() async {
    switch (tapped) {
      case 0:
        artistResult = await locator
            .get<SearchWebClient>()
            .generalSearch(_searchTerm, options[tapped].toLowerCase());
        break;
      case 1:
        albumResult = await locator
            .get<SearchWebClient>()
            .generalSearch(_searchTerm, options[tapped].toLowerCase());
        break;
      case 2:
        trackResult = await locator
            .get<SearchWebClient>()
            .generalSearch(_searchTerm, options[tapped].toLowerCase());
        break;
      default:
    }
    setBuildList();
  }

  void setBuildList() {
    switch (tapped) {
      case 0:
        toBeBuilt = artistResult;
        break;
      case 1:
        toBeBuilt = albumResult;
        break;
      case 2:
        toBeBuilt = trackResult;
        break;
      default:
    }
    notifyListeners();
  }
}
