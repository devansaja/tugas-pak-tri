import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.list,
    Icons.person,
  ];

  final pages = [HomePage(), SearchPage(), NotificationsPage(), ProfilePage()];

  final titles = ['Beranda', 'Pencarian', 'Daftar Teman', 'Profil Saya'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text(
              titles[_currentIndex],
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                foreground:
                    Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = const Color.fromARGB(255, 206, 199, 199),
              ),
            ),
            Text(
              titles[_currentIndex],
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 18, 16, 16),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      floatingActionButton: Container(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, size: 32),
          backgroundColor: const Color.fromARGB(255, 228, 226, 223),
          shape: CircleBorder(),
          elevation: 8,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.white,
        activeColor: Colors.orange,
        inactiveColor: Colors.grey,
      ),
    );
  }
}
