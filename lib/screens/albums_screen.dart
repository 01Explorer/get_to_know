import 'package:flutter/material.dart';
import 'package:get_to_know/provider/artist_provider.dart';
import 'package:provider/provider.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtistProvider>(
      builder: (context, artist, child) {
        if (artist.artistName != null) {
          return Text(artist.artistName!);
        }
        return AlertDialog(
          icon: Icon(Icons.account_balance),
        );
      },
    );
  }
}
