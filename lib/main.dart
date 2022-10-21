import 'package:flutter/material.dart';
import 'package:get_to_know/provider/artist_provider.dart';
import 'package:get_to_know/screens/home_screen.dart';
import 'package:get_to_know/themes/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ArtistProvider(),
      )
    ],
    child: const MyApp(),
  ));
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
