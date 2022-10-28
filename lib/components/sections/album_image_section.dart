import 'package:flutter/material.dart';
import 'package:get_to_know/models/album.dart';

class AlbumImageSection extends StatelessWidget {
  const AlbumImageSection({Key? key, required this.selectedAlbum})
      : super(key: key);
  final Album selectedAlbum;

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
          selectedAlbum.name!,
          style: Theme.of(context).textTheme.displaySmall,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Text(
          'Released on ${selectedAlbum.releaseDate!}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(
            height: 24,
            child: Text(
              'From ${selectedAlbum.artist!}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )
      ],
    );
  }
}
