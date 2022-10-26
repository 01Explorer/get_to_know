import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/artist_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/screens/albums_screen.dart';

class InitialSearchFormField extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final ArtistController _artistController = locator.get<ArtistController>();
  final String labelTitle;
  final String hintTitle;

  InitialSearchFormField(this.labelTitle, this.hintTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelLarge,
      decoration: InputDecoration(
        labelText: labelTitle,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        hintText: hintTitle,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 12),
          borderRadius: BorderRadius.circular(30),
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
          _artistController.setArtistName(_searchController.text);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumsScreen(),
            ),
          );
        }
      },
    );
  }
}
