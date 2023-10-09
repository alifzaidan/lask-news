import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lask_news_app/models/news_model.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as NewsModel;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/${news.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: _content(news),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _content(NewsModel news) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Text(
                  news.title,
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Image.asset(
                        'assets/images/photo.jpg',
                        height: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      news.author,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF6D6265),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                      child: Center(child: Text('-')),
                    ),
                    Text(
                      news.date,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF6D6265),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                    text: news.description1,
                    style: GoogleFonts.merriweather(
                      color: Colors.black,
                      fontSize: 16,
                      height: 1.6,
                    ),
                    children: [
                      TextSpan(
                        text: news.description2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: const Color(0xFF2D5BD0),
      currentIndex: 1,
      showSelectedLabels: false,
      onTap: (int index) {
        // Fungsi ini akan dipanggil saat tombol di BottomNavigationBar diklik
        if (index == 0) {
          // Navigasi kembali ke halaman sebelumnya
          Navigator.pop(context);
        } else if (index == 1) {
          // Tambahkan fungsi untuk tombol "Like" di sini
        } else if (index == 2) {
          // Tambahkan fungsi untuk tombol "Save Bookmark" di sini
        } else if (index == 3) {
          // Tambahkan fungsi untuk tombol "Share" di sini
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
          label: 'Back',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.handsClapping),
          label: 'Like',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bookmark),
          label: 'Save Bookmark',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.share),
          label: 'Share',
        ),
      ],
    );
  }
}
