import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_widget.dart';
import '/components/nutrition_box_widget.dart';
import '/components/nutrition_panel_google_vision_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'details_widget.dart' show DetailsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsModel extends FlutterFlowModel<DetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NutritionBox component.
  late NutritionBoxModel nutritionBoxModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (BuildshipGoogleVision)] action in Button widget.
  ApiCallResponse? buildshipAPIGoogleVision;
  // Model for NutritionPanelGoogleVision component.
  late NutritionPanelGoogleVisionModel nutritionPanelGoogleVisionModel;
  // Model for loading component.
  late LoadingModel loadingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nutritionBoxModel = createModel(context, () => NutritionBoxModel());
    nutritionPanelGoogleVisionModel =
        createModel(context, () => NutritionPanelGoogleVisionModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nutritionBoxModel.dispose();
    nutritionPanelGoogleVisionModel.dispose();
    loadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
