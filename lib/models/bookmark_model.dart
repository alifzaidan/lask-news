import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarkModel {
  final String title;
  final String author;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  BookmarkModel({
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

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      title: json['title'],
      author: json['author'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  factory BookmarkModel.fromSnapshot(DocumentSnapshot snapshot) {
    return BookmarkModel(
      title: snapshot.get('title'),
      author: snapshot.get('author'),
      url: snapshot.get('url'),
      urlToImage: snapshot.get('urlToImage'),
      publishedAt: snapshot.get('publishedAt'),
      content: snapshot.get('content'),
    );
  }
}
