import 'package:flutter/material.dart';
import 'package:get_to_know/components/suggested_artists_list_builder.dart';

class SuggestedArtistsSection extends StatelessWidget {
  const SuggestedArtistsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suggested Artists',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'View All',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 200,
          child: SuggestedArtistsListBuilder(),
        ),
      ],
    );
  }
}
