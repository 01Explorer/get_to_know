import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_to_know/components/loading.dart';
import 'package:get_to_know/controllers/track_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/controllers/albums_controller.dart';
import 'package:get_to_know/controllers/artist_controller.dart';
import 'package:get_to_know/models/track.dart';

class AlbumsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: locator.get<ArtistController>().searchArtist(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              // TODO: Handle this case.
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final Artist artist = snapshot.data;

              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${artist.name}'),
                      Text('${artist.followers}'),
                      Text('${artist.genres}'),
                      Text('${artist.popularity}'),
                      Text('${artist.spotifyId}'),
                      Image.network(
                          artist.imagePath != null ? artist.imagePath! : ''),
                      FutureBuilder(
                        future: locator
                            .get<AlbumsController>()
                            .searchAlbums(artist.spotifyId),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          final List<Album> listAlbums =
                              snapshot.hasData ? snapshot.data : [];
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: listAlbums.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading:
                                    Image.network(listAlbums[index].imagePath!),
                                title: Text(listAlbums[index].name!),
                                subtitle: Text(listAlbums[index].releaseDate!),
                                trailing:
                                    Text('${listAlbums[index].totalTracks}'),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
          }
          return Loading();
        },
      ),
    );
  }
}
