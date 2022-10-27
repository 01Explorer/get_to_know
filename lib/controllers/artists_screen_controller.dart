import 'package:flutter/material.dart';

class ArtistsScreenController extends ChangeNotifier {
  final List<String> options = [
    'Top Songs',
    'Top Albums',
    'Albums',
    'Artists Related'
  ];

  int tapped = 0;

  void controllerTap(int index) {
    tapped = index;
  }
}
