import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/models/track.dart';
import 'package:get_to_know/screens/loading.dart';
import 'package:intl/intl.dart' as intl;

class ArtistScreen extends StatefulWidget {
  final Artist selectedArtist;
  ArtistScreen({Key? key, required this.selectedArtist}) : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  final List<String> options = [
    'Top Songs',
    'Top Albums',
    'Albums',
    'Artists Related'
  ];

  int tapped = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).backgroundColor
                  ],
                  stops: const [
                    0.4,
                    1.0
                  ]).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: Image.network(
              widget.selectedArtist.imagePath!,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(Icons.arrow_back),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.menu),
                  ],
                ),
              ),
              SizedBox(
                height: 160,
              ),
              Text(
                widget.selectedArtist.name!,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${intl.NumberFormat.decimalPattern().format(widget.selectedArtist.followers)} Followers',
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromRGBO(167, 167, 167, 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  height: 24,
                  width: 138,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white)),
                  child: Center(
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 24,
                ),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            tapped = index;
                          });
                        },
                        child: Text(
                          options[index],
                          style: TextStyle(
                            color: tapped == index
                                ? Colors.white
                                : Color.fromRGBO(167, 167, 167, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 300,
                  child: FutureBuilder(
                    future: locator
                        .get<SearchWebClient>()
                        .lookForArtistTopTracks(
                            widget.selectedArtist.spotifyId),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Album> keys = snapshot.data.keys.toList();

                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            break;
                          case ConnectionState.waiting:
                            break;
                          case ConnectionState.active:
                            break;
                          case ConnectionState.done:
                            return ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                Track values = snapshot.data[keys[index]];
                                return SizedBox(
                                  height: 55,
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              keys[index].imagePath!),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      values.name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: Text(
                                      keys[index].name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(167, 167, 167, 1),
                                      ),
                                    ),
                                    trailing: SizedBox(
                                      width: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.play_arrow_outlined,
                                            size: 30,
                                            color: Color.fromRGBO(
                                                167, 167, 167, 1),
                                          ),
                                          Icon(
                                            Icons.more_vert,
                                            size: 30,
                                            color: Color.fromRGBO(
                                                167, 167, 167, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          default:
                            break;
                        }
                      }
                      return Loading();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color.fromRGBO(167, 167, 167, 1),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
