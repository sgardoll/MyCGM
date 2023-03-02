import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Nightscout widget.
  TextEditingController? nightscoutController;
  String? Function(BuildContext, String?)? nightscoutControllerValidator;
  // State field(s) for API widget.
  TextEditingController? apiController;
  String? Function(BuildContext, String?)? apiControllerValidator;
  // State field(s) for Token widget.
  TextEditingController? tokenController;
  String? Function(BuildContext, String?)? tokenControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for highValue widget.
  TextEditingController? highValueController;
  String? Function(BuildContext, String?)? highValueControllerValidator;
  // State field(s) for lowValue widget.
  TextEditingController? lowValueController;
  String? Function(BuildContext, String?)? lowValueControllerValidator;
  // State field(s) for carbRatio widget.
  TextEditingController? carbRatioController;
  String? Function(BuildContext, String?)? carbRatioControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nightscoutController?.dispose();
    apiController?.dispose();
    tokenController?.dispose();
    highValueController?.dispose();
    lowValueController?.dispose();
    carbRatioController?.dispose();
  }

  /// Additional helper methods are added here.

}
