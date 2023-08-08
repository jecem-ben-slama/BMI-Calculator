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
    apiKey: 'AIzaSyAceCPW-nWgloq2QlMicNTo9Cj8PHqTeSY',
    appId: '1:617019020792:web:6513f413a1b81c3c7b720d',
    messagingSenderId: '617019020792',
    projectId: 'calbmi-554fe',
    authDomain: 'calbmi-554fe.firebaseapp.com',
    databaseURL: 'https://calbmi-554fe-default-rtdb.firebaseio.com',
    storageBucket: 'calbmi-554fe.appspot.com',
    measurementId: 'G-L731M70QLM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUqLhN-cN2ykW3l2lFBqcWF3BSmb4ZWwM',
    appId: '1:617019020792:android:204a3f573d6a187d7b720d',
    messagingSenderId: '617019020792',
    projectId: 'calbmi-554fe',
    databaseURL: 'https://calbmi-554fe-default-rtdb.firebaseio.com',
    storageBucket: 'calbmi-554fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzPUZiErRKHCNa-L7JNuz9MJA9OeGViaE',
    appId: '1:617019020792:ios:194047ee4881ab247b720d',
    messagingSenderId: '617019020792',
    projectId: 'calbmi-554fe',
    databaseURL: 'https://calbmi-554fe-default-rtdb.firebaseio.com',
    storageBucket: 'calbmi-554fe.appspot.com',
    iosClientId: '617019020792-ale7nefnl70e38bk0jusj0aicko9242o.apps.googleusercontent.com',
    iosBundleId: 'com.example.bmi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzPUZiErRKHCNa-L7JNuz9MJA9OeGViaE',
    appId: '1:617019020792:ios:2aef29e775f79c8a7b720d',
    messagingSenderId: '617019020792',
    projectId: 'calbmi-554fe',
    databaseURL: 'https://calbmi-554fe-default-rtdb.firebaseio.com',
    storageBucket: 'calbmi-554fe.appspot.com',
    iosClientId: '617019020792-4ia928ppf6uucrd9fvtrppe7b667n3ht.apps.googleusercontent.com',
    iosBundleId: 'com.example.bmi.RunnerTests',
  );
}
