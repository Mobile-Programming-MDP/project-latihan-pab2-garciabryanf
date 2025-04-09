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
    apiKey: 'AIzaSyDcbOdf35L4G6oysF5a5W2q06cbyd_f7Uk',
    appId: '1:73435180499:web:451163b6b777076eb61326',
    messagingSenderId: '73435180499',
    projectId: 'bryanfarrel',
    authDomain: 'bryanfarrel.firebaseapp.com',
    storageBucket: 'bryanfarrel.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdS_FTl_RiqyFem1Xol5UytA7nyA5pVfo',
    appId: '1:73435180499:android:a3f4eed96fff8db4b61326',
    messagingSenderId: '73435180499',
    projectId: 'bryanfarrel',
    storageBucket: 'bryanfarrel.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCL8RWNnI7Z0f8RXO6nQK7UPg3YPBFW9U',
    appId: '1:73435180499:ios:88c2ef8857d20e70b61326',
    messagingSenderId: '73435180499',
    projectId: 'bryanfarrel',
    storageBucket: 'bryanfarrel.firebasestorage.app',
    iosBundleId: 'com.example.bryanfarrelApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCL8RWNnI7Z0f8RXO6nQK7UPg3YPBFW9U',
    appId: '1:73435180499:ios:88c2ef8857d20e70b61326',
    messagingSenderId: '73435180499',
    projectId: 'bryanfarrel',
    storageBucket: 'bryanfarrel.firebasestorage.app',
    iosBundleId: 'com.example.bryanfarrelApps',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDcbOdf35L4G6oysF5a5W2q06cbyd_f7Uk',
    appId: '1:73435180499:web:0125a2e51f3257a6b61326',
    messagingSenderId: '73435180499',
    projectId: 'bryanfarrel',
    authDomain: 'bryanfarrel.firebaseapp.com',
    storageBucket: 'bryanfarrel.firebasestorage.app',
  );
}
