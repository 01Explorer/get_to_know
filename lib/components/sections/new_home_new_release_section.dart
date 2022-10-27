import 'package:flutter/material.dart';
import 'package:get_to_know/components/new_releases_list_builder.dart';

class NewReleasesSection extends StatelessWidget {
  final String title;

  const NewReleasesSection({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
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
          height: 220,
          child: NewReleasesListBuilder(),
        ),
      ],
    );
  }
}
