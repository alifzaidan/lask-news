import 'package:cloud_firestore/cloud_firestore.dart';

class MyArticlesModel {
  final String title;
  final String author;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  MyArticlesModel({
    required this.title,
    required this.author,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory MyArticlesModel.fromJson(Map<String, dynamic> json) {
    return MyArticlesModel(
      title: json['title'],
      author: json['author'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  factory MyArticlesModel.fromSnapshot(DocumentSnapshot snapshot) {
    return MyArticlesModel(
      title: snapshot.get('title'),
      author: snapshot.get('author'),
      url: snapshot.get('url'),
      urlToImage: snapshot.get('urlToImage'),
      publishedAt: snapshot.get('publishedAt'),
      content: snapshot.get('content'),
    );
  }
}
