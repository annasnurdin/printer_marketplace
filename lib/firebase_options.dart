// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCFTl05eOlAADSU_yQOroMIA5SoBeSvPVs',
    appId: '1:832114074359:web:d6e2e9b409e793fc0929f2',
    messagingSenderId: '832114074359',
    projectId: 'rangorang-4208d',
    authDomain: 'rangorang-4208d.firebaseapp.com',
    databaseURL: 'https://rangorang-4208d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'rangorang-4208d.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfqXqs6amhLyaVekSI50_r8jk-6nsP-6k',
    appId: '1:832114074359:android:c353d7336ef3b9a70929f2',
    messagingSenderId: '832114074359',
    projectId: 'rangorang-4208d',
    databaseURL: 'https://rangorang-4208d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'rangorang-4208d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQB1mleDUr0v2W8LO6nxtsCV0L0eqFu6Y',
    appId: '1:832114074359:ios:5d418c1ae4c703860929f2',
    messagingSenderId: '832114074359',
    projectId: 'rangorang-4208d',
    databaseURL: 'https://rangorang-4208d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'rangorang-4208d.firebasestorage.app',
    iosBundleId: 'com.example.printerMarketplace',
  );
}
