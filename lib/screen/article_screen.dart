import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key});

  @override
  Widget build(BuildContext context) {
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
                  'assets/images/forest.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: _content(),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _content() {
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
                  'See How the Forest is Helping Our World',
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
                      'Mr. Lana Kub',
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
                      'May 1, 2023',
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
                    text:
                        "Forests are one of the most important natural resources that our planet possesses. Not only do they provide us with a diverse range of products such as timber, medicine, and food, but they also play a vital role in mitigating climate change and maintaining the overall health of our planet's ecosystems. In this article, we will explore the ways in which forests are helping our world.",
                    style: GoogleFonts.merriweather(
                      color: Colors.black,
                      fontSize: 16,
                      height: 1.6,
                    ),
                    children: const [
                      TextSpan(
                        text:
                            "\n\nOne of the most important roles that forests play is in absorbing carbon dioxide from the atmosphere. Trees absorb carbon dioxide through photosynthesis and store it in their trunks, branches, and leaves. This carbon sequestration helps to mitigate climate change by reducing the amount of greenhouse gases in the atmosphere. Forests are estimated to absorb approximately 2.4 billion tonnes of carbon dioxide each year, which is equivalent to around 10% of global greenhouse gas emissions.",
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
