import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'settings_widget.dart' show SettingsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  bool nightscoutUpdated = false;

  bool unitsUpdated = false;

  bool diabUpdated = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Nightscout widget.
  FocusNode? nightscoutFocusNode;
  TextEditingController? nightscoutController;
  String? Function(BuildContext, String?)? nightscoutControllerValidator;
  // State field(s) for API widget.
  FocusNode? apiFocusNode;
  TextEditingController? apiController;
  String? Function(BuildContext, String?)? apiControllerValidator;
  // State field(s) for Token widget.
  FocusNode? tokenFocusNode;
  TextEditingController? tokenController;
  String? Function(BuildContext, String?)? tokenControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for highValue widget.
  FocusNode? highValueFocusNode;
  TextEditingController? highValueController;
  String? Function(BuildContext, String?)? highValueControllerValidator;
  // State field(s) for lowValue widget.
  FocusNode? lowValueFocusNode;
  TextEditingController? lowValueController;
  String? Function(BuildContext, String?)? lowValueControllerValidator;
  // State field(s) for carbRatio widget.
  FocusNode? carbRatioFocusNode;
  TextEditingController? carbRatioController;
  String? Function(BuildContext, String?)? carbRatioControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    nightscoutFocusNode?.dispose();
    nightscoutController?.dispose();

    apiFocusNode?.dispose();
    apiController?.dispose();

    tokenFocusNode?.dispose();
    tokenController?.dispose();

    expandableController2.dispose();
    expandableController3.dispose();
    highValueFocusNode?.dispose();
    highValueController?.dispose();

    lowValueFocusNode?.dispose();
    lowValueController?.dispose();

    carbRatioFocusNode?.dispose();
    carbRatioController?.dispose();

    expandableController4.dispose();
    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
