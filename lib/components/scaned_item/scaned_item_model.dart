import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_to_details_page_widget.dart';
import '/components/scaned_item/scaned_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'scaned_item_widget.dart' show ScanedItemWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanedItemModel extends FlutterFlowModel<ScanedItemWidget> {
  ///  Local state fields for this component.

  DocumentReference? docRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in ScanedItem widget.
  LookupRecord? barcodeInputDocCreate;
  // Model for navToDetailsPage component.
  late NavToDetailsPageModel navToDetailsPageModel;
  var barcodeScanAgain = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navToDetailsPageModel = createModel(context, () => NavToDetailsPageModel());
  }

  void dispose() {
    navToDetailsPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
