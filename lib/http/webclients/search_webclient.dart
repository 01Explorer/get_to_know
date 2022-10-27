import 'dart:collection';
import 'dart:convert';

import 'package:get_to_know/http/webclient.dart';
import 'package:get_to_know/models/album.dart';
import 'package:get_to_know/models/artist.dart';
import 'package:get_to_know/models/track.dart';
import 'package:http/http.dart' as http;

class SearchWebClient {
  String? accessToken;
  // String? artistId;
  List? albums;

  Future<void> getToken() async {
    accessToken = await getAccess();
  }

  static Future<SearchWebClient> createAsync() async {
    SearchWebClient search = SearchWebClient();
    search.accessToken = await getAccess();
    return search;
  }

  Future<Artist> lookForArtistInfo(String? searchTerm) async {
    // Get Artist Info
    final http.Response responseId = await client.get(
      searchUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      params: {'q': searchTerm, 'type': 'artist'},
    );
    return Artist.fromJson(jsonDecode(responseId.body));
  }

  Future<List<Album>> lookForAlbums(String? artistId) async {
    final http.Response responseAlbums =
        await client.get(setArtistUrl(artistId), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    }, params: {
      'market': 'BR',
    });
    return parseAlbumResponse(jsonDecode(responseAlbums.body));
  }

  Future<List<Track>> lookForTracks(String? albumId) async {
    final http.Response responseTracks =
        await client.get(setAlbumsUrl(albumId), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    }, params: {
      'market': 'BR',
      'limit': 30,
    });
    return parseTracksResponse(jsonDecode(responseTracks.body));
  }

  Future<Map<Album, Track>> lookForArtistTopTracks(String? artistId) async {
    final http.Response responseTracks =
        await client.get(setArtistTopTracksUrl(artistId), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    }, params: {
      'market': 'BR',
    });
    return parseArtistTopTracksResponse(jsonDecode(responseTracks.body));
  }

  Uri setArtistUrl(String? artistId) {
    String initial = artistUrl.toString();
    String newUrl = '$initial/$artistId/albums/';
    return Uri.parse(newUrl);
  }

  Uri setArtistTopTracksUrl(String? artistId) {
    String initial = artistUrl.toString();
    String newUrl = '$initial/$artistId/top-tracks/';
    return Uri.parse(newUrl);
  }

  Uri setAlbumsUrl(String? albumId) {
    String initial = albumsUrl.toString();
    String newUrl = '$initial/$albumId/tracks/';
    return Uri.parse(newUrl);
  }

  List<Album> parseAlbumResponse(
      LinkedHashMap<String, dynamic> responseAlbums) {
    Map<String, dynamic> stringMap = responseAlbums.cast<String, dynamic>();
    List<dynamic> albums = stringMap['items'];
    return albums.map((dynamic json) => Album.fromJson(json)).toList();
  }

  List<Track> parseTracksResponse(
      LinkedHashMap<String, dynamic> responseTracks) {
    Map<String, dynamic> stringMap = responseTracks.cast<String, dynamic>();
    List<dynamic> tracks = stringMap['items'];
    return tracks
        .map((dynamic json) => Track.fromJson(json, getTrackArtists(json)))
        .toList();
  }

  Map<Album, Track> parseArtistTopTracksResponse(
      LinkedHashMap<String, dynamic> responseTracks) {
    Map<String, dynamic> stringMap = responseTracks.cast<String, dynamic>();
    List<dynamic> tracks = stringMap['tracks'];
    Map<Album, Track> mapReturn = Map<Album, Track>.fromIterable(
      tracks,
      key: (element) => Album.fromJson(element['album']),
      value: (element) => Track.fromJson(element, getTrackArtists(element)),
    );
    print(mapReturn.toString());
    return mapReturn;
  }

  List<Artist> parseArtistsResponse(
      LinkedHashMap<String, dynamic> responseTracks) {
    Map<String, dynamic> stringMap = responseTracks.cast<String, dynamic>();
    List<dynamic> artists = stringMap['items'];
    return artists.map((dynamic json) => Artist.fromLocalJson(json)).toList();
  }

  List<String> getTrackArtists(Map<String, dynamic> response) {
    List<String> artists = [];
    for (var element in response['artists']) {
      artists.add(element['name']);
    }
    return artists;
  }
}
