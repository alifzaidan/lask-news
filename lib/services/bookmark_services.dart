import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask_news_app/models/bookmark_model.dart';

CollectionReference bookmark =
    FirebaseFirestore.instance.collection('bookmark');

class DbBookmark {
  static Stream<QuerySnapshot> getData() {
    return bookmark.snapshots();
  }

  static Future<void> addData({required BookmarkModel itembookmark}) async {
    DocumentReference docRef = bookmark.doc(itembookmark.id);
    await docRef
        .set(itembookmark.toJson())
        .whenComplete(() => print('Data berhasil ditambahkan'))
        .catchError((e) => print(e));
  }

  static Future<void> updateData({required BookmarkModel itembookmark}) async {
    DocumentReference docRef = bookmark.doc(itembookmark.id);
    await docRef
        .update(itembookmark.toJson())
        .whenComplete(() => print('Data berhasil diubah'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteData({required String id}) async {
    DocumentReference docRef = bookmark.doc(id);
    await docRef
        .delete()
        .whenComplete(() => print('Data berhasil dihapus'))
        .catchError((e) => print(e));
  }
}
