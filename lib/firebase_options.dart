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
    apiKey: 'AIzaSyC4wG2icc_02IhmBtsVHtYnJbyfAjqQlZw',
    appId: '1:303560604646:web:1bd76f1a23e06348a9b427',
    messagingSenderId: '303560604646',
    projectId: 'ggradedb',
    authDomain: 'ggradedb.firebaseapp.com',
    storageBucket: 'ggradedb.appspot.com',
    measurementId: 'G-V7RD5WD5WW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsM5oWAniFSSkM3N53MwPFK7d-CvU2cog',
    appId: '1:303560604646:android:12041cc38140ba9ba9b427',
    messagingSenderId: '303560604646',
    projectId: 'ggradedb',
    storageBucket: 'ggradedb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpO5kTsiXfj0Y6EXgaGMpwLLncMMcGcXU',
    appId: '1:303560604646:ios:9600534aeecf776fa9b427',
    messagingSenderId: '303560604646',
    projectId: 'ggradedb',
    storageBucket: 'ggradedb.appspot.com',
    iosClientId: '303560604646-n09e5gh9eesm3m1ehcgpro32irrcahl7.apps.googleusercontent.com',
    iosBundleId: 'com.example.ggradeProj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpO5kTsiXfj0Y6EXgaGMpwLLncMMcGcXU',
    appId: '1:303560604646:ios:3c74f0b499e3729ca9b427',
    messagingSenderId: '303560604646',
    projectId: 'ggradedb',
    storageBucket: 'ggradedb.appspot.com',
    iosClientId: '303560604646-vq9ckilfrs684r6edp09pph9oij8m494.apps.googleusercontent.com',
    iosBundleId: 'com.example.ggradetest',
  );
}
