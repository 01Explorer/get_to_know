import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/artist_controller.dart';
import 'package:get_to_know/controllers/search_controller.dart';
import 'package:get_to_know/locator.dart';

class InitialSearchFormField extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final ArtistController _artistController = locator.get<ArtistController>();
  final String labelTitle;
  final String hintTitle;
  final SearchController controller;

  InitialSearchFormField(this.labelTitle, this.hintTitle,
      {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelLarge,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        labelText: labelTitle,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        hintText: hintTitle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please fill the field';
        }
        return null;
      },
      controller: _searchController,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          _searchController.text = value.trim();
          controller.setSearch(_searchController.text);
          // _artistController.setArtistName(_searchController.text);
        }
      },
    );
  }
}
