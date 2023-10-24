import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'p_o_s_t_insulin_widget.dart' show POSTInsulinWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class POSTInsulinModel extends FlutterFlowModel<POSTInsulinWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for units widget.
  FocusNode? unitsFocusNode;
  TextEditingController? unitsController;
  String? Function(BuildContext, String?)? unitsControllerValidator;
  // Stores action output result for [Backend Call - API (PostInsulin)] action in IconButton widget.
  ApiCallResponse? postInsulin;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unitsFocusNode?.dispose();
    unitsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
