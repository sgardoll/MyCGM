import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/nutrition_panel_google_vision_widget.dart';
import '/components/scaned_item/scaned_item_widget.dart';
import '/components/scaned_item_details/scaned_item_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'scaned_item_details_widget.dart' show ScanedItemDetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanedItemDetailsModel extends FlutterFlowModel<ScanedItemDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - API (BuildshipGoogleVision)] action in ScanedItemDetails widget.
  ApiCallResponse? buildshipAPIGoogleVision;
  // Model for NutritionPanelGoogleVision component.
  late NutritionPanelGoogleVisionModel nutritionPanelGoogleVisionModel;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - cropImage] action in Button widget.
  FFUploadedFile? croppedImage;
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
