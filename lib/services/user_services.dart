import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask_news_app/models/user_model.dart';

CollectionReference user = FirebaseFirestore.instance.collection('users');

class DbUser {
  static Stream<QuerySnapshot> getData() {
    return user.snapshots();
  }

  static Future<void> addData({required UserModel itemuser}) async {
    await user.add(itemuser.toJson());
  }

  static Future<void> updateData(
      {required String id, required UserModel itemuser}) async {
    await user.doc(id).update(itemuser.toJson());
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getUserByEmail(
      String email) {
    return user
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs);
  }
}
