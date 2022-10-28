import 'package:flutter/cupertino.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/models/track.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TrackController extends ChangeNotifier {
  Future<List<Track>> searchTracks(String albumId) async {
    final List<Track> listTracks =
        await locator.get<SearchWebClient>().lookForTracks(albumId);
    return listTracks;
  }

  Future<void> launchUrl(String? openUrl) async {
    if (openUrl != null) {
      if (await canLaunchUrlString(openUrl)) {
        await launchUrlString(openUrl, mode: LaunchMode.externalApplication);
      }
    }
  }
}
