import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'final_check_widget.dart' show FinalCheckWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinalCheckModel extends FlutterFlowModel<FinalCheckWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for highValue widget.
  FocusNode? highValueFocusNode;
  TextEditingController? highValueController;
  String? Function(BuildContext, String?)? highValueControllerValidator;
  // State field(s) for lowValue widget.
  FocusNode? lowValueFocusNode;
  TextEditingController? lowValueController;
  String? Function(BuildContext, String?)? lowValueControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    highValueFocusNode?.dispose();
    highValueController?.dispose();

    lowValueFocusNode?.dispose();
    lowValueController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
