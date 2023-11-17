import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/item/item_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'home_scanned_widget.dart' show HomeScannedWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScannedModel extends FlutterFlowModel<HomeScannedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Item component.
  late ItemModel itemModel1;
  // Models for Item dynamic component.
  late FlutterFlowDynamicModels<ItemModel> itemModels2;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemModel1 = createModel(context, () => ItemModel());
    itemModels2 = FlutterFlowDynamicModels(() => ItemModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    itemModel1.dispose();
    itemModels2.dispose();
    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
