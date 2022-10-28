import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/search_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class SearchOptionsListBuilder extends StatefulWidget {
  const SearchOptionsListBuilder({
    super.key,
  });

  @override
  State<SearchOptionsListBuilder> createState() =>
      _SearchOptionsListBuilderState();
}

class _SearchOptionsListBuilderState extends State<SearchOptionsListBuilder> {
  @override
  Widget build(BuildContext context) {
    final SearchController _controller = locator.get<SearchController>();
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _controller.options.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 80),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _controller.setTapped(index);
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
      ],
    );
  }
}
