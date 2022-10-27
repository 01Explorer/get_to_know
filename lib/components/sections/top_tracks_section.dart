import 'package:flutter/material.dart';
import 'package:get_to_know/components/top_tracks_future_builder.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/artist_screen.dart';

class TopTracksSection extends StatefulWidget {
  final Artist selectedArtist;
  const TopTracksSection({super.key, required this.selectedArtist});

  @override
  State<TopTracksSection> createState() => _TopTracksSectionState();
}

class _TopTracksSectionState extends State<TopTracksSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 300,
            child: TopTracksFutureBuilder(
              selectedArtist: widget.selectedArtist,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        )
      ],
    );
  }
}
