import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/models/bookmark_model.dart';
import 'package:lask_news_app/services/bookmark_services.dart';

class ArticleBScreen extends StatelessWidget {
  ArticleBScreen({super.key});

  Color _colorsClap = Colors.black;

  int _total = 0;

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as BookmarkModel;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  article.urlToImage ??
                      "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: _content(article),
      ),
      bottomNavigationBar: _bottomAppBar(article, context),
    );
  }

  Widget _content(BookmarkModel article) {
    String? date = article.publishedAt;
    DateFormat dateFormat = DateFormat('dd MMM yyyy');
    String formattedDate = dateFormat.format(DateTime.parse(date!));

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
                  article.title ?? "Judul Tidak Ada",
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
                    Text(
                      article.author ?? "Author Tidak Ada",
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
                      formattedDate,
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
                Text(
                  article.content ?? "Deskripsi Tidak Ada",
                  style: GoogleFonts.merriweather(
                    color: Colors.black,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomAppBar(BookmarkModel article, BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            StatefulBuilder(
              builder: (context, setState) {
                return IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.handsClapping,
                    size: 20,
                    color: _colorsClap,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        if (_colorsClap == Colors.black) {
                          _colorsClap = const Color(0xFF2D5BD0);
                          _total++;
                        } else {
                          _colorsClap = Colors.black;
                          _total--;
                        }
                      },
                    );
                  },
                );
              },
            ),
            Text(_total.toString()),
            const SizedBox(width: 8),
            StreamBuilder<QuerySnapshot>(
              stream: DbBookmark.getData(),
              builder: (context, snapshot) {
                return IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.bookmark,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    DbBookmark.deleteData(id: article.id);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.share,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
