import 'package:flutter/material.dart';
import 'package:get_to_know/components/background_container.dart';
import 'package:get_to_know/provider/artist_provider.dart';
import 'package:get_to_know/screens/albums_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _searchKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      body: BackgroundContainer(ClipRRect(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Search for an artist',
                  style: Theme.of(context).textTheme.displaySmall),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Form(
                    key: _searchKey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                      decoration: InputDecoration(
                        labelText: 'Artist',
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                        hintText: 'The Weeknd',
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 12),
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
                        _searchController.text = value.trim();
                        Provider.of<ArtistProvider>(context, listen: false)
                            .searchArtist(_searchController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlbumsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
