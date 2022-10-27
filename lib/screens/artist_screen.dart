import 'package:flutter/material.dart';
import 'package:get_to_know/components/background_image.dart';
import 'package:get_to_know/components/options_list_builder.dart';
import 'package:get_to_know/components/sections/artist_image_section.dart';
import 'package:get_to_know/components/sections/top_tracks_section.dart';
import 'package:get_to_know/components/standard_bottom_bar.dart';
import 'package:get_to_know/controllers/artists_screen_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/artist.dart';

class ArtistScreen extends StatefulWidget {
  final Artist selectedArtist;
  const ArtistScreen({Key? key, required this.selectedArtist})
      : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(
            selectedArtist: widget.selectedArtist,
          ),
          Column(
            children: [
              ArtistImageSection(selectedArtist: widget.selectedArtist),
              const OptionsListBuilder(),
              TopTracksSection(selectedArtist: widget.selectedArtist)
            ],
          )
        ],
      ),
      bottomNavigationBar: const StandardBottomBar(),
    );
  }
}
