import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lask_news_app/screen/home_screen.dart';
import 'package:lask_news_app/screen/explore_screen.dart';

final screen = [
  const HomeScreen(),
  const ExploreScreen(),
  const ExploreScreen(),
  const ExploreScreen(),
];

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      child: GNav(
        selectedIndex: _currentIndex,
        backgroundColor: Colors.white,
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
            icon: FontAwesomeIcons.user,
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
