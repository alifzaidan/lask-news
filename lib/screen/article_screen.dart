import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lask_news_app/models/news_model.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  Color _colorsClap = Colors.black;
  int _total = 0;

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
      bottomNavigationBar: _bottomAppBar(context),
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

  Widget _bottomAppBar(BuildContext context) {
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
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.bookmark,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () {},
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
