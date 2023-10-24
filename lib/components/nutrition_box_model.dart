import '/components/nutri_circles_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nutrition_box_widget.dart' show NutritionBoxWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NutritionBoxModel extends FlutterFlowModel<NutritionBoxWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // Model for NutriCircles component.
  late NutriCirclesModel nutriCirclesModel1;
  // Model for NutriCircles component.
  late NutriCirclesModel nutriCirclesModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nutriCirclesModel1 = createModel(context, () => NutriCirclesModel());
    nutriCirclesModel2 = createModel(context, () => NutriCirclesModel());
  }

  void dispose() {
    expandableController.dispose();
    nutriCirclesModel1.dispose();
    nutriCirclesModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
