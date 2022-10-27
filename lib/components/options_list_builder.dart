import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/artists_screen_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class OptionsListBuilder extends StatefulWidget {
  const OptionsListBuilder({super.key});

  @override
  State<OptionsListBuilder> createState() => _OptionsListBuilderState();
}

class _OptionsListBuilderState extends State<OptionsListBuilder> {
  @override
  Widget build(BuildContext context) {
    final ArtistsScreenController _controller =
        locator.get<ArtistsScreenController>();
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
                return TextButton(
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
