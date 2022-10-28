import 'package:flutter/material.dart';
import 'package:get_to_know/http/webclients/search_webclient.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/themes/my_theme.dart';

import 'screens/new_home.dart';

void main() {
  setup();
  locator.get<SearchWebClient>().getToken();
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
      home: const NewHome(),
    );
  }
}
