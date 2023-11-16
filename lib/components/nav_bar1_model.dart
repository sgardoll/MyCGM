import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'nav_bar1_widget.dart' show NavBar1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBar1Model extends FlutterFlowModel<NavBar1Widget> {
  ///  Local state fields for this component.

  bool? loadingItem = false;

  String loadingText = 'Opening Camera';

  ///  State fields for stateful widgets in this component.

  var barcodeScan = '';
  // Stores action output result for [Backend Call - API (OpenFoodFacts)] action in BarcodeFAB widget.
  ApiCallResponse? getOpenFoodFactsName;
  // Stores action output result for [Firestore Query - Query a collection] action in BarcodeFAB widget.
  LookupRecord? doesCodeExist;
  // Stores action output result for [Backend Call - API (Barcode Scan)] action in BarcodeFAB widget.
  ApiCallResponse? buildshipAPI;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
