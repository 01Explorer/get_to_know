import 'package:flutter/material.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class TrackItem extends StatelessWidget {
  const TrackItem({
    Key? key,
    this.imagePath,
    this.albumName,
    required this.trackName,
    this.artists,
  }) : super(key: key);

  final String? imagePath;
  final String? albumName;
  final List<String>? artists;
  final String trackName;

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
          trackName,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          albumName ??
              artists.toString().replaceAll('[', '').replaceAll(']', ''),
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: SizedBox(
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.play_arrow_outlined,
                size: 30,
                color: ThemeColors.alternativeFontColor,
              ),
              Icon(
                Icons.more_vert,
                size: 30,
                color: ThemeColors.alternativeFontColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
