import 'package:flutter/material.dart';
import 'package:get_to_know/components/suggested_artists_list_item.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/locator.dart';

class SuggestedArtistsListBuilder extends StatefulWidget {
  const SuggestedArtistsListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<SuggestedArtistsListBuilder> createState() =>
      _SuggestedArtistsListBuilderState();
}

class _SuggestedArtistsListBuilderState
    extends State<SuggestedArtistsListBuilder> {
  final HomeController _homeController = locator.get<HomeController>();
  @override
  void initState() {
    super.initState();
    _homeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _homeController.itemsArtists.length,
      itemBuilder: (BuildContext context, int index) {
        return SuggestedArtistsItemBuilder(
          controller: _homeController,
          index: index,
        );
      },
    );
  }
}
