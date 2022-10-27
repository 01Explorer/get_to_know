import 'package:flutter/material.dart';
import 'package:get_to_know/models/artist.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.selectedArtist,
  }) : super(key: key);

  final Artist selectedArtist;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Theme.of(context).backgroundColor],
            stops: const [0.4, 1.0]).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: Image.network(
        selectedArtist.imagePath!,
      ),
    );
  }
}
