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
    apiKey: 'AIzaSyCwG1lTIibVjsL7CqsWGt1KwibdYWNN3oI',
    appId: '1:80771362941:web:cebc1b29c0c29854990114',
    messagingSenderId: '80771362941',
    projectId: 'viva2024-ca8e2',
    authDomain: 'viva2024-ca8e2.firebaseapp.com',
    storageBucket: 'viva2024-ca8e2.appspot.com',
    measurementId: 'G-JT8EXXJ5SL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxZ1J6SO44XeCoIkNwa_Ka_rmqkxIqk68',
    appId: '1:80771362941:android:c59eec1ea397e3fb990114',
    messagingSenderId: '80771362941',
    projectId: 'viva2024-ca8e2',
    storageBucket: 'viva2024-ca8e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDivi5U4Op8RDq2xaMlbG9K3YpNczT5Ysw',
    appId: '1:80771362941:ios:bce742171ce045d4990114',
    messagingSenderId: '80771362941',
    projectId: 'viva2024-ca8e2',
    storageBucket: 'viva2024-ca8e2.appspot.com',
    iosBundleId: 'com.example.viva2024',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDivi5U4Op8RDq2xaMlbG9K3YpNczT5Ysw',
    appId: '1:80771362941:ios:19220c1bf63f5b8a990114',
    messagingSenderId: '80771362941',
    projectId: 'viva2024-ca8e2',
    storageBucket: 'viva2024-ca8e2.appspot.com',
    iosBundleId: 'com.example.viva2024.RunnerTests',
  );
}