import 'package:firebase_core/firebase_core.dart';
import 'package:lask_news_app/screen/aboutus_screen.dart';
import 'package:lask_news_app/screen/article_b_screen.dart';
import 'package:lask_news_app/screen/justforyou_screen.dart';
import 'package:lask_news_app/screen/myaccount_screen.dart';
import 'package:lask_news_app/screen/myarticle_d_screen.dart';
import 'package:lask_news_app/screen/myarticle_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:lask_news_app/screen/bookmark_screen.dart';
import 'package:lask_news_app/screen/navigation.dart';
import 'package:lask_news_app/screen/home_screen.dart';
import 'package:lask_news_app/screen/article_screen.dart';
import 'package:lask_news_app/screen/explore_screen.dart';
import 'package:lask_news_app/screen/login_screen.dart';
import 'package:lask_news_app/screen/register_screen.dart';
import 'package:lask_news_app/screen/splash_screen.dart';
import 'package:lask_news_app/screen/welcome_dart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lask News App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const Navigation(),
        '/home': (context) => const HomeScreen(),
        '/explore': (context) => const ExploreScreen(),
        '/bookmark': (context) => const BookmarkScreen(),
        '/article': (context) => const ArticleScreen(),
        '/articleb': (context) => const ArticleBScreen(),
        '/justforyou': (context) => const JustForYouScreen(),
        '/myarticles': (context) => const MyArticleScreen(),
        '/myarticle': (context) => const MyArticleDetailScreen(),
        '/account': (context) => MyAccountScreen(),
        '/aboutus': (context) => const AboutUsScreen(),
      },
    );
  }
}
