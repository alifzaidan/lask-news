import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lask_news_app/models/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              _heading(),
              const SizedBox(
                height: 24,
              ),
              _stats(),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Divider(color: Color(0xFFE2E0E0)),
              ),
              const SizedBox(
                height: 24,
              ),
              _pages('Reading History', profiles),
              _pages('Settings', settings),
              _logout(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _heading() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/photo.jpg'),
                radius: 55,
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alif Zaidan',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Bookworm',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF2D5BD0),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _stats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Article Read',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6D6265),
                ),
              ),
              Text(
                '320',
                style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Streak',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6D6265),
                ),
              ),
              Text(
                '345 Days',
                style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Level',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF6D6265),
                ),
              ),
              Text(
                '125',
                style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _pages(String title, List<ProfileModel> page) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 48 * (page.length).toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, page[index].route);
                },
                child: SizedBox(
                  height: 42,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        page[index].page,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                        ),
                      ),
                      const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: page.length,
            ),
          ),
        ],
      ),
    );
  }

  Container _logout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: ElevatedButton(
        onPressed: () {
          _auth.signOut();
          Navigator.pushNamed(context, '/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logout',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            const FaIcon(
              FontAwesomeIcons.doorOpen,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
