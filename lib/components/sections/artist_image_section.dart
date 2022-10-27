import 'package:flutter/material.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:intl/intl.dart' as intl;

class ArtistImageSection extends StatelessWidget {
  final Artist selectedArtist;

  const ArtistImageSection({super.key, required this.selectedArtist});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(Icons.arrow_back),
                    ),
                    Text(
                      'Home',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              const Icon(Icons.menu),
            ],
          ),
        ),
        const SizedBox(
          height: 160,
        ),
        Text(
          selectedArtist.name!,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          '${intl.NumberFormat.decimalPattern().format(selectedArtist.followers)} Followers',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            height: 24,
            width: 138,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white)),
            child: const Center(
              child: Text(
                'Follow',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
