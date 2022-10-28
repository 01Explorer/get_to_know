import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/artists_screen_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class ArtistOptionsListBuilder extends StatefulWidget {
  const ArtistOptionsListBuilder({
    super.key,
  });

  @override
  State<ArtistOptionsListBuilder> createState() =>
      _ArtistOptionsListBuilderState();
}

class _ArtistOptionsListBuilderState extends State<ArtistOptionsListBuilder> {
  final ArtistsScreenController _controller =
      locator.get<ArtistsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
          ),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _controller.options.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _controller.tapped = index;
                      });
                    },
                    child: Text(
                      _controller.options[index],
                      style: TextStyle(
                        color: _controller.tapped == index
                            ? Colors.white
                            : ThemeColors.alternativeFontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
