import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
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

class POSTCarbsWidget extends StatefulWidget {
  const POSTCarbsWidget({
    Key? key,
    this.insulinType,
    this.latestMmol,
  }) : super(key: key);

  final String? insulinType;
  final double? latestMmol;

  @override
  _POSTCarbsWidgetState createState() => _POSTCarbsWidgetState();
}

class _POSTCarbsWidgetState extends State<POSTCarbsWidget> {
  ApiCallResponse? apiResultPostCarbs;
  FoodDataRecord? addFoodToDatabase;
  TextEditingController? foodNameController;
  TextEditingController? gramsCarbsController1;
  bool? addCustomFoodToggleValue;
  List<FoodDataRecord> simpleSearchResults1 = [];
  final searchKey = GlobalKey();
  TextEditingController? searchController;
  String? searchSelectedOption;
  PageController? pageViewController;
  List<FoodDataRecord> simpleSearchResults2 = [];
  TextEditingController? gramsCarbsController2;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    foodNameController = TextEditingController();
    gramsCarbsController1 = TextEditingController();
    searchController = TextEditingController();
    gramsCarbsController2 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    foodNameController?.dispose();
    gramsCarbsController1?.dispose();
    gramsCarbsController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (widget.latestMmol! < 3.9) {
                return FlutterFlowTheme.of(context).tertiaryColor;
              } else if (widget.latestMmol! > 9.4) {
                return FlutterFlowTheme.of(context).secondaryColor;
              } else {
                return FlutterFlowTheme.of(context).primaryColor;
              }
            }(),
            FlutterFlowTheme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                      child: PageView(
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Select an option below',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Search Food Database',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child:
                                            StreamBuilder<List<FoodDataRecord>>(
                                          stream: queryFoodDataRecord(
                                            queryBuilder: (foodDataRecord) =>
                                                foodDataRecord.where('FoodName',
                                                    isEqualTo:
                                                        searchSelectedOption),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 25,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<FoodDataRecord>
                                                searchFoodDataRecordList =
                                                snapshot.data!;
                                            return Autocomplete<String>(
                                              initialValue: TextEditingValue(),
                                              optionsBuilder:
                                                  (textEditingValue) {
                                                if (textEditingValue.text ==
                                                    '') {
                                                  return const Iterable<
                                                      String>.empty();
                                                }
                                                return searchFoodDataRecordList
                                                    .map((e) => e.foodNameFull)
                                                    .withoutNulls
                                                    .toList()
                                                    .toList()
                                                    .where((option) {
                                                  final lowercaseOption =
                                                      option.toLowerCase();
                                                  return lowercaseOption
                                                      .contains(textEditingValue
                                                          .text
                                                          .toLowerCase());
                                                });
                                              },
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return AutocompleteOptionsList(
                                                  textFieldKey: searchKey,
                                                  textController:
                                                      searchController!,
                                                  options: options.toList(),
                                                  onSelected: onSelected,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                  textHighlightStyle:
                                                      TextStyle(),
                                                  textAlign: TextAlign.start,
                                                  elevation: 4,
                                                  optionBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  optionHighlightColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  maxHeight: 200,
                                                );
                                              },
                                              onSelected: (String selection) {
                                                setState(() =>
                                                    searchSelectedOption =
                                                        selection);
                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              fieldViewBuilder: (
                                                context,
                                                textEditingController,
                                                focusNode,
                                                onEditingComplete,
                                              ) {
                                                searchController =
                                                    textEditingController;
                                                return TextFormField(
                                                  key: searchKey,
                                                  controller:
                                                      textEditingController,
                                                  focusNode: focusNode,
                                                  onEditingComplete:
                                                      onEditingComplete,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    'searchController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'search',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0x7EFFFFFF),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x7EFFFFFF),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x7EFFFFFF),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 32, 20, 12),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp('[a-zA-Z]'))
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 200,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      icon: Icon(
                                        Icons.search_rounded,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (widget.latestMmol! < 3.9) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .tertiaryColor;
                                            } else if (widget.latestMmol! >
                                                9.4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryColor;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryColor;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                        size: 25,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'P_O_S_T_CARBS_COMP_AddNewButton_ON_TAP');
                                        logFirebaseEvent(
                                            'AddNewButton_simple_search');
                                        await queryFoodDataRecordOnce()
                                            .then(
                                              (records) =>
                                                  simpleSearchResults1 =
                                                      TextSearch(
                                                records
                                                    .map(
                                                      (record) =>
                                                          TextSearchItem(
                                                              record, [
                                                        record.foodNameFull!
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                          .search(
                                                              searchController!
                                                                  .text)
                                                          .map((r) => r.object)
                                                          .toList(),
                                            )
                                            .onError((_, __) =>
                                                simpleSearchResults1 = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        logFirebaseEvent(
                                            'AddNewButton_page_view');
                                        await pageViewController?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 3,
                                thickness: 3,
                                indent: 16,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Manually Enter Carbs',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 16, 16),
                                              child: TextFormField(
                                                controller:
                                                    gramsCarbsController1,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'gramsCarbsController1',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    logFirebaseEvent(
                                                        'P_O_S_T_CARBS_gramsCarbs_ON_TEXTFIELD_CH');
                                                    logFirebaseEvent(
                                                        'gramsCarbs_update_local_state');
                                                    FFAppState().carbsEntered =
                                                        functions.stringToDouble(
                                                            gramsCarbsController2!
                                                                .text)!;
                                                  },
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'grams',
                                                  hintStyle: TextStyle(
                                                    color: Color(0x7EFFFFFF),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 16,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x7EFFFFFF),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x7EFFFFFF),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 32, 20, 12),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                textAlign: TextAlign.start,
                                                maxLines: null,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (val) {
                                                  if (val == null ||
                                                      val.isEmpty) {
                                                    return 'Field is required';
                                                  }

                                                  if (!RegExp(
                                                          '^\\d+(\\.\\d{1,2})?\$')
                                                      .hasMatch(val)) {
                                                    return 'Please enter a valid number';
                                                  }
                                                  return null;
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 16, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 6, 0),
                                                    child: Switch.adaptive(
                                                      value:
                                                          addCustomFoodToggleValue ??=
                                                              false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() =>
                                                            addCustomFoodToggleValue =
                                                                newValue!);
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray600,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Add To Database',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (addCustomFoodToggleValue ??
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 16, 16, 16),
                                                child: TextFormField(
                                                  controller:
                                                      foodNameController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'food name',
                                                    hintStyle: TextStyle(
                                                      color: Color(0x7EFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 16,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x7EFFFFFF),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x7EFFFFFF),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 32, 20, 12),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 100,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .gray600,
                                        icon: Icon(
                                          Icons.arrow_forward_rounded,
                                          color: valueOrDefault<Color>(
                                            () {
                                              if (widget.latestMmol! < 3.9) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .tertiaryColor;
                                              } else if (widget.latestMmol! >
                                                  9.4) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryColor;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryColor;
                                              }
                                            }(),
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          size: 25,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: /* NOT RECOMMENDED */ gramsCarbsController2!
                                                    .text ==
                                                'true'
                                            ? null
                                            : () async {
                                                logFirebaseEvent(
                                                    'P_O_S_T_CARBS_arrow_forward_rounded_ICN_');
                                                // Do the API call to just add carbs
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');
                                                apiResultPostCarbs =
                                                    await PostCarbsCall.call(
                                                  enteredBy: 'MyCGM',
                                                  eventType: 'Carb Correction',
                                                  carbs:
                                                      FFAppState().carbsEntered,
                                                  nightscout: valueOrDefault(
                                                      currentUserDocument
                                                          ?.nightscout,
                                                      ''),
                                                  token: valueOrDefault(
                                                      currentUserDocument
                                                          ?.token,
                                                      ''),
                                                  apiKey: valueOrDefault(
                                                      currentUserDocument
                                                          ?.apiKey,
                                                      ''),
                                                  notes: foodNameController!
                                                                  .text !=
                                                              null &&
                                                          foodNameController!
                                                                  .text !=
                                                              ''
                                                      ? foodNameController!.text
                                                      : '',
                                                );
                                                if ((apiResultPostCarbs
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'IconButton_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Carbs sent to Nightscout successfully',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                  if (addCustomFoodToggleValue !=
                                                      null) {
                                                    logFirebaseEvent(
                                                        'IconButton_backend_call');

                                                    final foodDataCreateData =
                                                        createFoodDataRecordData(
                                                      foodNameFull:
                                                          foodNameController!
                                                              .text,
                                                      totalsugarsg: double.tryParse(
                                                          gramsCarbsController2!
                                                              .text),
                                                      source: currentUserUid,
                                                    );
                                                    var foodDataRecordReference =
                                                        FoodDataRecord
                                                            .collection
                                                            .doc();
                                                    await foodDataRecordReference
                                                        .set(
                                                            foodDataCreateData);
                                                    addFoodToDatabase = FoodDataRecord
                                                        .getDocumentFromData(
                                                            foodDataCreateData,
                                                            foodDataRecordReference);
                                                    logFirebaseEvent(
                                                        'IconButton_page_view');
                                                    await pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'IconButton_page_view');
                                                    await pageViewController
                                                        ?.animateToPage(
                                                      2,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'IconButton_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'That didn\'t work',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                }

                                                setState(() {});
                                              },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Text(
                                  'Confirm Carb Intake',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Builder(
                                  builder: (context) {
                                    final searchResultsConfirmPage =
                                        simpleSearchResults1
                                            .map((e) => e)
                                            .toList()
                                            .where((e) =>
                                                e.reference != e.reference)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          searchResultsConfirmPage.length,
                                      itemBuilder: (context,
                                          searchResultsConfirmPageIndex) {
                                        final searchResultsConfirmPageItem =
                                            searchResultsConfirmPage[
                                                searchResultsConfirmPageIndex];
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'P_O_S_T_CARBS_ListTile_w5hw4szw_ON_TAP');
                                            logFirebaseEvent(
                                                'ListTile_update_local_state');
                                            FFAppState().update(() {
                                              FFAppState().addToCarbSummary(
                                                  searchResultsConfirmPageItem
                                                      .reference);
                                            });
                                          },
                                          child: ListTile(
                                            title: Text(
                                              searchResultsConfirmPageItem
                                                  .foodName!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              '${searchResultsConfirmPageItem.foodDetail1}${searchResultsConfirmPageItem.foodDetail2}${searchResultsConfirmPageItem.foodDetail3}${searchResultsConfirmPageItem.foodDetail4}${searchResultsConfirmPageItem.foodDetail5}${searchResultsConfirmPageItem.foodDetail6}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xBEFFFFFF),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.add_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 45,
                                            ),
                                            tileColor: Color(0xFFF5F5F5),
                                            dense: false,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Divider(
                                height: 3,
                                thickness: 3,
                                indent: 16,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 16),
                                child: Text(
                                  'Summary',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 0, 16),
                                child: Builder(
                                  builder: (context) {
                                    final carbItemsList = FFAppState()
                                        .carbSummary
                                        .map((e) => e)
                                        .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(carbItemsList.length,
                                              (carbItemsListIndex) {
                                        final carbItemsListItem =
                                            carbItemsList[carbItemsListIndex];
                                        return StreamBuilder<FoodDataRecord>(
                                          stream: FoodDataRecord.getDocument(
                                              carbItemsListItem),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 25,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowFoodDataRecord =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFAppState()
                                                      .carbSummary
                                                      .contains(
                                                          carbItemsListItem)
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                ),
                                                Text(
                                                  '${formatNumber(
                                                    rowFoodDataRecord
                                                        .totalsugarsg,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  )} grams',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                              Divider(
                                height: 3,
                                thickness: 3,
                                indent: 16,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Record X grams',
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 200,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      icon: Icon(
                                        Icons.send_rounded,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (widget.latestMmol! < 3.9) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .tertiaryColor;
                                            } else if (widget.latestMmol! >
                                                9.4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryColor;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryColor;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                        size: 25,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'P_O_S_T_CARBS_COMP_AddNewButton_ON_TAP');
                                        logFirebaseEvent(
                                            'AddNewButton_simple_search');
                                        await queryFoodDataRecordOnce()
                                            .then(
                                              (records) =>
                                                  simpleSearchResults2 =
                                                      TextSearch(
                                                records
                                                    .map(
                                                      (record) =>
                                                          TextSearchItem(
                                                              record, [
                                                        record.foodNameFull!
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                          .search(
                                                              searchController!
                                                                  .text)
                                                          .map((r) => r.object)
                                                          .toList(),
                                            )
                                            .onError((_, __) =>
                                                simpleSearchResults2 = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        logFirebaseEvent(
                                            'AddNewButton_page_view');
                                        await pageViewController?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Offset with ?X gms of carbs with x units of ${widget.insulinType}',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: TextFormField(
                                          controller: gramsCarbsController2,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'units',
                                            hintStyle: TextStyle(
                                              color: Color(0x7EFFFFFF),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x7EFFFFFF),
                                                width: 3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x7EFFFFFF),
                                                width: 3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 32, 20, 12),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          textAlign: TextAlign.start,
                                          keyboardType: const TextInputType
                                                  .numberWithOptions(
                                              signed: true, decimal: true),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 100,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      icon: Icon(
                                        Icons.send_rounded,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (widget.latestMmol! < 3.9) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .tertiaryColor;
                                            } else if (widget.latestMmol! >
                                                9.4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryColor;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryColor;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                        size: 25,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 3,
                                thickness: 3,
                                indent: 16,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Do not record insulin ',
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 100,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      icon: Icon(
                                        Icons.close,
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (widget.latestMmol! < 3.9) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .tertiaryColor;
                                            } else if (widget.latestMmol! >
                                                9.4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryColor;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryColor;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                        size: 30,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'P_O_S_T_CARBS_COMP_Button_ON_TAP');
                                        logFirebaseEvent('Button_bottom_sheet');
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: pageViewController ??=
                              PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.vertical,
                          onDotClicked: (i) {
                            pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 5,
                            spacing: 8,
                            radius: 16,
                            dotWidth: 32,
                            dotHeight: 16,
                            dotColor: Color(0x41FFFFFF),
                            activeDotColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
