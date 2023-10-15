import 'package:flutter/material.dart';
import 'package:lask_news_app/models/article_model.dart';
import 'package:lask_news_app/services/api_services.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  ApiHeadline client = ApiHeadline();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(articles![index].title ?? ""),
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
    );
  }
}
