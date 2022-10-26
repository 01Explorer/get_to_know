import 'package:get_it/get_it.dart';
import 'package:get_to_know/controllers/track_controller.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/controllers/albums_controller.dart';
import 'package:get_to_know/controllers/artist_controller.dart';
import 'package:get_to_know/models/track.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingletonAsync<SearchWebClient>(
      () async => await SearchWebClient.createAsync());
  locator.registerLazySingleton<ArtistController>(() => ArtistController());
  locator.registerLazySingleton<AlbumsController>(() => AlbumsController());
  locator.registerLazySingleton<TrackController>(() => TrackController());
}
