import 'package:flutter/material.dart';
import 'package:get_to_know/components/background_image.dart';
import 'package:get_to_know/components/sections/artist_image_section.dart';
import 'package:get_to_know/components/standard_bottom_bar.dart';
import 'package:get_to_know/components/top_tracks_future_builder.dart';
import 'package:get_to_know/models/artist.dart';

class TopTracksScreen extends StatelessWidget {
  final Artist artist;
  const TopTracksScreen({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(
            imagePath: artist.imagePath!,
          ),
          Column(
            children: [
              ArtistImageSection(selectedArtist: artist),
              Expanded(child: TopTracksFutureBuilder(selectedArtist: artist))
            ],
          )
        ],
      ),
      bottomNavigationBar: StandardBottomBar(),
    );
  }
}
