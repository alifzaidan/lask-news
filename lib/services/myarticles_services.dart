import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lask_news_app/models/myarticles_model.dart';

final CollectionReference _myarticle =
    FirebaseFirestore.instance.collection('myarticles');

final TextEditingController _titleController = TextEditingController();
final TextEditingController _authorController = TextEditingController();
final TextEditingController _urlController = TextEditingController();
final TextEditingController _urlToImageController = TextEditingController();
final TextEditingController _contentController = TextEditingController();

class DbMyArticle {
  static Stream<QuerySnapshot> getData() {
    return _myarticle.snapshots();
  }

  static Future<void> create(BuildContext context) async {
    _titleController.clear();
    _authorController.clear();
    _urlController.clear();
    _urlToImageController.clear();
    _contentController.clear();

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Author'),
              ),
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: 'URL'),
              ),
              TextField(
                controller: _urlToImageController,
                decoration: const InputDecoration(labelText: 'URL Image'),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final newarticle = MyArticlesModel(
                    title: _titleController.text,
                    author: _authorController.text,
                    url: _urlController.text,
                    urlToImage: _urlToImageController.text,
                    publishedAt: DateTime.now().toIso8601String(),
                    content: _contentController.text,
                  );
                  await _myarticle.add(newarticle.toJson());
                },
                child: const Text('Create'),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> update(
      DocumentSnapshot? snapshot, BuildContext context) async {
    if (snapshot != null) {
      _titleController.text = snapshot['title'];
      _urlController.text = snapshot['url'];
      _urlToImageController.text = snapshot['urlToImage'];
      _contentController.text = snapshot['content'];
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: 'URL'),
              ),
              TextField(
                controller: _urlToImageController,
                decoration: const InputDecoration(labelText: 'URL Image'),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final editarticle = MyArticlesModel(
                    title: _titleController.text,
                    author: snapshot!['author'],
                    url: _urlController.text,
                    urlToImage: _urlToImageController.text,
                    publishedAt: DateTime.now().toIso8601String(),
                    content: _contentController.text,
                  );
                  await _myarticle
                      .doc(snapshot.id)
                      .update(editarticle.toJson());
                },
                child: const Text('Update'),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> delete(
      DocumentSnapshot snapshot, BuildContext context) async {
    await _myarticle.doc(snapshot.id).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Article deleted'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  static Stream<QuerySnapshot> searchArticle(String title) {
    return _myarticle.where("title", isEqualTo: title).snapshots();
  }
}
