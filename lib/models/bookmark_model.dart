import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarkModel {
  final String id;
  final String author;
  final String title;
  final String urlToImage;
  final String publishedAt;
  final String content;

  BookmarkModel({
    required this.id,
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      id: json['id'],
      author: json['author'],
      title: json['title'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  factory BookmarkModel.fromSnapshot(DocumentSnapshot snapshot) {
    return BookmarkModel(
      id: snapshot.get('id'),
      author: snapshot.get('author'),
      title: snapshot.get('title'),
      urlToImage: snapshot.get('urlToImage'),
      publishedAt: snapshot.get('publishedAt'),
      content: snapshot.get('content'),
    );
  }
}
