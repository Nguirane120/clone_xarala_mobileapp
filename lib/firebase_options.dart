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
    apiKey: 'AIzaSyDKMLaaInHI8bpHRGspa8iaRBpWAiiKMq8',
    appId: '1:265790904991:web:20f380f664b47304f3a0aa',
    messagingSenderId: '265790904991',
    projectId: 'xaral-app',
    authDomain: 'xaral-app.firebaseapp.com',
    storageBucket: 'xaral-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgOfMfTcEotKp3q-80r32-uwjivZ2e49Y',
    appId: '1:265790904991:android:9e47764814e18c1ff3a0aa',
    messagingSenderId: '265790904991',
    projectId: 'xaral-app',
    storageBucket: 'xaral-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHRdfZO7dyTPlD0NN_hWcIY_NB1vvkwg8',
    appId: '1:265790904991:ios:97c5d4e20e55d528f3a0aa',
    messagingSenderId: '265790904991',
    projectId: 'xaral-app',
    storageBucket: 'xaral-app.firebasestorage.app',
    iosClientId: '265790904991-dtum995rtu60de2pmvbcetn9966i1grc.apps.googleusercontent.com',
    iosBundleId: 'com.example.clonexaralalmobileapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHRdfZO7dyTPlD0NN_hWcIY_NB1vvkwg8',
    appId: '1:265790904991:ios:97c5d4e20e55d528f3a0aa',
    messagingSenderId: '265790904991',
    projectId: 'xaral-app',
    storageBucket: 'xaral-app.firebasestorage.app',
    iosClientId: '265790904991-dtum995rtu60de2pmvbcetn9966i1grc.apps.googleusercontent.com',
    iosBundleId: 'com.example.clonexaralalmobileapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKMLaaInHI8bpHRGspa8iaRBpWAiiKMq8',
    appId: '1:265790904991:web:2592649c4c356741f3a0aa',
    messagingSenderId: '265790904991',
    projectId: 'xaral-app',
    authDomain: 'xaral-app.firebaseapp.com',
    storageBucket: 'xaral-app.firebasestorage.app',
  );

}