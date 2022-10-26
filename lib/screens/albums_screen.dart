import 'package:flutter/material.dart';
import 'package:get_to_know/components/custom_album_builder.dart';
import 'package:get_to_know/components/expandable_appbar.dart';
import 'package:get_to_know/controllers/albums_controller.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/loading.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/controllers/artist_controller.dart';

class AlbumsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: locator.get<ArtistController>().searchArtist(),
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
