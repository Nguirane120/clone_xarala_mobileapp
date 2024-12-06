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
    apiKey: 'AIzaSyDPej9UyuqiY6NSw3E9mDc4BE4_dPIxXDY',
    appId: '1:614279437607:web:63be0bb964d388b46d9d02',
    messagingSenderId: '614279437607',
    projectId: 'xarala-a20ec',
    authDomain: 'xarala-a20ec.firebaseapp.com',
    storageBucket: 'xarala-a20ec.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8AVG2L6auCmFXF8Iw3YJumj67PPouyyU',
    appId: '1:614279437607:android:0fcfc0ec7b7c9ba56d9d02',
    messagingSenderId: '614279437607',
    projectId: 'xarala-a20ec',
    storageBucket: 'xarala-a20ec.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQXBbT44LdUKYrClWjV62qlypaqhnPuZA',
    appId: '1:614279437607:ios:f7879ddab51d60c16d9d02',
    messagingSenderId: '614279437607',
    projectId: 'xarala-a20ec',
    storageBucket: 'xarala-a20ec.firebasestorage.app',
    iosBundleId: 'com.example.clonexaralalmobileapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQXBbT44LdUKYrClWjV62qlypaqhnPuZA',
    appId: '1:614279437607:ios:f7879ddab51d60c16d9d02',
    messagingSenderId: '614279437607',
    projectId: 'xarala-a20ec',
    storageBucket: 'xarala-a20ec.firebasestorage.app',
    iosBundleId: 'com.example.clonexaralalmobileapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPej9UyuqiY6NSw3E9mDc4BE4_dPIxXDY',
    appId: '1:614279437607:web:35613d599b74e86d6d9d02',
    messagingSenderId: '614279437607',
    projectId: 'xarala-a20ec',
    authDomain: 'xarala-a20ec.firebaseapp.com',
    storageBucket: 'xarala-a20ec.firebasestorage.app',
  );
}
