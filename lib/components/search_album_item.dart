import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    Key? key,
    this.imagePath,
    required this.albumName,
    required this.artists,
    required this.totalTracks,
  }) : super(key: key);

  final String? imagePath;
  final String albumName;
  final String artists;
  final int totalTracks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: imagePath != null
                    ? DecorationImage(
                        image: NetworkImage(imagePath!),
                      )
                    : const DecorationImage(
                        image: AssetImage('assets/images/standard_disc.png'),
                      )),
          ),
          title: Text(
            albumName,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            artists,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Text(
            '$totalTracks\nTracks',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          )),
    );
  }
}
