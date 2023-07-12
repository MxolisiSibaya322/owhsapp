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
    apiKey: 'AIzaSyAkDPnHHscEjLJE6GkygX9omN9gnh0h2HQ',
    appId: '1:569357099758:web:85636bbf2039d3c00d89ff',
    messagingSenderId: '569357099758',
    projectId: 'owhs-b725d',
    authDomain: 'owhs-b725d.firebaseapp.com',
    databaseURL: 'https://owhs-b725d-default-rtdb.firebaseio.com',
    storageBucket: 'owhs-b725d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiHMHCWTA8Fok5eL8GNba-4q3bMyeNT1U',
    appId: '1:569357099758:android:b79c9826c86adcd00d89ff',
    messagingSenderId: '569357099758',
    projectId: 'owhs-b725d',
    databaseURL: 'https://owhs-b725d-default-rtdb.firebaseio.com',
    storageBucket: 'owhs-b725d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDftSfDc-Q3Kroco0gc2Tx41uPimLlvlqk',
    appId: '1:569357099758:ios:105a4337a2b1eb760d89ff',
    messagingSenderId: '569357099758',
    projectId: 'owhs-b725d',
    databaseURL: 'https://owhs-b725d-default-rtdb.firebaseio.com',
    storageBucket: 'owhs-b725d.appspot.com',
    iosClientId: '569357099758-tj79jr3rjtuda6ajq561n1no2pbf8r3a.apps.googleusercontent.com',
    iosBundleId: 'com.example.owhsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDftSfDc-Q3Kroco0gc2Tx41uPimLlvlqk',
    appId: '1:569357099758:ios:3cb0f27eede309b90d89ff',
    messagingSenderId: '569357099758',
    projectId: 'owhs-b725d',
    databaseURL: 'https://owhs-b725d-default-rtdb.firebaseio.com',
    storageBucket: 'owhs-b725d.appspot.com',
    iosClientId: '569357099758-lfsiktrcfif6p8ga9k73l0ss8f51o4v2.apps.googleusercontent.com',
    iosBundleId: 'com.example.owhsapp.RunnerTests',
  );
}
