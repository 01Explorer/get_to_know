import 'package:flutter/material.dart';
import 'package:get_to_know/components/search_artist_item.dart';
import 'package:get_to_know/controllers/artist_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/screens/artist_screen.dart';
import 'package:get_to_know/screens/loading.dart';

class RelatedArtistsListViewBuilder extends StatelessWidget {
  final String artistId;
  const RelatedArtistsListViewBuilder({Key? key, required this.artistId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: locator.get<ArtistController>().searchRelatedArtists(artistId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Artist> artists = snapshot.data;
              return ListView.builder(
                itemCount: artists.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArtistScreen(
                              selectedArtist: artists[index],
                            ),
                          )),
                      child: ArtistItem(
                        name: artists[index].name!,
                        followers: artists[index].followers!,
                        popularity: artists[index].popularity!,
                        imagePath: artists[index].imagePath,
                      ));
                },
              );
            }
          }
          return const Loading();
        },
      ),
    );
  }
}
