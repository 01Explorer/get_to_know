import 'package:flutter/material.dart';
import 'package:get_to_know/components/top_tracks_item_builder.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/loading.dart';

class TopTracksFutureBuilder extends StatelessWidget {
  const TopTracksFutureBuilder({
    Key? key,
    required this.selectedArtist,
  }) : super(key: key);

  final Artist selectedArtist;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator
          .get<SearchWebClient>()
          .lookForArtistTopTracks(selectedArtist.spotifyId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Album> keys = snapshot.data.keys.toList();

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return TopTracksListItem(
                keys: keys,
                snapshot: snapshot,
              );
            default:
              break;
          }
        }
        return const Loading();
      },
    );
  }
}
