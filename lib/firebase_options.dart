
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
    apiKey: 'AIzaSyCOUPHdu8r8cWIDvGw6HY4TPfEHe2McTzQ',
    appId: '1:616802356174:web:742dde0000b2b16a12f99f',
    messagingSenderId: '616802356174',
    projectId: 'mtrack-d2555',
    authDomain: 'mtrack-d2555.firebaseapp.com',
    storageBucket: 'mtrack-d2555.firebasestorage.app',
    measurementId: 'G-T8J61PHGZV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzzqBUM3ViHgrziuMEihH4uBo54TXqRTw',
    appId: '1:616802356174:android:817ba01398c134c212f99f',
    messagingSenderId: '616802356174',
    projectId: 'mtrack-d2555',
    storageBucket: 'mtrack-d2555.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDBMFwfID3Y-Cvu8jto3tA0_PTYXkbHAs',
    appId: '1:616802356174:ios:4e998dfff2c40f7112f99f',
    messagingSenderId: '616802356174',
    projectId: 'mtrack-d2555',
    storageBucket: 'mtrack-d2555.firebasestorage.app',
    iosBundleId: 'com.example.maktrack',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDBMFwfID3Y-Cvu8jto3tA0_PTYXkbHAs',
    appId: '1:616802356174:ios:4e998dfff2c40f7112f99f',
    messagingSenderId: '616802356174',
    projectId: 'mtrack-d2555',
    storageBucket: 'mtrack-d2555.firebasestorage.app',
    iosBundleId: 'com.example.maktrack',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOUPHdu8r8cWIDvGw6HY4TPfEHe2McTzQ',
    appId: '1:616802356174:web:670c7b960250f51212f99f',
    messagingSenderId: '616802356174',
    projectId: 'mtrack-d2555',
    authDomain: 'mtrack-d2555.firebaseapp.com',
    storageBucket: 'mtrack-d2555.firebasestorage.app',
    measurementId: 'G-HRQ6Z0CZSQ',
  );

}