import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'p_o_s_t_carbs_model.dart';
export 'p_o_s_t_carbs_model.dart';

class POSTCarbsWidget extends StatefulWidget {
  const POSTCarbsWidget({
    Key? key,
    this.latestMmol,
  }) : super(key: key);

  final double? latestMmol;

  @override
  _POSTCarbsWidgetState createState() => _POSTCarbsWidgetState();
}

class _POSTCarbsWidgetState extends State<POSTCarbsWidget> {
  late POSTCarbsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => POSTCarbsModel());

    _model.searchFieldController ??= TextEditingController();
    _model.gramsCarbsController1 ??= TextEditingController();
    _model.foodNameController ??= TextEditingController();
    _model.gramsCarbsController2 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
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
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Container(
                width: 50.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: double.infinity,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                      child: PageView(
                        controller: _model.pageViewController ??=
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
                                    16.0, 16.0, 16.0, 0.0),
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
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.searchFieldController,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'search',
                                            hintStyle: TextStyle(
                                              color: Color(0x7EFFFFFF),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16.0,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x7EFFFFFF),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 32.0, 20.0, 12.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: null,
                                          validator: _model
                                              .searchFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 200.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
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
                                        size: 25.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        await queryFoodDataRecordOnce()
                                            .then(
                                              (records) => _model
                                                      .simpleSearchResults =
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
                                                      .search(_model
                                                          .searchFieldController
                                                          .text)
                                                      .map((r) => r.object)
                                                      .toList(),
                                            )
                                            .onError((_, __) =>
                                                _model.simpleSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 3.0,
                                thickness: 3.0,
                                indent: 16.0,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
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
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 16.0),
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
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 16.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .gramsCarbsController1,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.gramsCarbsController1',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    FFAppState().carbsEntered =
                                                        functions.stringToDouble(
                                                            _model
                                                                .gramsCarbsController2
                                                                .text)!;
                                                  },
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'grams',
                                                  hintStyle: TextStyle(
                                                    color: Color(0x7EFFFFFF),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 16.0,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x7EFFFFFF),
                                                      width: 3.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 3.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 3.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 3.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 32.0,
                                                              20.0, 12.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                textAlign: TextAlign.start,
                                                maxLines: null,
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        signed: true,
                                                        decimal: true),
                                                validator: _model
                                                    .gramsCarbsController1Validator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .addCustomFoodToggleValue ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .addCustomFoodToggleValue =
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
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (_model
                                                    .addCustomFoodToggleValue ??
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 16.0, 16.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.foodNameController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'food name',
                                                    hintStyle: TextStyle(
                                                      color: Color(0x7EFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 16.0,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x7EFFFFFF),
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                32.0,
                                                                20.0,
                                                                12.0),
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
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  validator: _model
                                                      .foodNameControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 100.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
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
                                          size: 25.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: /* NOT RECOMMENDED */ _model
                                                    .gramsCarbsController2
                                                    .text ==
                                                'true'
                                            ? null
                                            : () async {
                                                // Do the API call to just add carbs
                                                _model.apiResultPostCarbs =
                                                    await PostCarbsCall.call(
                                                  enteredBy: 'MyCGM',
                                                  eventType: 'Carb Correction',
                                                  carbs: double.tryParse(_model
                                                      .gramsCarbsController2
                                                      .text),
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
                                                  notes: _model.foodNameController
                                                                  .text !=
                                                              null &&
                                                          _model.foodNameController
                                                                  .text !=
                                                              ''
                                                      ? _model
                                                          .foodNameController
                                                          .text
                                                      : '',
                                                );
                                                if ((_model.apiResultPostCarbs
                                                        ?.succeeded ??
                                                    true)) {
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
                                                  if (_model
                                                          .addCustomFoodToggleValue !=
                                                      null) {
                                                    final foodDataCreateData =
                                                        createFoodDataRecordData(
                                                      source: currentUserUid,
                                                      foodNameFull: '',
                                                      totalsugarsg:
                                                          double.tryParse(_model
                                                              .gramsCarbsController2
                                                              .text),
                                                    );
                                                    var foodDataRecordReference =
                                                        FoodDataRecord
                                                            .collection
                                                            .doc();
                                                    await foodDataRecordReference
                                                        .set(
                                                            foodDataCreateData);
                                                    _model.addFoodToDatabase =
                                                        FoodDataRecord
                                                            .getDocumentFromData(
                                                                foodDataCreateData,
                                                                foodDataRecordReference);
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else {
                                                    await _model
                                                        .pageViewController
                                                        ?.animateToPage(
                                                      2,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  }
                                                } else {
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Confirm Carb Intake',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Builder(
                                  builder: (context) {
                                    final searchResultsListView =
                                        _model.simpleSearchResults.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: searchResultsListView.length,
                                      itemBuilder: (context,
                                          searchResultsListViewIndex) {
                                        final searchResultsListViewItem =
                                            searchResultsListView[
                                                searchResultsListViewIndex];
                                        return InkWell(
                                          onTap: () async {
                                            setState(() {
                                              _model.addToCarbItemsSummary(
                                                  searchResultsListViewItem
                                                      .reference);
                                            });
                                          },
                                          child: ListTile(
                                            title: Text(
                                              searchResultsListViewItem
                                                  .foodNameFull!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              '${searchResultsListViewItem.totalsugarsg?.toString()} grams',
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
                                              size: 45.0,
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
                                height: 3.0,
                                thickness: 3.0,
                                indent: 16.0,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Summary',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Builder(
                                        builder: (context) {
                                          final summary = _model
                                              .carbItemsSummary
                                              .map((e) => e.id)
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: summary.length,
                                            itemBuilder:
                                                (context, summaryIndex) {
                                              final summaryItem =
                                                  summary[summaryIndex];
                                              return ListTile(
                                                title: Text(
                                                  summaryItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.remove_circle_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                tileColor: Color(0xFFF5F5F5),
                                                dense: false,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 3.0,
                                thickness: 3.0,
                                indent: 16.0,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 16.0),
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
                                      borderRadius: 200.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
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
                                        size: 25.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        await _model.pageViewController
                                            ?.nextPage(
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
                                'Offset with ?X gms of carbs with x units of  insulin',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.gramsCarbsController2,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'units',
                                            hintStyle: TextStyle(
                                              color: Color(0x7EFFFFFF),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16.0,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x7EFFFFFF),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 3.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 32.0, 20.0, 12.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          textAlign: TextAlign.start,
                                          keyboardType: const TextInputType
                                                  .numberWithOptions(
                                              signed: true, decimal: true),
                                          validator: _model
                                              .gramsCarbsController2Validator
                                              .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 100.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
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
                                        size: 25.0,
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
                                height: 3.0,
                                thickness: 3.0,
                                indent: 16.0,
                                color: Color(0x40FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
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
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 100.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
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
                                        size: 30.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
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
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.vertical,
                          onDotClicked: (i) {
                            _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 5.0,
                            spacing: 8.0,
                            radius: 16.0,
                            dotWidth: 32.0,
                            dotHeight: 16.0,
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
