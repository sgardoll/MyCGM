import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class POSTCarbsModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<DocumentReference> carbItemsSummary = [];
  void addToCarbItemsSummary(DocumentReference item) =>
      carbItemsSummary.add(item);
  void removeFromCarbItemsSummary(DocumentReference item) =>
      carbItemsSummary.remove(item);
  void removeAtIndexFromCarbItemsSummary(int index) =>
      carbItemsSummary.removeAt(index);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for searchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  List<FoodDataRecord> simpleSearchResults1 = [];
  // State field(s) for gramsCarbs widget.
  TextEditingController? gramsCarbsController1;
  String? Function(BuildContext, String?)? gramsCarbsController1Validator;
  String? _gramsCarbsController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^\\d+(\\.\\d{1,2})?\$').hasMatch(val)) {
      return 'Please enter a valid number';
    }
    return null;
  }

  // State field(s) for AddCustomFoodToggle widget.
  bool? addCustomFoodToggleValue;
  // State field(s) for foodName widget.
  TextEditingController? foodNameController;
  String? Function(BuildContext, String?)? foodNameControllerValidator;
  // Stores action output result for [Backend Call - API (PostCarbs)] action in IconButton widget.
  ApiCallResponse? apiResultPostCarbs;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FoodDataRecord? addFoodToDatabase;
  List<FoodDataRecord> simpleSearchResults2 = [];
  // State field(s) for gramsCarbs widget.
  TextEditingController? gramsCarbsController2;
  String? Function(BuildContext, String?)? gramsCarbsController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    gramsCarbsController1Validator = _gramsCarbsController1Validator;
  }

  void dispose() {
    searchFieldController?.dispose();
    gramsCarbsController1?.dispose();
    foodNameController?.dispose();
    gramsCarbsController2?.dispose();
  }

  /// Additional helper methods are added here.

}
