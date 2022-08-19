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
    apiKey: 'AIzaSyBkNl-QHli3sv33aXS7w0wmZb_ERrgalv0',
    appId: '1:992996802815:web:17d54da19f008de72a0cca',
    messagingSenderId: '992996802815',
    projectId: 'ontariapp',
    authDomain: 'ontariapp.firebaseapp.com',
    storageBucket: 'ontariapp.appspot.com',
    measurementId: 'G-025RQD5DE2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZJt3G6j77zkhon-LTOmvArkxjuCCAru0',
    appId: '1:992996802815:android:87b900e021a2d1fb2a0cca',
    messagingSenderId: '992996802815',
    projectId: 'ontariapp',
    storageBucket: 'ontariapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtNin7t8FDc0tcJ4fOcJCxfnKN5gv9qeE',
    appId: '1:992996802815:ios:3a65c09bd4cacd012a0cca',
    messagingSenderId: '992996802815',
    projectId: 'ontariapp',
    storageBucket: 'ontariapp.appspot.com',
    iosClientId: '992996802815-r7smmqpsf4b20j62gegfe6bvvgrjt8l5.apps.googleusercontent.com',
    iosBundleId: 'com.example.ontariApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtNin7t8FDc0tcJ4fOcJCxfnKN5gv9qeE',
    appId: '1:992996802815:ios:3a65c09bd4cacd012a0cca',
    messagingSenderId: '992996802815',
    projectId: 'ontariapp',
    storageBucket: 'ontariapp.appspot.com',
    iosClientId: '992996802815-r7smmqpsf4b20j62gegfe6bvvgrjt8l5.apps.googleusercontent.com',
    iosBundleId: 'com.example.ontariApp',
  );
}