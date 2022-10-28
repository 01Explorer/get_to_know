import 'package:flutter/material.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';

class ArtistsScreenController extends ChangeNotifier {
  final List<String> options = ['Top Songs', 'Albums', 'Artists Related'];
  late Artist artist;
  int tapped = 0;
  List<Artist> artistResult = [];
  List<Album> albumResult = [];
  List toBeBuilt = [];

  bool viewAll = false;

  setArtist(Artist object) {
    artist = object;
  }

  void setTapped(int index) {
    tapped = index;
    notifyListeners();
  }
}
