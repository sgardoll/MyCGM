// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> updateCheck(BuildContext context) async {
  // alert the user if there is a later version of the app on the app store

  final PackageInfo info = await PackageInfo.fromPlatform();
  final String appName = info.appName;
  final String packageName = info.packageName;
  final String version = info.version;
  final String buildNumber = info.buildNumber;

  final String url =
      'https://play.google.com/store/apps/details?id=$packageName';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var document = parse(response.body);
    var text = document.getElementsByClassName('htlgb');
    var versionText = text[6].text;
    var versionNumber = versionText.replaceAll(new RegExp(r'[^\d.]'), '');
    if (double.parse(versionNumber) > double.parse(version)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Available'),
            content: Text(
                'A new version of $appName is available. Please update to the latest version.'),
            actions: <Widget>[
              TextButton(
                child: Text('Update'),
                onPressed: () {
                  launch(url);
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
