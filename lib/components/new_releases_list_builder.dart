import 'package:flutter/material.dart';
import 'package:get_to_know/components/new_releases_builder_item.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/locator.dart';

class NewReleasesListBuilder extends StatefulWidget {
  const NewReleasesListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<NewReleasesListBuilder> createState() => _NewReleasesListBuilderState();
}

class _NewReleasesListBuilderState extends State<NewReleasesListBuilder> {
  final HomeController _controller = locator.get<HomeController>();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
