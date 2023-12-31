import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/models/article_model.dart';
import 'package:lask_news_app/models/user_model.dart';
import 'package:lask_news_app/services/api_services.dart';
import 'package:lask_news_app/services/firebase_auth_service.dart';
import 'package:lask_news_app/services/user_services.dart';

class JustForYouScreen extends StatefulWidget {
  const JustForYouScreen({super.key});

  @override
  State<JustForYouScreen> createState() => _JustForYouScreenState();
}

class _JustForYouScreenState extends State<JustForYouScreen> {
  ApiJustForYou justforyou = ApiJustForYou();
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
              _news(justforyou),
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
          "Just For You",
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

  Widget _news(ApiJustForYou justforyou) {
    return FutureBuilder(
      future: justforyou.getArticle(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;

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
                          arguments: articles[index]);
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
                                articles[index].title ?? "Judul Tidak Ada",
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
                                    articles[index].author ?? "Anonimous",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: const Color(0xFF6D6265),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  DateFormat('dd MMM yyyy').format(
                                      DateTime.parse(
                                          articles[index].publishedAt ??
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
                            articles[index].urlToImage ??
                                "https://xkotosingkarak.solokkab.go.id/asset/foto_berita/no-image.jpg",
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
            itemCount: articles!.length,
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
}
