import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBF7QV3KZx77envM0rRdn5mglfAonHIt7I",
            authDomain: "pc-api-6683764265058024430-989.firebaseapp.com",
            projectId: "pc-api-6683764265058024430-989",
            storageBucket: "pc-api-6683764265058024430-989.appspot.com",
            messagingSenderId: "988337456155",
            appId: "1:988337456155:web:a63be4ea1b83a27a59a4be",
            measurementId: "G-LDKGTE0EE7"));
  } else {
    await Firebase.initializeApp();
  }
}
