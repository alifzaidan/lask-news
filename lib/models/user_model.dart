import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  final int articlesRead;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.articlesRead,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'articlesRead': articlesRead,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      articlesRead: json['articlesRead'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      password: snapshot.get('password'),
      articlesRead: snapshot.get('articlesRead'),
    );
  }
}
