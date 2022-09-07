// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter/services.dart';

Future lockOrientation() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

/*
await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
*/

/*
await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
*/
}
