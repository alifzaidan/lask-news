// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAZxivb695qv-GceuykDMLvP2JrXp2xzAQ',
    appId: '1:1013053364799:web:e33d207a3c336a0cebb68a',
    messagingSenderId: '1013053364799',
    projectId: 'lask-news-354f0',
    authDomain: 'lask-news-354f0.firebaseapp.com',
    storageBucket: 'lask-news-354f0.appspot.com',
    measurementId: 'G-MG1KRGLFCN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKP5hEDyxogpdzyjxhPKpWaHoHY60Bieo',
    appId: '1:1013053364799:android:a325f0c0dfedfe9aebb68a',
    messagingSenderId: '1013053364799',
    projectId: 'lask-news-354f0',
    storageBucket: 'lask-news-354f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnBP1J3hc6YQTBOt_I0LkBX19-WrdoiwA',
    appId: '1:1013053364799:ios:35aa74e5de47caf4ebb68a',
    messagingSenderId: '1013053364799',
    projectId: 'lask-news-354f0',
    storageBucket: 'lask-news-354f0.appspot.com',
    iosBundleId: 'com.example.laskNewsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnBP1J3hc6YQTBOt_I0LkBX19-WrdoiwA',
    appId: '1:1013053364799:ios:a3696dbfa90bfb76ebb68a',
    messagingSenderId: '1013053364799',
    projectId: 'lask-news-354f0',
    storageBucket: 'lask-news-354f0.appspot.com',
    iosBundleId: 'com.example.laskNewsApp.RunnerTests',
  );
}
