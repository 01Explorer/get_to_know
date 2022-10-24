import 'package:flutter/material.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/screens/home_screen.dart';
import 'package:get_to_know/themes/my_theme.dart';

void main() {
  setup();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Looking For',
      theme: goodLooking,
      home: HomeScreen(),
    );
  }
}
