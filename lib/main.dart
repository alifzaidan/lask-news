import 'package:flutter/material.dart';
import 'package:lask_news_app/screen/bookmark_screen.dart';
import 'package:lask_news_app/screen/dashboard.dart';
import 'package:lask_news_app/screen/home_screen.dart';
import 'package:lask_news_app/screen/article_screen.dart';
import 'package:lask_news_app/screen/explore_screen.dart';
import 'package:lask_news_app/screen/splash_screen.dart';
import 'package:lask_news_app/screen/welcome_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lask News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF231F20)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/dashboard': (context) => const Dashboard(),
        '/home': (context) => const HomeScreen(),
        '/explore': (context) => const ExploreScreen(),
        '/bookmark': (context) => const BookmarkScreen(),
        '/article': (context) => ArticleScreen(),
      },
      // home: const SplashScreen(),
    );
  }
}
