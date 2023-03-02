// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Future<void> updateCheckIos(BuildContext context) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final String currentVersion = packageInfo.version;
  final String appId = '1663650386';
  final url =
      'https://itunes.apple.com/lookup?bundleId=$appId'; // iTunes API URL
  final response = await http.get(url as Uri);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var appStoreVersion = data['results'][0]['version'];
    if (appStoreVersion != null &&
        appStoreVersion.compareTo(currentVersion) > 0) {
      // Show alert dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Available'),
            content: Text(
                'A new version of the app is available. Please update to the latest version.'),
            actions: <Widget>[
              TextButton(
                child: Text('Update'),
                onPressed: () {
                  launch(
                      'https://apps.apple.com/us/app/your-app-name/id$appId?ls=1');
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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
