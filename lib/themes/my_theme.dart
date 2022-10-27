import 'package:flutter/material.dart';
import 'package:get_to_know/themes/theme_colors.dart';

ThemeData goodLooking = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ThemeColors.alternativeFontColor,
    ),
  ),
);
