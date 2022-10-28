import 'package:get_it/get_it.dart';
import 'package:get_to_know/controllers/artists_screen_controller.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/controllers/search_controller.dart';
import 'package:get_to_know/controllers/track_controller.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/controllers/albums_controller.dart';
import 'package:get_to_know/controllers/artist_controller.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<HomeController>(() => HomeController());
  locator.registerLazySingleton<SearchController>(() => SearchController());
  locator.registerLazySingleton<ArtistsScreenController>(
      () => ArtistsScreenController());
  locator.registerLazySingleton<SearchWebClient>(() => SearchWebClient());
  locator.registerLazySingleton<ArtistController>(() => ArtistController());
  locator.registerLazySingleton<AlbumsController>(() => AlbumsController());
  locator.registerLazySingleton<TrackController>(() => TrackController());
}
