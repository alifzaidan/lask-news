import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/models/article_model.dart';
import 'package:lask_news_app/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiHeadline headline = ApiHeadline();
  ApiJustForYou justforyou = ApiJustForYou();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xFFE9EEFA)));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _greetings(),
              const SizedBox(
                height: 24,
              ),
              _listnews(),
              const SizedBox(
                height: 16,
              ),
              _justforyou(),
            ],
          ),
        ),
      ),
    );
  }

  Container _greetings() {
    String getGreeting(int hour) {
      if (hour < 12) {
        return 'Good Morning';
      } else if (hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    return Container(
      color: const Color(0xFFE9EEFA),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "${getGreeting(TimeOfDay.now().hour)},\nFolks!!",
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF6D6265),
                height: 150 / 100,
              ),
              children: [
                TextSpan(
                  text:
                      "\n${DateFormat('EEEE').format(DateTime.now()).substring(0, 3)} ${DateFormat('d MMMM, yyyy').format(DateTime.now())}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF231F20),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "☀️ Sunny 32\u2103",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6D6265),
            ),
          )
        ],
      ),
    );
  }

  Widget _listnews() {
    return FutureBuilder(
      future: headline.getArticle(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return SizedBox(
            height: 400,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/article',
                      arguments: articles[index]);
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
                        articles[index].urlToImage ??
                            "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                        width: 269,
                        height: 269,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 269,
                      child: Text(
                        articles[index].title ?? "Judul Tidak Ada",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Technology",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF6D6265),
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 24,
              ),
              itemCount: articles!.length,
            ),
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

  Column _justforyou() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Just for You',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                child: Text(
                  'See more',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D5BD0)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/justforyou'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        FutureBuilder(
          future: justforyou.getArticle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return SizedBox(
                height: 400,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/article',
                          arguments: articles[index]);
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
                            articles[index].urlToImage ??
                                "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                            width: 269,
                            height: 269,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 269,
                          child: Text(
                            articles[index].title ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Sports",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF6D6265),
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 24,
                  ),
                  itemCount: articles!.length,
                ),
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
        ),
      ],
    );
  }
}
