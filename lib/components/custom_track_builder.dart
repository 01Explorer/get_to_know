import 'package:flutter/material.dart';
import 'package:get_to_know/models/track.dart';
import 'package:get_to_know/themes/theme_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomTrackListBuilder extends StatefulWidget {
  CustomTrackListBuilder(
      {Key? key,
      required this.listTracks,
      required this.albumImagePath,
      this.searchString = ''})
      : super(key: key);

  final String albumImagePath;
  final List<Track> listTracks;
  String searchString;

  @override
  State<CustomTrackListBuilder> createState() => _CustomTrackListBuilderState();
}

class _CustomTrackListBuilderState extends State<CustomTrackListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: widget.listTracks.length,
      itemBuilder: (BuildContext context, int index) {
        return widget.listTracks[index].name!
                .toLowerCase()
                .contains(widget.searchString)
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  onTap: () => _launchUrl(widget.listTracks[index].spotifyUrl),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        width: 2, color: ThemeColors.primaryColor),
                  ),
                  tileColor: Colors.white,
                  leading: Image.network(widget.albumImagePath),
                  title: Text(
                    '${widget.listTracks[index].name}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    '${widget.listTracks[index].artists}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: Text(
                    '${widget.listTracks[index].duration!.toStringAsPrecision(2)}\nMinutes',
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container();
      },
    );
  }

  _launchUrl(String? openUrl) async {
    if (openUrl != null) {
      if (await canLaunchUrlString(openUrl)) {
        await launchUrlString(openUrl, mode: LaunchMode.externalApplication);
      }
    }
  }
}
