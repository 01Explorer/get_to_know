import 'package:flutter/material.dart';
import 'package:get_to_know/components/album_list_view_builder.dart';
import 'package:get_to_know/components/related_artists_list_view_builder.dart';
import 'package:get_to_know/components/sections/top_tracks_section.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/loading.dart';

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

  void controllerTap(int index) {
    tapped = index;
    notifyListeners();
  }

  Widget returnBuild() {
    switch (tapped) {
      case 0:
        return TopTracksSection(selectedArtist: artist);
      case 1:
        return AlbumListViewBuilder(artist: artist);
      case 2:
        return RelatedArtistsListViewBuilder(artistId: artist.spotifyId!);
      default:
    }
    notifyListeners();
    return Loading();
  }
}
