import '/backend/backend.dart';
import '/components/create_blurhash_widget.dart';
import '/components/create_image_on_empty_copy_widget.dart';
import '/components/create_markdown_on_empty_widget.dart';
import '/components/nutri_circles_widget.dart';
import '/components/nutrition_panel_google_vision_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'details_database_item_widget.dart' show DetailsDatabaseItemWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsDatabaseItemModel
    extends FlutterFlowModel<DetailsDatabaseItemWidget> {
  ///  Local state fields for this page.

  DocumentReference? docRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NutriCircles component.
  late NutriCirclesModel nutriCirclesModel;
  // Model for NutritionPanelGoogleVision component.
  late NutritionPanelGoogleVisionModel nutritionPanelGoogleVisionModel;
  // Model for createMarkdownOnEmpty.
  late CreateMarkdownOnEmptyModel createMarkdownOnEmptyModel;
  // Model for createBlurhash component.
  late CreateBlurhashModel createBlurhashModel;
  // Model for createImageOnEmptyCopy component.
  late CreateImageOnEmptyCopyModel createImageOnEmptyCopyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nutriCirclesModel = createModel(context, () => NutriCirclesModel());
    nutritionPanelGoogleVisionModel =
        createModel(context, () => NutritionPanelGoogleVisionModel());
    createMarkdownOnEmptyModel =
        createModel(context, () => CreateMarkdownOnEmptyModel());
    createBlurhashModel = createModel(context, () => CreateBlurhashModel());
    createImageOnEmptyCopyModel =
        createModel(context, () => CreateImageOnEmptyCopyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nutriCirclesModel.dispose();
    nutritionPanelGoogleVisionModel.dispose();
    createMarkdownOnEmptyModel.dispose();
    createBlurhashModel.dispose();
    createImageOnEmptyCopyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
