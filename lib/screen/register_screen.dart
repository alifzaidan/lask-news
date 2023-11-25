import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lask_news_app/models/user_model.dart';
import 'package:lask_news_app/services/firebase_auth_service.dart';
import 'package:lask_news_app/services/user_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> _register() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.signUpWithEmailAndPassword(
      email: email,
      password: password,
      context: context,
    );

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User is successfully created'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot create user'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 0.2),
            colors: [Color(0xFF2148D4), Color(0xFFE9EEFA)],
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(32),
              margin: const EdgeInsets.only(top: 180),
              child: ListView(
                children: [
                  Text(
                    'Sign Up',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Please fill your information below',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF6D6265),
                    ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Text(
                    'Email',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Name',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Password',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        _register();
                        final userbaru = UserModel(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          articlesRead: 0,
                        );
                        DbUser.addData(itemuser: userbaru);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2F54D7),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Register',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.doorClosed,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2148D4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
