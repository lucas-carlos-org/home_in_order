import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDh143jx8dy_F739tjrBQ-YaHjLmmpDtD0',
    appId: '1:707879564902:android:70dc64d7a221990f19dfa7',
    messagingSenderId: '707879564902',
    projectId: 'home-in-order-9a786',
    storageBucket: 'home-in-order-9a786.appspot.com',
  );
}
