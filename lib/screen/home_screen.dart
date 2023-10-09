import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsModel {
  String name;
  String image;
  String category;

  NewsModel({
    required this.name,
    required this.image,
    required this.category,
  });
}

var headline = [
  NewsModel(
    name: "Experience the Serenity of Japan's Traditional Countryside",
    image: "japan.png",
    category: "Technology",
  ),
  NewsModel(
    name: "Discovering the Magic of Paris: A Journey through",
    image: "paris.jpg",
    category: "Technology",
  ),
  NewsModel(
    name: "The Pros and Cons of Remote Work",
    image: "mountain.png",
    category: "Technology",
  ),
];

var justforyou = [
  NewsModel(
    name: "The Pros and Cons of Remote Work",
    image: "mountain.png",
    category: "Technology",
  ),
  NewsModel(
    name: "The Pros and Cons of Remote Work",
    image: "waterfall.jpg",
    category: "Technology",
  ),
  NewsModel(
    name: "Experience the Serenity of Japan's Traditional Countryside",
    image: "japan.png",
    category: "Technology",
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              _listnews(headline),
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
    return Container(
      color: const Color(0xFFE9EEFA),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "Good Morning,\nAlif ",
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF6D6265),
                height: 150 / 100,
              ),
              children: const [
                TextSpan(
                  text: "\nSun 9 April, 2023",
                  style: TextStyle(
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

  SizedBox _listnews(List<NewsModel> news) {
    return SizedBox(
      height: 400,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/article');
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
                child: Image.asset(
                  'assets/images/${news[index].image}',
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
                  news[index].name,
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
                news[index].category,
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
        itemCount: news.length,
      ),
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
              Text(
                'See more',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2D5BD0)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _listnews(justforyou),
      ],
    );
  }
}