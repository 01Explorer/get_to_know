import 'package:flutter/material.dart';

class StandardBottomBar extends StatelessWidget {
  const StandardBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Library'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ],
      selectedItemColor: Colors.white,
      showUnselectedLabels: true,
    );
  }
}
