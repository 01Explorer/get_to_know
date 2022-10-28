import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_to_know/components/top_tracks_item_builder.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/loading.dart';

class TopTracksFutureBuilder extends StatelessWidget {
  TopTracksFutureBuilder({
    Key? key,
    required this.selectedArtist,
  }) : super(key: key);
  final Artist selectedArtist;

  final SearchWebClient _client = locator.get<SearchWebClient>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _client
          .lookForArtistTopTracks(selectedArtist.spotifyId)
          .catchError((e) {
        _client.showFailureMessage(context,
            message: 'Timeout reaching the data');
      }, test: (e) => e is TimeoutException).catchError((e) {
        _client.showFailureMessage(context, message: e.message);
      }, test: (e) => e is HttpException).catchError((e) {
        _client.showFailureMessage(context, message: e.message);
      }),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Album> keys = snapshot.data.keys.toList();

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Unkown Error');
            case ConnectionState.waiting:
              return const Loading();
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
