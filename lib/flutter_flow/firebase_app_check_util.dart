import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6Ldw60QkAAAAAID-x1DyGwF7tVf5OOuvMqAZ9FKv',
      androidProvider: AndroidProvider.playIntegrity,
    );
