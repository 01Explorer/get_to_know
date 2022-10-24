import 'package:flutter/cupertino.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/track.dart';

class TrackController extends ChangeNotifier {
  Future<List<Track>> searchTracks(String albumId) async {
    final List<Track> listTracks =
        await locator.get<SearchWebClient>().lookForTracks(albumId);
    return listTracks;
  }
}
