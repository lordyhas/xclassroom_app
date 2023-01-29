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
    apiKey: 'AIzaSyAGew20TRRCAOuWyfWv-jkgYNHcDtI_4Tw',
    appId: '1:143621298817:web:1d2d7dc7ee4d4283b14b80',
    messagingSenderId: '143621298817',
    projectId: 'studentbigspace',
    authDomain: 'studentbigspace.firebaseapp.com',
    storageBucket: 'studentbigspace.appspot.com',
    measurementId: 'G-RX75XG3065',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA17UOhA7xOWGn0I5Xb29AAf14XYn5cjEw',
    appId: '1:143621298817:android:1cfa56da2cef2203b14b80',
    messagingSenderId: '143621298817',
    projectId: 'studentbigspace',
    storageBucket: 'studentbigspace.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmi-RoU9ck0_41NLT87Q1zUTvkuVTEKGY',
    appId: '1:143621298817:ios:dabee90048848a31b14b80',
    messagingSenderId: '143621298817',
    projectId: 'studentbigspace',
    storageBucket: 'studentbigspace.appspot.com',
    iosClientId: '143621298817-1n2847ju0mcltv82369rinrasa9796sp.apps.googleusercontent.com',
    iosBundleId: 'com.lordyhas.unhorizons.unhorizons',
  );
}
