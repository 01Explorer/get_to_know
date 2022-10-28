import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/search_controller.dart';

class InitialSearchFormField extends StatelessWidget {
  final TextEditingController _textFieldSearchController =
      TextEditingController();
  final String labelTitle;
  final String hintTitle;
  final SearchController searchController;

  InitialSearchFormField(this.labelTitle, this.hintTitle,
      {super.key, required this.searchController});

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
      controller: _textFieldSearchController,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          _textFieldSearchController.text = value.trim();
          searchController.setSearch(_textFieldSearchController.text);
          // _artistController.setArtistName(_searchController.text);
        }
      },
    );
  }
}
