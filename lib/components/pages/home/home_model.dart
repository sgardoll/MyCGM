import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/item/item_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'home_widget.dart' show HomeWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool searchOn = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for Item dynamic component.
  late FlutterFlowDynamicModels<ItemModel> itemModels1;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, FoodDatabaseRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // Models for Item dynamic component.
  late FlutterFlowDynamicModels<ItemModel> itemModels2;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<FoodDatabaseRecord>? algoliaSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemModels1 = FlutterFlowDynamicModels(() => ItemModel());
    itemModels2 = FlutterFlowDynamicModels(() => ItemModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    itemModels1.dispose();
    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    itemModels2.dispose();
    navBar1Model.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, FoodDatabaseRecord>
      setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, FoodDatabaseRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, FoodDatabaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryFoodDatabaseRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
