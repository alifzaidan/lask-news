import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lask_news_app/services/firebase_auth_service.dart';
import 'package:lask_news_app/services/user_services.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              _account(),
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
        child: Text(
          "My Account",
          style: GoogleFonts.inter(
            fontSize: 28,
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
    );
  }

  Container _account() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: FutureBuilder(
          future: DbUser.getUserByEmail(_authService.getCurrentUser()!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot user = snapshot.data![0];

              String badge = "";
              int level = 0;
              if (user['articlesRead'] < 10) {
                level = 1;
                badge = "Bookworm";
              } else if (user['articlesRead'] < 20) {
                level = 2;
                badge = "Critical Thinker";
              } else if (user['articlesRead'] < 30) {
                level = 3;
                badge = "Knowledgeable";
              }

              return Column(
                children: [
                  Text(
                    user['name'],
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    badge,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF2D5BD0),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Article Read',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF6D6265),
                            ),
                          ),
                          Text(
                            user['articlesRead'].toString(),
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Level',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF6D6265),
                            ),
                          ),
                          Text(
                            level.toString(),
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF6D6265),
                            ),
                          ),
                          Text(
                            user['email'],
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delete Account',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF6D6265),
                            ),
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: DbUser.getData(),
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                  onPressed: () {
                                    FirebaseAuthService.deleteUser();
                                    DbUser.deleteData(user);
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE02607),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: Text(
                                    'Delete',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error retrieving user data: ${snapshot.error}');
            } else {
              return const Text("Loading...");
            }
          }),
    );
  }
}
