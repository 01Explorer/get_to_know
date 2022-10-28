import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/screens/tracks_screen.dart';

class NewReleasesBuilderItem extends StatelessWidget {
  const NewReleasesBuilderItem({
    Key? key,
    required HomeController controller,
    required this.index,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TracksScreen(
                chosenAlbum: _controller.itemsMusics[index],
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          width: 148,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 148,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                          _controller.itemsMusics[index].imagePath!),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _controller.itemsMusics[index].name!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(
                _controller.itemsMusics[index].artist!,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
