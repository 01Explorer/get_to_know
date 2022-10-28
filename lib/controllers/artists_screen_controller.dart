import 'package:flutter/material.dart';
import 'package:get_to_know/models/artist.dart';

class ArtistsScreenController extends ChangeNotifier {
  final List<String> options = ['Top Songs', 'Albums', 'Artists Related'];
  late Artist artist;
  int tapped = 0;

  bool viewAll = false;

  setArtist(Artist object) {
    artist = object;
  }

  void setTapOnArtistOptions(int index) {
    tapped = index;
    notifyListeners();
  }
}
