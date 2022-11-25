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
    apiKey: 'AIzaSyCbI6-AG15BaVviNdOSjqYk3mb6jgvjexg',
    appId: '1:741675064006:web:b599ecf5734eb75d8915c7',
    messagingSenderId: '741675064006',
    projectId: 'todo2-31d2c',
    authDomain: 'todo2-31d2c.firebaseapp.com',
    storageBucket: 'todo2-31d2c.appspot.com',
    measurementId: 'G-DNX5YNH06X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF8-wR-k0WlcmUQKkXAp1IfuXVTUwB3LQ',
    appId: '1:741675064006:android:f7ad8bd4781895418915c7',
    messagingSenderId: '741675064006',
    projectId: 'todo2-31d2c',
    storageBucket: 'todo2-31d2c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDA6DZCnPYezL7fA4KPogCg3kLukgrGnj0',
    appId: '1:741675064006:ios:e31adcdf295c59578915c7',
    messagingSenderId: '741675064006',
    projectId: 'todo2-31d2c',
    storageBucket: 'todo2-31d2c.appspot.com',
    iosClientId: '741675064006-d14il2mmhf3vkb5odpri3l89n6p8n2af.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDA6DZCnPYezL7fA4KPogCg3kLukgrGnj0',
    appId: '1:741675064006:ios:e31adcdf295c59578915c7',
    messagingSenderId: '741675064006',
    projectId: 'todo2-31d2c',
    storageBucket: 'todo2-31d2c.appspot.com',
    iosClientId: '741675064006-d14il2mmhf3vkb5odpri3l89n6p8n2af.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}