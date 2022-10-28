import 'package:flutter/material.dart';
import 'package:get_to_know/controllers/home_controller.dart';
import 'package:get_to_know/locator.dart';
import 'package:get_to_know/screens/new_home.dart';
import 'package:get_to_know/screens/search_screen.dart';

class StandardBottomBar extends StatefulWidget {
  const StandardBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<StandardBottomBar> createState() => _StandardBottomBarState();
}

class _StandardBottomBarState extends State<StandardBottomBar> {
  final _controller = locator.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _controller.bottomBarindex,
      onTap: (value) {
        setState(() {
          _controller.setIndex(value);
        });
        switch (value) {
          case 0:
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewHome(),
                ),
                (route) => false);
            break;
          case 1:
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
                (route) => false);
            break;
          default:
        }
      },
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
