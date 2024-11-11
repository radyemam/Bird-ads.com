import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return android;
        case TargetPlatform.iOS:
          return ios; // يمكن تركها كما هي
        case TargetPlatform.macOS:
          return macos; // يمكن تركها كما هي
        case TargetPlatform.windows:
          return windows; // يمكن تركها كما هي
        case TargetPlatform.linux:
          return linux; // يمكن تركها كما هي
        default:
          throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.',
          );
      }
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyACWEwXvznddfmxSfgPiwUGU1X8XUPCEmk",
      authDomain: "birdy-d8157.firebaseapp.com",
      projectId: "birdy-d8157",
      storageBucket: "birdy-d8157.appspot.com",
      messagingSenderId: "843123500831",
      appId: "1:843123500831:web:70d372c601d7059cdf322a",
      measurementId: "G-82GCLGJS0N"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBFctekJxRXm7n8dmfwI2jcaBBCANXK0HU",
    authDomain: "birdy-d8157.firebaseapp.com",
    projectId: "birdy-d8157",
    storageBucket: "birdy-d8157.appspot.com",
    messagingSenderId: "843123500831",
    appId: "1:843123500831:android:7e4ebd27ea3301e9df322a",
  );

  // يمكن ترك القيم التالية كما هي إذا كنت لا تخطط لاستخدام هذه المنصات
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "YOUR_IOS_API_KEY",
    authDomain: "YOUR_IOS_AUTH_DOMAIN",
    projectId: "YOUR_IOS_PROJECT_ID",
    storageBucket: "YOUR_IOS_STORAGE_BUCKET",
    messagingSenderId: "YOUR_IOS_MESSAGING_SENDER_ID",
    appId: "YOUR_IOS_APP_ID",
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "YOUR_MACOS_API_KEY",
    authDomain: "YOUR_MACOS_AUTH_DOMAIN",
    projectId: "YOUR_MACOS_PROJECT_ID",
    storageBucket: "YOUR_MACOS_STORAGE_BUCKET",
    messagingSenderId: "YOUR_MACOS_MESSAGING_SENDER_ID",
    appId: "YOUR_MACOS_APP_ID",
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: "YOUR_WINDOWS_API_KEY",
    authDomain: "YOUR_WINDOWS_AUTH_DOMAIN",
    projectId: "YOUR_WINDOWS_PROJECT_ID",
    storageBucket: "YOUR_WINDOWS_STORAGE_BUCKET",
    messagingSenderId: "YOUR_WINDOWS_MESSAGING_SENDER_ID",
    appId: "YOUR_WINDOWS_APP_ID",
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: "YOUR_LINUX_API_KEY",
    authDomain: "YOUR_LINUX_AUTH_DOMAIN",
    projectId: "YOUR_LINUX_PROJECT_ID",
    storageBucket: "YOUR_LINUX_STORAGE_BUCKET",
    messagingSenderId: "YOUR_LINUX_MESSAGING_SENDER_ID",
    appId: "YOUR_LINUX_APP_ID",
  );
}
