import 'package:flutter/material.dart';
import 'package:get_to_know/components/suggested_artists_list_item.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/locator.dart';

class SuggestedArtistsListBuilder extends StatelessWidget {
  const SuggestedArtistsListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = locator.get<HomeController>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _controller.itemsArtists.length,
      itemBuilder: (BuildContext context, int index) {
        return SuggestedArtistsItemBuilder(
          controller: _controller,
          index: index,
        );
      },
    );
  }
}
