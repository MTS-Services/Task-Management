
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyCniAFfr2NSjS1FwT02vTRkoalZSvqQLQg',
    appId: '1:669916132195:web:14742c0fca28b5c20a9956',
    messagingSenderId: '669916132195',
    projectId: 'm-track-a4a30',
    authDomain: 'm-track-a4a30.firebaseapp.com',
    storageBucket: 'm-track-a4a30.firebasestorage.app',
    measurementId: 'G-WWM64TH5QF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6J-ZDPu7VhBv1Q7Ee_L546A0kGCUV9Gk',
    appId: '1:669916132195:android:5dddb5883292fc4b0a9956',
    messagingSenderId: '669916132195',
    projectId: 'm-track-a4a30',
    storageBucket: 'm-track-a4a30.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqfgePWS-W7yExMsnSVa-Mp00i63XXJkc',
    appId: '1:669916132195:ios:6757425851d11c690a9956',
    messagingSenderId: '669916132195',
    projectId: 'm-track-a4a30',
    storageBucket: 'm-track-a4a30.firebasestorage.app',
    iosBundleId: 'com.example.maktrack',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqfgePWS-W7yExMsnSVa-Mp00i63XXJkc',
    appId: '1:669916132195:ios:6757425851d11c690a9956',
    messagingSenderId: '669916132195',
    projectId: 'm-track-a4a30',
    storageBucket: 'm-track-a4a30.firebasestorage.app',
    iosBundleId: 'com.example.maktrack',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCniAFfr2NSjS1FwT02vTRkoalZSvqQLQg',
    appId: '1:669916132195:web:aa8a8644a38cb5070a9956',
    messagingSenderId: '669916132195',
    projectId: 'm-track-a4a30',
    authDomain: 'm-track-a4a30.firebaseapp.com',
    storageBucket: 'm-track-a4a30.firebasestorage.app',
    measurementId: 'G-1B3RWXL3S3',
  );

}