import 'package:flutter/material.dart';
import 'package:get_to_know/components/new_releases_builder_item.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/locator.dart';

class NewReleasesListBuilder extends StatelessWidget {
  const NewReleasesListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = locator.get<HomeController>();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _controller.itemsMusics.length,
      itemBuilder: (BuildContext context, int index) {
        return NewReleasesBuilderItem(
          controller: _controller,
          index: index,
        );
      },
    );
  }
}
