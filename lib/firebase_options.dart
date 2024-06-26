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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDiu_AI6oZGYbfphkl5Ka2-bVCR0IOYyoo',
    appId: '1:1049301088125:web:edfe84310fc8f21be8fe14',
    messagingSenderId: '1049301088125',
    projectId: 'findme-c29f1',
    authDomain: 'findme-c29f1.firebaseapp.com',
    storageBucket: 'findme-c29f1.appspot.com',
    measurementId: 'G-FW6S6KBMPR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdi2maWKoplrL6A2myF12A7rk1lNi52ek',
    appId: '1:1049301088125:android:35bcd1d610295577e8fe14',
    messagingSenderId: '1049301088125',
    projectId: 'findme-c29f1',
    storageBucket: 'findme-c29f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBguEUIk2MXLmOSZSL7CzkCmW1UYiOJ94Y',
    appId: '1:1049301088125:ios:ff12b1d021a968b3e8fe14',
    messagingSenderId: '1049301088125',
    projectId: 'findme-c29f1',
    storageBucket: 'findme-c29f1.appspot.com',
    androidClientId:
        '1049301088125-t80itp1fvio4n8c8g3n476s7rt0htkeg.apps.googleusercontent.com',
    iosClientId:
        '1049301088125-pjr8coiruuhhgkk8eae825juhabeerir.apps.googleusercontent.com',
    iosBundleId: 'com.tritec.findMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBguEUIk2MXLmOSZSL7CzkCmW1UYiOJ94Y',
    appId: '1:1049301088125:ios:ff12b1d021a968b3e8fe14',
    messagingSenderId: '1049301088125',
    projectId: 'findme-c29f1',
    storageBucket: 'findme-c29f1.appspot.com',
    androidClientId:
        '1049301088125-t80itp1fvio4n8c8g3n476s7rt0htkeg.apps.googleusercontent.com',
    iosClientId:
        '1049301088125-pjr8coiruuhhgkk8eae825juhabeerir.apps.googleusercontent.com',
    iosBundleId: 'com.tritec.findMe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDiu_AI6oZGYbfphkl5Ka2-bVCR0IOYyoo',
    appId: '1:1049301088125:web:1fd35e60143e688ee8fe14',
    messagingSenderId: '1049301088125',
    projectId: 'findme-c29f1',
    authDomain: 'findme-c29f1.firebaseapp.com',
    storageBucket: 'findme-c29f1.appspot.com',
    measurementId: 'G-3Q2J1P2Y59',
  );
}
