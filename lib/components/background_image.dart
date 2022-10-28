import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

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
        imagePath,
      ),
    );
  }
}
