import 'package:flutter/material.dart';
import 'package:get_to_know/components/search_album_item.dart';
import 'package:get_to_know/controllers/albums_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/loading.dart';
import 'package:get_to_know/screens/tracks_screen.dart';

class AlbumListViewBuilder extends StatelessWidget {
  final Artist artist;
  const AlbumListViewBuilder({Key? key, required this.artist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: locator.get<AlbumsController>().searchAlbums(artist.spotifyId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Album> albums = snapshot.data;
              return ListView.builder(
                itemCount: albums.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TracksScreen(
                            chosenAlbum: albums[index],
                          ),
                        )),
                    child: AlbumItem(
                      albumName: albums[index].name!,
                      artists: albums[index].artist!,
                      imagePath: albums[index].imagePath,
                      totalTracks: albums[index].totalTracks!,
                    ),
                  );
                },
              );
            }
          }
          return const Loading();
        },
      ),
    );
  }
}
