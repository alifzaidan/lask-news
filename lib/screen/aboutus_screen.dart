import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              _about(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          "About Us",
          style: GoogleFonts.inter(
            fontSize: 28,
            color: const Color(0xFF231F20),
            fontWeight: FontWeight.w600,
            height: 150 / 100,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(),
      ),
      backgroundColor: const Color(0xFFE9EEFA),
    );
  }

  Container _about() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            "Thank you for using Lask News App!",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 24,
                color: const Color(0xFF231F20),
                fontWeight: FontWeight.w600,
                height: 150 / 100),
          ),
          Image.asset('assets/images/logo.png'),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Lask News App is a news app that is made for you to read news from all around the world. We have a feature that will recommend you news based on your reading history. You can make your news and publish it. We hope you enjoy using our app!",
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF231F20),
              fontWeight: FontWeight.w400,
              height: 150 / 100,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Divider(),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Lask News App is made by:",
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF231F20),
              fontWeight: FontWeight.w600,
              height: 150 / 100,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Muchammad Alif Zaidan\nEnggarani Wahyu Ekaputri",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF231F20),
              fontWeight: FontWeight.w400,
              height: 150 / 100,
            ),
          ),
        ],
      ),
    );
  }
}
