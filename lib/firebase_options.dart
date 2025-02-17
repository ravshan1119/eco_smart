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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ9q68SVP9fodpTGwGvf5gVFxYPvnOLYU',
    appId: '1:163377557150:android:56da4f97a6cb022efbd58f',
    messagingSenderId: '163377557150',
    projectId: 'camping-9b195',
    storageBucket: 'camping-9b195.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUHGlLX0Ns-LIpoDKulnbnWGdfIYUJUXg',
    appId: '1:163377557150:ios:f9faaa78990104dffbd58f',
    messagingSenderId: '163377557150',
    projectId: 'camping-9b195',
    storageBucket: 'camping-9b195.appspot.com',
    androidClientId: '163377557150-q3ov8mkvv67frfcqdapngcnsuadnbuj0.apps.googleusercontent.com',
    iosClientId: '163377557150-kji8t2djarit989gortc1u1clchkscpq.apps.googleusercontent.com',
    iosBundleId: 'com.ecosmart.app',
  );

}