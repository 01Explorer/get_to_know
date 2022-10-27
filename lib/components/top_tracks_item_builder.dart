import 'package:flutter/material.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/track.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class TopTracksListItem extends StatelessWidget {
  const TopTracksListItem({
    Key? key,
    required this.keys,
    required this.snapshot,
  }) : super(key: key);

  final List<Album> keys;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        Track values = snapshot.data[keys[index]];
        return SizedBox(
          height: 55,
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(keys[index].imagePath!),
                ),
              ),
            ),
            title: Text(
              values.name!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              keys[index].name!,
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
      },
    );
  }
}
