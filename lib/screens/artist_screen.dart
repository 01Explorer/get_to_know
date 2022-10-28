import 'package:flutter/material.dart';
import 'package:get_to_know/components/album_list_view_builder.dart';
import 'package:get_to_know/components/background_image.dart';
import 'package:get_to_know/components/options_list_builder.dart';
import 'package:get_to_know/components/related_artists_list_view_builder.dart';
import 'package:get_to_know/components/sections/artist_image_section.dart';
import 'package:get_to_know/components/sections/top_tracks_section.dart';
import 'package:get_to_know/components/standard_bottom_bar.dart';
import 'package:get_to_know/controllers/artists_screen_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/loading.dart';

class ArtistScreen extends StatefulWidget {
  final Artist selectedArtist;
  const ArtistScreen({Key? key, required this.selectedArtist})
      : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  final ArtistsScreenController _artistScreenController =
      locator.get<ArtistsScreenController>();
  @override
  void initState() {
    super.initState();

    _artistScreenController.viewAll = false;
    _artistScreenController.setArtist(widget.selectedArtist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(
            imagePath: widget.selectedArtist.imagePath!,
          ),
          Column(
            children: [
              ArtistImageSection(selectedArtist: widget.selectedArtist),
              const ArtistOptionsListBuilder(),
              Expanded(
                child: AnimatedBuilder(
                  animation: _artistScreenController,
                  builder: (context, _) {
                    return buildListViewBasedOnOption();
                  },
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const StandardBottomBar(),
    );
  }

  Widget buildListViewBasedOnOption() {
    if (_artistScreenController.tapped == 0) {
      return TopTracksSection(selectedArtist: _artistScreenController.artist);
    }
    if (_artistScreenController.tapped == 1) {
      return AlbumListViewBuilder(artist: _artistScreenController.artist);
    }
    if (_artistScreenController.tapped == 2) {
      return RelatedArtistsListViewBuilder(
          artistId: _artistScreenController.artist.spotifyId!);
    }
    return const Loading();
  }
}
