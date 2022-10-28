import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_to_know/components/custom_album_builder.dart';
import 'package:get_to_know/components/expandable_appbar.dart';
import 'package:get_to_know/controllers/albums_controller.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/loading.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/controllers/artist_controller.dart';

class AlbumsScreen extends StatelessWidget {
  final ArtistController _clientArtist = locator.get<ArtistController>();
  final SearchWebClient _clientSearch = locator.get<SearchWebClient>();

  AlbumsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _clientArtist.searchArtist().catchError((e) {
          _clientSearch.showFailureMessage(context,
              message: 'Timeout reaching the data');
        }, test: (e) => e is TimeoutException).catchError((e) {
          _clientSearch.showFailureMessage(context, message: e.message);
        }, test: (e) => e is HttpException).catchError((e) {
          _clientSearch.showFailureMessage(context, message: e.message);
        }),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final Artist artist = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                return ExpandableAppBar(
                  title: artist.name!,
                  imagePath: artist.imagePath!,
                  widget: FutureBuilder(
                    future: locator
                        .get<AlbumsController>()
                        .searchAlbums(artist.spotifyId),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      final List<Album>? listAlbums = snapshot.data;
                      if (snapshot.hasData && listAlbums != null) {
                        return CustomAlbumListBuilder(listAlbums: listAlbums);
                      }
                      return const Loading();
                    },
                  ),
                );
            }
          }
          return const Loading();
        },
      ),
    );
  }
}
