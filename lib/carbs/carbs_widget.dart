import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarbsWidget extends StatefulWidget {
  const CarbsWidget({Key? key}) : super(key: key);

  @override
  _CarbsWidgetState createState() => _CarbsWidgetState();
}

class _CarbsWidgetState extends State<CarbsWidget> {
  ApiCallResponse? postCarbsResponse;
  TextEditingController? addUniitsWithCarbsController;
  TextEditingController? gramsCarbsController;
  bool? addNovoSwitchValue;
  TextEditingController? overrideRatioTextFieldController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addUniitsWithCarbsController = TextEditingController(
        text: functions.novoCalcBasedOnRatio(
            FFAppState().ratio, FFAppState().carbValuForCalc));
    gramsCarbsController = TextEditingController();
    overrideRatioTextFieldController = TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().ratio,
      '20',
    ));
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Carbs'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    addUniitsWithCarbsController?.dispose();
    gramsCarbsController?.dispose();
    overrideRatioTextFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Carbs',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: responsiveVisibility(
            context: context,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Add Carbs',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        buttonSize: 48,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'CARBS_PAGE_close_rounded_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.pop();
                        },
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 4,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AuthUserStreamWidget(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      () {
                        if (functions.mmolListToLatestMmolFirebase(
                                currentUserDocument!.data.mmol
                                    ?.toList()
                                    ?.toList()) <
                            3.9) {
                          return FlutterFlowTheme.of(context).tertiaryColor;
                        } else if (functions.mmolListToLatestMmolFirebase(
                                currentUserDocument!.data.mmol
                                    ?.toList()
                                    ?.toList()) >
                            9.4) {
                          return FlutterFlowTheme.of(context).secondaryColor;
                        } else {
                          return FlutterFlowTheme.of(context).primaryColor;
                        }
                      }(),
                      FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 125, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: gramsCarbsController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'add carbs (grams)',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 32, 20, 12),
                            ),
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0x99001219),
                                ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }

                              return null;
                            },
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: SwitchListTile(
                              value: addNovoSwitchValue ??= false,
                              onChanged: (newValue) async {
                                setState(() => addNovoSwitchValue = newValue!);
                              },
                              title: Text(
                                'Offset With NovoRapid',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              activeTrackColor: Color(0x99001219),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Color(0xFFF1F4F8),
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0x80FFFFFF),
                                                shape: BoxShape.circle,
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: TextFormField(
                                                controller:
                                                    overrideRatioTextFieldController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1,
                                                textAlign: TextAlign.start,
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Grams of Carbs : 1 Unit of Insulin',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 60,
                                              icon: Icon(
                                                Icons.arrow_circle_down_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 6, 0),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 0, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Insulin ratio 1:',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 4, 0),
                                  child: Text(
                                    '=',
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .richBlackFOGRA29,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: Text(
                                      functions.novoCalcBasedOnRatio(
                                          FFAppState().ratio,
                                          FFAppState().carbValuForCalc)!,
                                      maxLines: 2,
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.refresh,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CARBS_PAGE_refresh_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_update_local_state');
                                        setState(() {});
                                        logFirebaseEvent(
                                            'IconButton_update_local_state');
                                        setState(() {});
                                        logFirebaseEvent(
                                            'IconButton_validate_form');
                                        if (formKey.currentState == null ||
                                            !formKey.currentState!.validate()) {
                                          return;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: addUniitsWithCarbsController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'addUniitsWithCarbsController',
                                    Duration(milliseconds: 1500),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 32, 20, 12),
                                    suffixIcon: addUniitsWithCarbsController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              addUniitsWithCarbsController
                                                  ?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF757575),
                                              size: 22,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0x99001219),
                                      ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CARBS_PAGE_SUBMIT_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');
                                postCarbsResponse = await PostCarbsCall.call(
                                  enteredBy: 'MyCGM_Carbs',
                                  eventType: 'Meal Bolus',
                                  carbs: gramsCarbsController!.text,
                                  insulin: addUniitsWithCarbsController!.text,
                                  insulinInjections:
                                      '[{\\\"insulin\\\":\\\"Novorapid\\\",\\\"units\\\":XX.0}]',
                                );
                                if ((postCarbsResponse?.succeeded ?? true) ==
                                    true) {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Submission to Nightscout Successful',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  );
                                } else {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Post Was Unsuccessful',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .rust,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  );
                                }

                                logFirebaseEvent(
                                    'Button_close_dialog,_drawer,_etc');
                                Navigator.pop(context);

                                setState(() {});
                              },
                              text: 'Submit',
                              options: FFButtonOptions(
                                width: 270,
                                height: 50,
                                color: Color(0x7FFFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
