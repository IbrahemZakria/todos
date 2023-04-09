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
    apiKey: 'AIzaSyBJVWjbOfdyx2Ozg6zMIDyjHqPgpAQIu5Y',
    appId: '1:988159314340:web:86a0703bdb3b1b3ac1d931',
    messagingSenderId: '988159314340',
    projectId: 'todo-932fc',
    authDomain: 'todo-932fc.firebaseapp.com',
    storageBucket: 'todo-932fc.appspot.com',
    measurementId: 'G-7TMXGR1BJZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUt9KEQYgurhiZDy_zWmq-fPuaFV0uByA',
    appId: '1:988159314340:android:8bf8d8211310615ec1d931',
    messagingSenderId: '988159314340',
    projectId: 'todo-932fc',
    storageBucket: 'todo-932fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAllZJG_r9t9_ZJ9NG99yINzcOslwrPdLE',
    appId: '1:988159314340:ios:d869c60d735d23fec1d931',
    messagingSenderId: '988159314340',
    projectId: 'todo-932fc',
    storageBucket: 'todo-932fc.appspot.com',
    iosClientId: '988159314340-t4ljngunvg7vq0jc6oo97j9f150s8rft.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAllZJG_r9t9_ZJ9NG99yINzcOslwrPdLE',
    appId: '1:988159314340:ios:d869c60d735d23fec1d931',
    messagingSenderId: '988159314340',
    projectId: 'todo-932fc',
    storageBucket: 'todo-932fc.appspot.com',
    iosClientId: '988159314340-t4ljngunvg7vq0jc6oo97j9f150s8rft.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}