import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCgIQnE-XCczHn6CE0gOiNoxZV43SOtQrw",
            authDomain: "mycgm-connectio.firebaseapp.com",
            projectId: "mycgm-connectio",
            storageBucket: "mycgm-connectio.appspot.com",
            messagingSenderId: "889541076330",
            appId: "1:889541076330:web:745fa908b8c07ffc31f113",
            measurementId: "G-Y94NQ8YZLH"));
  } else {
    await Firebase.initializeApp();
  }
}
