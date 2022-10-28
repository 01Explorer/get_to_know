import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ArtistItem extends StatelessWidget {
  const ArtistItem({
    Key? key,
    this.imagePath,
    required this.name,
    required this.followers,
    required this.popularity,
  }) : super(key: key);

  final String? imagePath;
  final String name;
  final int followers;
  final int popularity;

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
            name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            '${intl.NumberFormat.decimalPattern().format(followers)} Followers',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Text(
            '$popularity\nPopularity',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          )),
    );
  }
}
