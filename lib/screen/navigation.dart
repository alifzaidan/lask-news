import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lask_news_app/screen/bookmark_screen.dart';
import 'package:lask_news_app/screen/home_screen.dart';
import 'package:lask_news_app/screen/explore_screen.dart';
import 'package:lask_news_app/screen/profile_screen.dart';

final screen = [
  const HomeScreen(),
  const ExploreScreen(),
  const BookmarkScreen(),
  ProfileScreen(),
];

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xFFE9EEFA)));

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: screen[_currentIndex],
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.transparent,
      child: GNav(
        selectedIndex: _currentIndex,
        backgroundColor: Colors.transparent,
        tabBackgroundColor: const Color(0xFF231F20),
        activeColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.house,
            gap: 10,
            text: 'Home',
          ),
          GButton(
            icon: FontAwesomeIcons.earthAsia,
            gap: 8,
            text: 'Explore',
          ),
          GButton(
            icon: FontAwesomeIcons.book,
            gap: 8,
            text: 'Bookmark',
          ),
          GButton(
            icon: FontAwesomeIcons.solidUser,
            gap: 5,
            text: 'User',
          ),
        ],
        onTabChange: (value) => setState(() {
          _currentIndex = value;
        }),
      ),
    );
  }
}
