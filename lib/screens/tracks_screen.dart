import 'package:flutter/material.dart';
import 'package:get_to_know/components/custom_track_builder.dart';
import 'package:get_to_know/controllers/track_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/track.dart';
import 'package:get_to_know/screens/loading.dart';

class TracksScreen extends StatefulWidget {
  const TracksScreen({Key? key, required this.chosenAlbum}) : super(key: key);
  final Album chosenAlbum;

  @override
  State<TracksScreen> createState() => _TracksScreenState();
}

class _TracksScreenState extends State<TracksScreen> {
  String searchString = '';
  @override
  Widget build(BuildContext context) {
    final TrackController _trackController = locator.get<TrackController>();
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 35,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
              future:
                  _trackController.searchTracks(widget.chosenAlbum.albumId!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  List<Track> listTracks = snapshot.data;
                  return CustomTrackListBuilder(
                    listTracks: listTracks,
                    albumImagePath: widget.chosenAlbum.imagePath!,
                    searchString: searchString,
                  );
                }
                return const Loading();
              },
            ),
          ),
        ],
      ),
    );
  }
}
