import '/backend/backend.dart';
import '/components/item_database/item_database_widget.dart';
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
  // Model for ItemDatabase component.
  late ItemDatabaseModel itemDatabaseModel;
  // Model for NutriCircles component.
  late NutriCirclesModel nutriCirclesModel;
  // Model for NutritionPanelGoogleVision component.
  late NutritionPanelGoogleVisionModel nutritionPanelGoogleVisionModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemDatabaseModel = createModel(context, () => ItemDatabaseModel());
    nutriCirclesModel = createModel(context, () => NutriCirclesModel());
    nutritionPanelGoogleVisionModel =
        createModel(context, () => NutritionPanelGoogleVisionModel());
  }

  void dispose() {
    unfocusNode.dispose();
    itemDatabaseModel.dispose();
    nutriCirclesModel.dispose();
    nutritionPanelGoogleVisionModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
