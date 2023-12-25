import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future toggleFab(BuildContext context) async {}

Future scanBarcodeShowSheet(BuildContext context) async {}

Future<bool?> checkNightscoutDetailsArePresent(BuildContext context) async {
  if (valueOrDefault(currentUserDocument?.nightscout, '') == null ||
      valueOrDefault(currentUserDocument?.nightscout, '') == '') {
    context.pushNamed('nightscoutCheck');
  }
  if (valueOrDefault(currentUserDocument?.units, '') == null ||
      valueOrDefault(currentUserDocument?.units, '') == '') {
    context.pushNamed('unitsCheck');
  }
  if (valueOrDefault(currentUserDocument?.carbRatio, 0.0) == null) {
    context.pushNamed('carbRatioCheck');
  }
  if ((valueOrDefault(currentUserDocument?.highValue, 0.0) == null) ||
      (valueOrDefault(currentUserDocument?.highValue, 0.0) <= 0.0)) {
    context.pushNamed('finalCheck');
  } else {
    return true;
  }

  return null;
}
