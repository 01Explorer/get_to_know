import 'package:flutter/material.dart';
import 'package:get_to_know/components/sections/new_home_image_section.dart';
import 'package:get_to_know/components/sections/new_home_new_release_section.dart';
import 'package:get_to_know/components/sections/new_home_suggested_artists_section.dart';
import 'package:get_to_know/components/standard_bottom_bar.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/locator.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  final HomeController _homeController = locator.get<HomeController>();

  @override
  void initState() {
    super.initState();
    if (!_homeController.alreadyRead) {
      _homeController.readJson();
      _homeController.alreadyRead = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Column(
            children: const [
              NewHomeImageSection(
                imagePath: 'assets/images/featured.png',
                title: 'Featured',
              ),
              NewReleasesSection(title: 'New Releases'),
              SuggestedArtistsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const StandardBottomBar(),
    );
  }
}
