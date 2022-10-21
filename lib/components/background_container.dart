import 'package:flutter/material.dart';
import 'package:get_to_know/themes/theme_colors.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ThemeColors.gradientColors,
          tileMode: TileMode.mirror,
        ),
      ),
      child: child,
    );
  }
}
