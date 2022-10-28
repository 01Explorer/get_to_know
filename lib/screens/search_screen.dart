import 'package:flutter/material.dart';
import 'package:get_to_know/components/initial_form_field.dart';
import 'package:get_to_know/components/search_album_item.dart';
import 'package:get_to_know/components/search_artist_item.dart';
import 'package:get_to_know/components/search_options_list_builder.dart';
import 'package:get_to_know/components/standard_bottom_bar.dart';
import 'package:get_to_know/components/track_item.dart';
import 'package:get_to_know/controllers/search_controller.dart';
import 'package:get_to_know/controllers/track_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/models/track.dart';
import 'package:get_to_know/screens/artist_screen.dart';
import 'package:get_to_know/screens/loading.dart';
import 'package:get_to_know/screens/tracks_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchKey = GlobalKey<FormState>();

  final String message = 'What are you looking for ?';

  final SearchController _searchController = locator.get<SearchController>();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SearchOptionsListBuilder(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Form(
                    key: _searchKey,
                    child: InitialSearchFormField(
                      _searchController.options[_searchController.tapped],
                      _searchController.hintText[_searchController.tapped],
                      searchController: _searchController,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchController.toBeBuilt.length,
                  itemBuilder: (BuildContext context, int index) {
                    final building = _searchController.toBeBuilt;
                    switch (building.runtimeType) {
                      case List<Artist>:
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArtistScreen(
                                    selectedArtist: building[index]),
                              )),
                          child: ArtistItem(
                            name: building[index].name,
                            followers: building[index].followers,
                            popularity: building[index].popularity,
                            imagePath: building[index].imagePath,
                          ),
                        );
                      case List<Album>:
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TracksScreen(
                                  chosenAlbum: building[index],
                                ),
                              )),
                          child: AlbumItem(
                            albumName: building[index].name,
                            artists: building[index].artist,
                            imagePath: building[index].imagePath,
                            totalTracks: building[index].totalTracks,
                          ),
                        );
                      case List<Track>:
                        return InkWell(
                          onTap: () => locator
                              .get<TrackController>()
                              .launchUrl(building[index].spotifyUrl),
                          child: TrackItem(
                            trackName: building[index].name!,
                            artists: building[index].artists,
                          ),
                        );
                      default:
                    }
                    return const Loading();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const StandardBottomBar(),
    );
  }
}
