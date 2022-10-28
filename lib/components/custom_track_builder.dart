import 'package:flutter/material.dart';
import 'package:get_to_know/components/track_item.dart';
import 'package:get_to_know/controllers/track_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/track.dart';

// ignore: must_be_immutable
class CustomTrackListBuilder extends StatefulWidget {
  CustomTrackListBuilder(
      {Key? key,
      required this.listTracks,
      this.searchString = '',
      required this.selectedAlbum})
      : super(key: key);

  final Album selectedAlbum;
  final List<Track> listTracks;
  String searchString;

  @override
  State<CustomTrackListBuilder> createState() => _CustomTrackListBuilderState();
}

class _CustomTrackListBuilderState extends State<CustomTrackListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listTracks.length,
      itemBuilder: (BuildContext context, int index) {
        return widget.listTracks[index].name!
                .toLowerCase()
                .contains(widget.searchString)
            ? InkWell(
                onTap: () => locator
                    .get<TrackController>()
                    .launchUrl(widget.listTracks[index].spotifyUrl),
                child: TrackItem(
                    imagePath: widget.selectedAlbum.imagePath!,
                    albumName: widget.selectedAlbum.name!,
                    trackName: widget.listTracks[index].name!),
              )
            : Container();
      },
    );
  }
}
