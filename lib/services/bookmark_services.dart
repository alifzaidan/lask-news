import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask_news_app/models/bookmark_model.dart';

CollectionReference bookmark =
    FirebaseFirestore.instance.collection('bookmark');

class DbBookmark {
  static Stream<QuerySnapshot> getData() {
    return bookmark.snapshots();
  }

  static Future<void> addData({required BookmarkModel itembookmark}) async {
    await bookmark.add(itembookmark.toJson());
  }

  static Future<void> deleteData(DocumentSnapshot<Object?> article) async {
    await bookmark.doc(article.id).delete();
  }

  static Future<void> searchBookmark(String title) async {
    await bookmark.where('title', isEqualTo: title).get();
  }
}
