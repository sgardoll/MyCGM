import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/p_o_s_t_carbs/p_o_s_t_carbs_widget.dart';
import '/components/p_o_s_t_insulin/p_o_s_t_insulin_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;
  var hasTextTriggered = false;
  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -54.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -25.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 0.125,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(75.0, 37.5),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 100.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: Offset(0.0, 75.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: Offset(-75.0, 37.5),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pageLoadAPICall = await GetBloodGlucoseCall.call(
        apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
        nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
        token: valueOrDefault(currentUserDocument?.token, ''),
        count: '2',
      );
      if ((_model.pageLoadAPICall?.succeeded ?? true)) {
        setState(() {
          _model.sgv = valueOrDefault<int>(
            getJsonField(
              (_model.pageLoadAPICall?.jsonBody ?? ''),
              r'''$[0].sgv''',
            ),
            18,
          );
        });
        if (_model.sgv != null) {
          setState(() {
            _model.mmol = valueOrDefault<double>(
              GetBloodGlucoseCall.singleSgv(
                    (_model.pageLoadAPICall?.jsonBody ?? ''),
                  ) /
                  18.0,
              1.0,
            );
            _model.mainColor = valueOrDefault<Color>(
              () {
                if (_model.sgv! < 70) {
                  return FlutterFlowTheme.of(context).tertiary;
                } else if (_model.sgv! > 169) {
                  return FlutterFlowTheme.of(context).secondary;
                } else {
                  return FlutterFlowTheme.of(context).primary;
                }
              }(),
              FlutterFlowTheme.of(context).primary,
            );
            _model.bgColor = valueOrDefault<Color>(
              () {
                if (_model.sgv! < 70) {
                  return FlutterFlowTheme.of(context).tertiary;
                } else if (_model.sgv! > 169) {
                  return FlutterFlowTheme.of(context).secondary;
                } else {
                  return FlutterFlowTheme.of(context).primary;
                }
              }(),
              FlutterFlowTheme.of(context).primary,
            );
            _model.date = DateTime.fromMillisecondsSinceEpoch(getJsonField(
              (_model.pageLoadAPICall?.jsonBody ?? ''),
              r'''$[0].date''',
            ));
          });
        }
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => FutureBuilder<ApiCallResponse>(
        future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
              ..complete(GetBloodGlucoseCall.call(
                apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
                nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
                token: valueOrDefault(currentUserDocument?.token, ''),
                count: valueOrDefault<String>(
                  FFAppState().count,
                  '30',
                ),
              )))
            .future,
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
              ),
            );
          }
          final mainGetBloodGlucoseResponse = snapshot.data!;
          return Title(
              title: 'Main',
              color: FlutterFlowTheme.of(context).primary,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          decoration: BoxDecoration(
                            color: _model.bgColor,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 500.0,
                                  child: Stack(
                                    children: [
                                      PageView(
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(initialPage: 1),
                                        onPageChanged: (_) => setState(() {}),
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Text(
                                                          'last',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownValueController1 ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dropDownValue1 ??=
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .count,
                                                              '30',
                                                            ),
                                                          ),
                                                          options: [
                                                            '30',
                                                            '60',
                                                            '90',
                                                            '120',
                                                            '150',
                                                            '180',
                                                            '210',
                                                            '240',
                                                            '270',
                                                            '300'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .dropDownValue1 =
                                                                val);
                                                            setState(() {
                                                              FFAppState()
                                                                      .count =
                                                                  _model
                                                                      .dropDownValue1!;
                                                            });
                                                            setState(() => _model
                                                                    .apiRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForApiRequestCompleted(
                                                                    maxWait:
                                                                        5000);
                                                          },
                                                          width: 75.0,
                                                          height: 30.0,
                                                          searchHintTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium,
                                                          searchHintText:
                                                              'Search for an item...',
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 12.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ),
                                                      Text(
                                                        'readings',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [],
                                                ),
                                              ),
                                              if (valueOrDefault<bool>(
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.units,
                                                        '') ==
                                                    'mmol/L',
                                                true,
                                              ))
                                                CircularPercentIndicator(
                                                  percent:
                                                      valueOrDefault<double>(
                                                    () {
                                                      if (_model.sgv == null) {
                                                        return 0.1;
                                                      } else if (_model.sgv! <
                                                          70) {
                                                        return 0.1;
                                                      } else if (_model.sgv! >
                                                          169) {
                                                        return 1.0;
                                                      } else {
                                                        return valueOrDefault<
                                                            double>(
                                                          (_model.sgv! - 70) /
                                                              (169 - 70),
                                                          0.1,
                                                        );
                                                      }
                                                    }(),
                                                    0.1,
                                                  ),
                                                  radius: 150.0,
                                                  lineWidth: 40.0,
                                                  animation: true,
                                                  progressColor:
                                                      Color(0x80001219),
                                                  backgroundColor:
                                                      valueOrDefault<Color>(
                                                    _model.mainColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  center: Text(
                                                    formatNumber(
                                                      _model.mmol,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '##.0',
                                                      locale: '',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 90.0,
                                                        ),
                                                  ),
                                                  startAngle: 0.0,
                                                ).animateOnPageLoad(animationsMap[
                                                    'progressBarOnPageLoadAnimation']!),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 40.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.units,
                                                        ''),
                                                    'mmol/L',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'as of ${dateTimeFormat(
                                                    'relative',
                                                    _model.date,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
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
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Text(
                                                          'last',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownValueController2 ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dropDownValue2 ??=
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .count,
                                                              '30',
                                                            ),
                                                          ),
                                                          options: [
                                                            '30',
                                                            '60',
                                                            '90',
                                                            '120',
                                                            '150',
                                                            '180',
                                                            '210',
                                                            '240',
                                                            '270',
                                                            '300'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .dropDownValue2 =
                                                                val);
                                                            setState(() {
                                                              FFAppState()
                                                                      .count =
                                                                  _model
                                                                      .dropDownValue2!;
                                                            });
                                                            setState(() => _model
                                                                    .apiRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForApiRequestCompleted(
                                                                    maxWait:
                                                                        5000);
                                                          },
                                                          width: 75.0,
                                                          height: 30.0,
                                                          searchHintTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium,
                                                          searchHintText:
                                                              'Search for an item...',
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 12.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                        ),
                                                      ),
                                                      Text(
                                                        'readings',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 6,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.units,
                                                                        ''),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 24.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                ))
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      'direction',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                  ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                ))
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child: Text(
                                                                      'recorded by',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Text(
                                                                    'as of',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                          ),
                                                          if (FFAppState()
                                                              .refresh)
                                                            Text(
                                                              'refreshing...',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                  ),
                                                            ).animateOnActionTrigger(
                                                                animationsMap[
                                                                    'textOnActionTriggerAnimation']!,
                                                                hasBeenTriggered:
                                                                    hasTextTriggered),
                                                          Expanded(
                                                            child: Stack(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final table =
                                                                          GetBloodGlucoseCall.sgv(
                                                                                mainGetBloodGlucoseResponse.jsonBody,
                                                                              )?.map((e) => e).toList()?.toList() ??
                                                                              [];
                                                                      if (table
                                                                          .isEmpty) {
                                                                        return Center(
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Logo3.2-50Transparent.png',
                                                                          ),
                                                                        );
                                                                      }
                                                                      return RefreshIndicator(
                                                                        onRefresh:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().refresh =
                                                                                true;
                                                                          });
                                                                          if (animationsMap['textOnActionTriggerAnimation'] !=
                                                                              null) {
                                                                            setState(() =>
                                                                                hasTextTriggered = true);
                                                                            SchedulerBinding.instance.addPostFrameCallback((_) async =>
                                                                                animationsMap['textOnActionTriggerAnimation']!.controller.forward(from: 0.0));
                                                                          }
                                                                          setState(() =>
                                                                              _model.apiRequestCompleter = null);
                                                                          await _model.waitForApiRequestCompleted(
                                                                              maxWait: 4000);
                                                                          setState(
                                                                              () {
                                                                            FFAppState().refresh =
                                                                                false;
                                                                          });
                                                                        },
                                                                        child: ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              table.length,
                                                                          itemBuilder:
                                                                              (context, tableIndex) {
                                                                            final tableItem =
                                                                                table[tableIndex];
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 2.0,
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x80001219),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                AutoSizeText(
                                                                                                  formatNumber(
                                                                                                    tableItem.toDouble() / 18,
                                                                                                    formatType: FormatType.custom,
                                                                                                    format: '###.0',
                                                                                                    locale: 'en_AU',
                                                                                                  ).maybeHandleOverflow(
                                                                                                    maxChars: 32,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).accent3,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 24.0,
                                                                                              height: 24.0,
                                                                                              child: custom_widgets.DirectionIcon(
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                direction: getJsonField(
                                                                                                  mainGetBloodGlucoseResponse.jsonBody,
                                                                                                  r'''$.direction''',
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                  mainGetBloodGlucoseResponse.jsonBody,
                                                                                                  r'''$.direction''',
                                                                                                ).toString(),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              flex: 3,
                                                                                              child: Text(
                                                                                                getJsonField(
                                                                                                  mainGetBloodGlucoseResponse.jsonBody,
                                                                                                  r'''$.device''',
                                                                                                ).toString(),
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Status',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).accent3,
                                                                                                          fontWeight: FontWeight.w300,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Divider(
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.7),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.75,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x41001219),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            child:
                                                                                BackdropFilter(
                                                                              filter: ImageFilter.blur(
                                                                                sigmaX: 2.0,
                                                                                sigmaY: 2.0,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: AutoSizeText(
                                                                                        'Hello World',
                                                                                        textAlign: TextAlign.center,
                                                                                        maxLines: 10,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.9,
                                                                            0.5),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .info_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                          size:
                                                                              36.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 1),
                                            count: 3,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            effect: smooth_page_indicator
                                                .ExpandingDotsEffect(
                                              expansionFactor: 4.0,
                                              spacing: 16.0,
                                              radius: 16.0,
                                              dotWidth: 16.0,
                                              dotHeight: 16.0,
                                              dotColor: Color(0x80001219),
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 60.0,
                                  child:
                                      custom_widgets.CurvedNavigationBarWidget(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 60.0,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    backgroundColor: Colors.transparent,
                                    buttonBackgroundColor:
                                        valueOrDefault<Color>(
                                      _model.bgColor,
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    index: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 90.0,
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 24.0,
                                        color: Color(0x40000000),
                                        offset: Offset(0.0, 2.0),
                                        spreadRadius: 12.0,
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().FABOpen) {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation3']!
                                                  .controller
                                                  .reverse);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = false;
                                        });
                                      } else {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = true;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 75.0,
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation']!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 37.5),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 50.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    icon: Icon(
                                      Icons.local_dining_rounded,
                                      color: valueOrDefault<Color>(
                                        _model.mainColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      if (FFAppState().FABOpen) {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation3']!
                                                  .controller
                                                  .reverse);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = false;
                                        });
                                      } else {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = true;
                                        });
                                      }

                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(_unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(
                                                      bottomSheetContext)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.85,
                                                child: POSTCarbsWidget(
                                                  latestMmol:
                                                      valueOrDefault<double>(
                                                    GetBloodGlucoseCall
                                                            .singleSgv(
                                                          mainGetBloodGlucoseResponse
                                                              .jsonBody,
                                                        ) /
                                                        18.0,
                                                    0.1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconButtonOnActionTriggerAnimation1']!,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 75.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 50.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    icon: Icon(
                                      FFIcons.kicon,
                                      color: valueOrDefault<Color>(
                                        _model.mainColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      if (FFAppState().FABOpen) {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation3']!
                                                  .controller
                                                  .reverse);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = false;
                                        });
                                      } else {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = true;
                                        });
                                      }

                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(_unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(
                                                      bottomSheetContext)
                                                  .viewInsets,
                                              child: POSTInsulinWidget(
                                                insulinType: 'Novorapid',
                                                latestMmol:
                                                    valueOrDefault<double>(
                                                  GetBloodGlucoseCall.singleSgv(
                                                        mainGetBloodGlucoseResponse
                                                            .jsonBody,
                                                      ) /
                                                      18,
                                                  0.1,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconButtonOnActionTriggerAnimation2']!,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 37.5),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 50.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    icon: Icon(
                                      FFIcons.k12Hour,
                                      color: valueOrDefault<Color>(
                                        _model.mainColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      if (FFAppState().FABOpen) {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward()
                                              .whenComplete(animationsMap[
                                                      'iconButtonOnActionTriggerAnimation3']!
                                                  .controller
                                                  .reverse);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = false;
                                        });
                                      } else {
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation2']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'iconButtonOnActionTriggerAnimation3']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        FFAppState().update(() {
                                          FFAppState().FABOpen = true;
                                        });
                                      }

                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(_unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(
                                                      bottomSheetContext)
                                                  .viewInsets,
                                              child: POSTInsulinWidget(
                                                insulinType: 'Optisulin',
                                                latestMmol:
                                                    valueOrDefault<double>(
                                                  GetBloodGlucoseCall.singleSgv(
                                                        mainGetBloodGlucoseResponse
                                                            .jsonBody,
                                                      ) /
                                                      18,
                                                  0.1,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconButtonOnActionTriggerAnimation3']!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().FABOpen) {
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconOnActionTriggerAnimation']!
                                          .controller
                                          .reverse);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse);
                                }
                                FFAppState().update(() {
                                  FFAppState().FABOpen = false;
                                });
                              }
                              await Future.delayed(
                                  const Duration(milliseconds: 200));

                              context.pushNamed(
                                'Settings',
                                queryParams: {
                                  'latestMmol': serializeParam(
                                    valueOrDefault<double>(
                                      _model.mmol,
                                      1.0,
                                    ),
                                    ParamType.double,
                                  ),
                                  'userRef': serializeParam(
                                    currentUserReference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              height: 60.0,
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().FABOpen) {
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconOnActionTriggerAnimation']!
                                          .controller
                                          .reverse);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse);
                                }
                                FFAppState().update(() {
                                  FFAppState().FABOpen = false;
                                });
                              }

                              context.pushNamed(
                                'Main',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.scale,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              height: 60.0,
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
