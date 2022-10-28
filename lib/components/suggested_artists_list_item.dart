import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/screens/artist_screen.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class SuggestedArtistsItemBuilder extends StatelessWidget {
  const SuggestedArtistsItemBuilder({
    Key? key,
    required HomeController controller,
    required this.index,
  })  : _homeController = controller,
        super(key: key);

  final HomeController _homeController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtistScreen(
                selectedArtist: _homeController.itemsArtists[index]),
          ),
        ),
        child: SizedBox(
          width: 110,
          height: 129,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 110,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              _homeController.itemsArtists[index].imagePath!),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: ThemeColors.homeIconColor,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _homeController.itemsArtists[index].name!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
