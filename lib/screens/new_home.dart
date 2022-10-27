import 'package:flutter/material.dart';
import 'package:get_to_know/components/sections/new_home_image_section.dart';
import 'package:get_to_know/components/sections/new_home_new_release_section.dart';
import 'package:get_to_know/components/sections/new_home_suggested_artists_section.dart';
import 'package:get_to_know/components/standard_bottom_bar.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/locator.dart';

class NewHome extends StatelessWidget {
  NewHome({Key? key}) : super(key: key);

  final HomeController _controller = locator.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    _controller.readJson();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Column(
            children: [
              const NewHomeImageSection(
                imagePath: 'assets/images/featured.png',
                title: 'Featured',
              ),
              const NewReleasesSection(title: 'New Releases'),
              SuggestedArtistsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const StandardBottomBar(),
    );
  }
}
