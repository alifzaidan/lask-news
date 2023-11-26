import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/services/bookmark_services.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  String searchText = '';

  void _onSearchText(String value) {
    setState(() {
      searchText = value;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              _listnews(),
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
        child: isSearchClicked
            ? Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchText,
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF6D6265),
                    ),
                    border: InputBorder.none,
                    hintText: "Search..",
                  ),
                ),
              )
            : Text(
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
            icon: FaIcon(
                isSearchClicked
                    ? FontAwesomeIcons.xmark
                    : FontAwesomeIcons.magnifyingGlass,
                size: 20),
            onPressed: () {
              setState(() {
                isSearchClicked = !isSearchClicked;
                if (isSearchClicked) {
                  _searchController.clear();
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _listnews() {
    return StreamBuilder<QuerySnapshot>(
      stream: isSearchClicked
          ? DbBookmark.searchBookmark(searchText)
          : DbBookmark.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              DocumentSnapshot articles = snapshot.data!.docs[index];

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/articleb',
                      arguments: articles);
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
                            articles['title'] ?? "Judul Tidak Ada",
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
                                articles['author'] ?? "Author Tidak Ada",
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
                                  articles['publishedAt'] ??
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
                        articles['urlToImage'] ??
                            "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                        width: 112,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 24,
            ),
            itemCount: snapshot.data!.docs.length,
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
