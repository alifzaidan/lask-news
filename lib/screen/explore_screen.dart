import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

var category = [
  "Travel",
  "Technology",
  "Bussines",
  "Economy",
  "Healthy",
  "Sports"
];

class ExploreModel {
  String title;
  String image;
  String category;
  String author;
  String date;

  ExploreModel({
    required this.title,
    required this.image,
    required this.category,
    required this.author,
    required this.date,
  });
}

var explore = [
  ExploreModel(
    title: "Experience the Serenity of Japan's Traditional Countryside",
    image: "sakura.png",
    category: "Travel",
    author: "Hilda Friesen",
    date: "May 3, 2023",
  ),
  ExploreModel(
    title: "A Journey Through Time: Discovering the Nile river",
    image: "nile.png",
    category: "Travel",
    author: "Melissa White",
    date: "May 7, 2023",
  ),
  ExploreModel(
    title: "Chasing the Northern Lights: A Winter in Finland",
    image: "winter.png",
    category: "Travel",
    author: "Hilda Friesen",
    date: "May 12, 2023",
  ),
  ExploreModel(
    title: "Chasing the Northern Lights: A Winter in Finland",
    image: "winter.png",
    category: "Travel",
    author: "Hilda Friesen",
    date: "May 12, 2023",
  ),
];

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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
                height: 16,
              ),
              _headline(context),
              const SizedBox(
                height: 36,
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
      title: Text(
        "Explore",
        style: GoogleFonts.inter(
          fontSize: 32,
          color: const Color(0xFF231F20),
          fontWeight: FontWeight.w600,
          height: 150 / 100,
        ),
      ),
      backgroundColor: const Color(0xFFE9EEFA),
      actions: <Widget>[
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          onPressed: () {},
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

  Container _headline(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: InkWell(
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
                'assets/images/amazon.png',
                width: double.maxFinite,
                height: 206,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Uncovering the Hidden Gems of the Amazon Forest',
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
                  child: Image.asset('assets/images/photo.jpg', height: 24),
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
          ],
        ),
      ),
    );
  }

  ListView _news() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/article');
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
                    explore[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Image.asset('assets/images/photo.jpg', height: 24),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      explore[index].author,
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
                      explore[index].date,
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
              child: Image.asset(
                'assets/images/${explore[index].image}',
                width: 112,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 24,
      ),
      itemCount: explore.length,
    );
  }
}
