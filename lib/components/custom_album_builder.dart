import 'package:flutter/material.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/screens/tracks_screen.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class CustomAlbumListBuilder extends StatelessWidget {
  const CustomAlbumListBuilder({
    Key? key,
    required this.listAlbums,
  }) : super(key: key);

  final List<Album> listAlbums;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listAlbums.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TracksScreen(
                  chosenAlbum: listAlbums[index],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(width: 2, color: ThemeColors.primaryColor),
            ),
            tileColor: Colors.white,
            leading: Image.network(listAlbums[index].imagePath!),
            title: Text(
              '${listAlbums[index].name}',
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '${listAlbums[index].releaseDate}',
              style: const TextStyle(color: Colors.black),
            ),
            trailing: Text(
              'Tracks\n${listAlbums[index].totalTracks}',
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
