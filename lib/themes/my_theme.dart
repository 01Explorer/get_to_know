import 'package:flutter/material.dart';
import 'package:get_to_know/themes/theme_colors.dart';

ThemeData goodLooking = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelLarge: const TextStyle(
        fontSize: 24,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      )),
);
