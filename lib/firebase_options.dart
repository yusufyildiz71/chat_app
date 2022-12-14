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
    apiKey: 'AIzaSyC1qJ4XH7-WT8jqJBo1do5DASWpbg1i7fc',
    appId: '1:1019511153529:web:1db675c7d2f31e467785a8',
    messagingSenderId: '1019511153529',
    projectId: 'chatapp-d5b17',
    authDomain: 'chatapp-d5b17.firebaseapp.com',
    storageBucket: 'chatapp-d5b17.appspot.com',
    measurementId: 'G-XFRFV1WYQZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZr0t-hORkkoX5rUYL5fT1S6Gab2l3WxQ',
    appId: '1:1019511153529:android:7440537591b3049d7785a8',
    messagingSenderId: '1019511153529',
    projectId: 'chatapp-d5b17',
    storageBucket: 'chatapp-d5b17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWHARPz2AeebvHUUNyxt1kYTWJf6Iwcsk',
    appId: '1:1019511153529:ios:d3db290f255a79b87785a8',
    messagingSenderId: '1019511153529',
    projectId: 'chatapp-d5b17',
    storageBucket: 'chatapp-d5b17.appspot.com',
    iosClientId: '1019511153529-c8gi6mdg1u8k1gun1lh9vo0g047imbm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWHARPz2AeebvHUUNyxt1kYTWJf6Iwcsk',
    appId: '1:1019511153529:ios:d3db290f255a79b87785a8',
    messagingSenderId: '1019511153529',
    projectId: 'chatapp-d5b17',
    storageBucket: 'chatapp-d5b17.appspot.com',
    iosClientId: '1019511153529-c8gi6mdg1u8k1gun1lh9vo0g047imbm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
