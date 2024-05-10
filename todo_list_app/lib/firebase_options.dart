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
    apiKey: 'AIzaSyC2d8zPj47nyzRWTudqkbQE2v33W3yYmNk',
    appId: '1:528419481625:web:2029897cfb5beb736da288',
    messagingSenderId: '528419481625',
    projectId: 'todo-list-provider-562e3',
    authDomain: 'todo-list-provider-562e3.firebaseapp.com',
    storageBucket: 'todo-list-provider-562e3.appspot.com',
    measurementId: 'G-0DRS4RLX7Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUrx6o_efhdO2XIMGbaVtEW5xzla-Acsc',
    appId: '1:528419481625:android:e36bdb7bd003fd476da288',
    messagingSenderId: '528419481625',
    projectId: 'todo-list-provider-562e3',
    storageBucket: 'todo-list-provider-562e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUCY-5furCh7hgWspzcGlAVxTj5Bz1WSU',
    appId: '1:528419481625:ios:5ee1898772abc7a86da288',
    messagingSenderId: '528419481625',
    projectId: 'todo-list-provider-562e3',
    storageBucket: 'todo-list-provider-562e3.appspot.com',
    iosBundleId: 'br.com.todolistapp.todoListApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUCY-5furCh7hgWspzcGlAVxTj5Bz1WSU',
    appId: '1:528419481625:ios:5ee1898772abc7a86da288',
    messagingSenderId: '528419481625',
    projectId: 'todo-list-provider-562e3',
    storageBucket: 'todo-list-provider-562e3.appspot.com',
    iosBundleId: 'br.com.todolistapp.todoListApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC2d8zPj47nyzRWTudqkbQE2v33W3yYmNk',
    appId: '1:528419481625:web:fbd5a40ba040fd1f6da288',
    messagingSenderId: '528419481625',
    projectId: 'todo-list-provider-562e3',
    authDomain: 'todo-list-provider-562e3.firebaseapp.com',
    storageBucket: 'todo-list-provider-562e3.appspot.com',
    measurementId: 'G-SR7RZEJ81Y',
  );
}
