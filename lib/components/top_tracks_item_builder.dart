import 'package:flutter/material.dart';
import 'package:get_to_know/components/track_item.dart';
import 'package:get_to_know/controllers/artists_screen_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/track.dart';

class TopTracksListItem extends StatelessWidget {
  TopTracksListItem({
    Key? key,
    required this.keys,
    required this.snapshot,
  }) : super(key: key);
  final List<Album> keys;
  final AsyncSnapshot snapshot;

  final _controller = locator.get<ArtistsScreenController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _controller.viewAll ? keys.length : 5,
      itemBuilder: (BuildContext context, int index) {
        Track values = snapshot.data[keys[index]];
        return TrackItem(
          albumName: keys[index].name!,
          trackName: values.name!,
          imagePath: keys[index].imagePath!,
        );
      },
    );
  }
}
