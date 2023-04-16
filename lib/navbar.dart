import 'package:eazygo_map/User/user.dart';
import 'package:eazygo_map/Map/map.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentindex = 0;
  final screens = [Map(), User()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(217, 233, 230, 1),
          selectedItemColor: Color.fromRGBO(28, 103, 88, 1),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
          onTap: (index) => setState(() => currentindex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_sharp),
              label: 'map',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'user'),
          ]),
    );
  }
}
