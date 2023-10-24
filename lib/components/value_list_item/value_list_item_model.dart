import '/backend/backend.dart';
import '/components/nutri_circles_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'value_list_item_widget.dart' show ValueListItemWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ValueListItemModel extends FlutterFlowModel<ValueListItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NutriCircles component.
  late NutriCirclesModel nutriCirclesModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nutriCirclesModel = createModel(context, () => NutriCirclesModel());
  }

  void dispose() {
    nutriCirclesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
