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
    apiKey: 'AIzaSyDldZBS4hBRDmuS2ErUrPsPfUm_aPLk4OY',
    appId: '1:387656492796:web:44af30af2d1a1e4f935979',
    messagingSenderId: '387656492796',
    projectId: 'flutter-93dfe',
    authDomain: 'flutter-93dfe.firebaseapp.com',
    storageBucket: 'flutter-93dfe.appspot.com',
    measurementId: 'G-85GPQ32XBR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9MWowXqxjydY59onaIVndp7pASRqgm5Y',
    appId: '1:387656492796:android:ee66ae49c4160342935979',
    messagingSenderId: '387656492796',
    projectId: 'flutter-93dfe',
    storageBucket: 'flutter-93dfe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9FS_pgBApKHzjh-SrdyJHkcsalRlEwkM',
    appId: '1:387656492796:ios:30f3282a0f428713935979',
    messagingSenderId: '387656492796',
    projectId: 'flutter-93dfe',
    storageBucket: 'flutter-93dfe.appspot.com',
    iosClientId:
        '387656492796-ovr8virsspd00nhtk5ejer2g6p5ndjul.apps.googleusercontent.com',
    iosBundleId: 'com.example.iosReminders',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9FS_pgBApKHzjh-SrdyJHkcsalRlEwkM',
    appId: '1:387656492796:ios:30f3282a0f428713935979',
    messagingSenderId: '387656492796',
    projectId: 'flutter-93dfe',
    storageBucket: 'flutter-93dfe.appspot.com',
    iosClientId:
        '387656492796-ovr8virsspd00nhtk5ejer2g6p5ndjul.apps.googleusercontent.com',
    iosBundleId: 'com.example.iosReminders',
  );
}
