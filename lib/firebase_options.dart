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
    apiKey: 'AIzaSyCTb7968iOFUBQ8yic6zuVJDzGEwbmLMdE',
    appId: '1:538838446367:web:a09ec9414bc93bfc39c02a',
    messagingSenderId: '538838446367',
    projectId: 'washalert-a94b7',
    authDomain: 'washalert-a94b7.firebaseapp.com',
    storageBucket: 'washalert-a94b7.appspot.com',
    measurementId: 'G-C02DV4XX5F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzER3D4-1b4uCYJr_21_Nm6ZnEJ2F7GFs',
    appId: '1:538838446367:android:c0988c00a14d0dc839c02a',
    messagingSenderId: '538838446367',
    projectId: 'washalert-a94b7',
    storageBucket: 'washalert-a94b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDk1k6qshHHtSzqHrtiSiiLROzTBskk0nU',
    appId: '1:538838446367:ios:d103e2f0cd49eb8839c02a',
    messagingSenderId: '538838446367',
    projectId: 'washalert-a94b7',
    storageBucket: 'washalert-a94b7.appspot.com',
    iosBundleId: 'com.example.washalert',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDk1k6qshHHtSzqHrtiSiiLROzTBskk0nU',
    appId: '1:538838446367:ios:1ec3dbf9de1b53da39c02a',
    messagingSenderId: '538838446367',
    projectId: 'washalert-a94b7',
    storageBucket: 'washalert-a94b7.appspot.com',
    iosBundleId: 'com.example.washalert.RunnerTests',
  );
}
