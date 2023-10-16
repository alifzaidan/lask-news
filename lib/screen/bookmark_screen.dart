import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(),
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
          "Bookmark",
          style: GoogleFonts.inter(
            fontSize: 32,
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
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.pen, size: 20),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
