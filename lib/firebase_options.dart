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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAuK-fLxcyC6auz6J5uNhr17yQeZABgpTc',
    appId: '1:604485732042:web:723081fd07c0dacfa89633',
    messagingSenderId: '604485732042',
    projectId: 'weatherforecast-45928',
    authDomain: 'weatherforecast-45928.firebaseapp.com',
    databaseURL: 'https://weatherforecast-45928-default-rtdb.firebaseio.com',
    storageBucket: 'weatherforecast-45928.appspot.com',
    measurementId: 'G-ZNP34XVQFE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiQupOsNlVEm-2CS9yOUBbCwUAqklE8t4',
    appId: '1:604485732042:android:413656ac63d83691a89633',
    messagingSenderId: '604485732042',
    projectId: 'weatherforecast-45928',
    databaseURL: 'https://weatherforecast-45928-default-rtdb.firebaseio.com',
    storageBucket: 'weatherforecast-45928.appspot.com',
  );
}