import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'nightscout_check_widget.dart' show NightscoutCheckWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NightscoutCheckModel extends FlutterFlowModel<NightscoutCheckWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Nightscout widget.
  FocusNode? nightscoutFocusNode;
  TextEditingController? nightscoutController;
  String? Function(BuildContext, String?)? nightscoutControllerValidator;
  String? _nightscoutControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^.+.com\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for API widget.
  FocusNode? apiFocusNode;
  TextEditingController? apiController;
  String? Function(BuildContext, String?)? apiControllerValidator;
  String? _apiControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Token widget.
  FocusNode? tokenFocusNode;
  TextEditingController? tokenController;
  String? Function(BuildContext, String?)? tokenControllerValidator;
  String? _tokenControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nightscoutControllerValidator = _nightscoutControllerValidator;
    apiControllerValidator = _apiControllerValidator;
    tokenControllerValidator = _tokenControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nightscoutFocusNode?.dispose();
    nightscoutController?.dispose();

    apiFocusNode?.dispose();
    apiController?.dispose();

    tokenFocusNode?.dispose();
    tokenController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
