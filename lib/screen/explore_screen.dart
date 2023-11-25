import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/models/article_model.dart';
import 'package:lask_news_app/models/user_model.dart';
import 'package:lask_news_app/services/api_services.dart';
import 'package:lask_news_app/services/firebase_auth_service.dart';
import 'package:lask_news_app/services/user_services.dart';

var category = [
  "Travel",
  "Technology",
  "Bussines",
  "Economy",
  "Healthy",
  "Sports"
];

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ApiHeadline headline = ApiHeadline();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              _category(),
              const SizedBox(
                height: 24,
              ),
              _news(),
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
          "Explore",
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
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  SizedBox _category() {
    return SizedBox(
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EEFA),
                  borderRadius: BorderRadius.circular(56),
                ),
                child: Center(
                  child: Text(category[index]),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: category.length),
    );
  }

  Widget _news() {
    return FutureBuilder(
      future: headline.getArticle(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;

          return Column(
            children: [
              _headline(articles),
              const SizedBox(
                height: 36,
              ),
              _listnews(articles),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _headline(List<Article>? articles) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: FutureBuilder(
          future: DbUser.getUserByEmail(_authService.getCurrentUser()!),
          builder: (context, usersnapshot) {
            return InkWell(
              onTap: () {
                final userbaru = UserModel(
                  name: usersnapshot.data![0]['name'],
                  email: usersnapshot.data![0]['email'],
                  password: usersnapshot.data![0]['password'],
                  articlesRead: usersnapshot.data![0]['articlesRead'] + 1,
                );
                DbUser.updateData(
                    snapshot: usersnapshot.data![0], itemuser: userbaru);
                Navigator.pushNamed(context, '/article',
                    arguments: articles?[0]);
              },
              highlightColor: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      articles?[0].urlToImage ??
                          "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                      width: double.maxFinite,
                      height: 206,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    articles?[0].title ?? "Judul Tidak Ada",
                    maxLines: 2,
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child:
                            Image.asset('assets/images/photo.jpg', height: 24),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        articles?[0].author ?? "Anonimous",
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
                        DateFormat('dd MMM yyyy').format(DateTime.parse(
                            articles?[0].publishedAt ??
                                "Tanggal Tidak Ditemukan")),
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF6D6265),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _listnews(List<Article>? articles) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => FutureBuilder(
          future: DbUser.getUserByEmail(_authService.getCurrentUser()!),
          builder: (context, usersnapshot) {
            return InkWell(
              onTap: () {
                final userbaru = UserModel(
                  name: usersnapshot.data![0]['name'],
                  email: usersnapshot.data![0]['email'],
                  password: usersnapshot.data![0]['password'],
                  articlesRead: usersnapshot.data![0]['articlesRead'] + 1,
                );
                DbUser.updateData(
                    snapshot: usersnapshot.data![0], itemuser: userbaru);
                Navigator.pushNamed(context, '/article',
                    arguments: articles[index + 1]);
              },
              highlightColor: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          articles[index + 1].title ?? "Judul Tidak Ada",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              articles[index + 1].author ?? "Author Tidak Ada",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: const Color(0xFF6D6265),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            DateFormat('dd MMM yyyy').format(DateTime.parse(
                                articles[index + 1].publishedAt ??
                                    "Tanggal Tidak Ditemukan")),
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xFF6D6265),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      articles[index + 1].urlToImage ??
                          "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                      width: 112,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          }),
      separatorBuilder: (context, index) => const SizedBox(
        height: 24,
      ),
      itemCount: articles!.length - 1,
    );
  }
}
