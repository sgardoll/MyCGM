import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'carb_ratio_check_widget.dart' show CarbRatioCheckWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarbRatioCheckModel extends FlutterFlowModel<CarbRatioCheckWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for carbRatio widget.
  FocusNode? carbRatioFocusNode;
  TextEditingController? carbRatioController;
  String? Function(BuildContext, String?)? carbRatioControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    carbRatioFocusNode?.dispose();
    carbRatioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
