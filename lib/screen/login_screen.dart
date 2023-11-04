import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
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
            Image.asset('assets/images/building.png'),
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
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
                    'Please fill username an password correctly',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF6D6265),
                    ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Text(
                    'Username',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: _usernameController,
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
                        String username = _usernameController.text;
                        Navigator.pushNamed(context, '/dashboard',
                            arguments: username);
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
                            'Login',
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
                            FontAwesomeIcons.doorOpen,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
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
