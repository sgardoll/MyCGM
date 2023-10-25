import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/nutrition_panel_google_vision_widget.dart';
import '/components/scaned_item/scaned_item_widget.dart';
import '/components/scaned_item_crop/scaned_item_crop_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'scaned_item_details_widget.dart' show ScanedItemDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanedItemDetailsModel extends FlutterFlowModel<ScanedItemDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NutritionPanelGoogleVision component.
  late NutritionPanelGoogleVisionModel nutritionPanelGoogleVisionModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (BuildshipGoogleVision)] action in Button widget.
  ApiCallResponse? buildshipAPIGoogleVision;
  var barcodeScanAgain = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nutritionPanelGoogleVisionModel =
        createModel(context, () => NutritionPanelGoogleVisionModel());
  }

  void dispose() {
    nutritionPanelGoogleVisionModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
