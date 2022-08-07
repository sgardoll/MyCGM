// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future setTheme(int sgv) async {
  Color themeColor = Colors.green;
  Color backgroundColor = Colors.green;
  if (sgv < 70) {
    themeColor = Colors.red;
    backgroundColor = Colors.red;
  }
  ;
  if (sgv >= 70 && sgv < 169) {
    themeColor = Colors.green;
    backgroundColor = Colors.green;
  }
  ;
  if (sgv >= 169) {
    themeColor = Colors.orange;
    backgroundColor = Colors.orange;
  }
  ;
}
