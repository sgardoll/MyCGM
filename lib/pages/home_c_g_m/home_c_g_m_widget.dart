import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/components/p_o_s_t_insulin/p_o_s_t_insulin_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_c_g_m_model.dart';
export 'home_c_g_m_model.dart';

class HomeCGMWidget extends StatefulWidget {
  const HomeCGMWidget({Key? key}) : super(key: key);

  @override
  _HomeCGMWidgetState createState() => _HomeCGMWidgetState();
}

class _HomeCGMWidgetState extends State<HomeCGMWidget>
    with TickerProviderStateMixin {
  late HomeCGMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(10.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'chartOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.3,
          end: 1.0,
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
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
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
    'iconButtonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
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
    'iconButtonOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
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
    _model = createModel(context, () => HomeCGMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().FABOpen = false;
      });
      _model.pageLoadAPICall = await GetBloodGlucoseCall.call(
        apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
        nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
        token: valueOrDefault(currentUserDocument?.token, ''),
        count: '30',
      );
      if ((_model.pageLoadAPICall?.succeeded ?? true)) {
        setState(() {
          FFAppState().latestMmol = valueOrDefault<double>(
            num.parse((valueOrDefault<int>(
                          getJsonField(
                            (_model.pageLoadAPICall?.jsonBody ?? ''),
                            r'''$[0].sgv''',
                          ),
                          18,
                        ) /
                        18)
                    .toStringAsFixed(1))
                .toDouble(),
            1.0,
          );
        });
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final gaugePieChartColorsList = [
      Color(0xFF1B998B),
      Colors.white,
      Color(0xFF00335A)
    ];
    return Title(
        title: 'CGM',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Carbs & Cals',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Lato',
                                color: FlutterFlowTheme.of(context).btnText,
                              ),
                    ),
                    actions: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Settings');
                            },
                            child: Icon(
                              Icons.account_circle,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                    centerTitle: false,
                    elevation: 6.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 1.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _model.pullAPICall = await GetBloodGlucoseCall.call(
                          apiKey:
                              valueOrDefault(currentUserDocument?.apiKey, ''),
                          nightscout: valueOrDefault(
                              currentUserDocument?.nightscout, ''),
                          token: valueOrDefault(currentUserDocument?.token, ''),
                          count: '30',
                        );
                        if ((_model.pullAPICall?.succeeded ?? true)) {
                          setState(() {
                            FFAppState().latestMmol = valueOrDefault<double>(
                              num.parse((valueOrDefault<int>(
                                            getJsonField(
                                              (_model.pageLoadAPICall
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$[0].sgv''',
                                            ),
                                            18,
                                          ) /
                                          18)
                                      .toStringAsFixed(1))
                                  .toDouble(),
                              1.0,
                            );
                          });
                        }
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (valueOrDefault<bool>(
                              (_model.pageLoadAPICall?.succeeded ?? true)
                                  ? true
                                  : false,
                              false,
                            ))
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, -1.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 40.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Text(
                                                              'LIVE',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 12.0,
                                                            height: 12.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
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
                                        ),
                                      ),
                                      Container(
                                        width: 240.0,
                                        height: 240.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        width: 300.0,
                                        height: 300.0,
                                        child: FlutterFlowPieChart(
                                          data: FFPieChartData(
                                            values: FFAppState().percentages,
                                            colors: gaugePieChartColorsList,
                                            radius: [4.0],
                                            borderWidth: [0.0],
                                            borderColor: [
                                              FlutterFlowTheme.of(context)
                                                  .tertiary
                                            ],
                                          ),
                                          donutHoleRadius: 100.0,
                                          sectionLabelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'chartOnPageLoadAnimation']!),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: Text(
                                              'GLUCOSE',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            FFAppState().latestMmol.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily: 'Lato',
                                                  fontSize: 64.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 0.9,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault(
                                                    currentUserDocument?.units,
                                                    ''),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
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
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: FaIcon(
                                FontAwesomeIcons.barcode,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                if (FFAppState().FABOpen) {
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
                                  setState(() {
                                    FFAppState().FABOpen = false;
                                  });
                                } else {
                                  if (animationsMap[
                                          'iconButtonOnActionTriggerAnimation1'] !=
                                      null) {
                                    animationsMap[
                                            'iconButtonOnActionTriggerAnimation1']!
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
                                          'iconButtonOnActionTriggerAnimation3'] !=
                                      null) {
                                    animationsMap[
                                            'iconButtonOnActionTriggerAnimation3']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  setState(() {
                                    FFAppState().FABOpen = true;
                                  });
                                }

                                _model.scannedBarcode =
                                    await FlutterBarcodeScanner.scanBarcode(
                                  '#C62828', // scanning line color
                                  'Cancel', // cancel button text
                                  true, // whether to show the flash icon
                                  ScanMode.BARCODE,
                                );

                                if (_model.scannedBarcode != null &&
                                    _model.scannedBarcode != '') {
                                  var lookupRecordReference =
                                      LookupRecord.collection.doc();
                                  await lookupRecordReference
                                      .set(createLookupRecordData(
                                    input: _model.scannedBarcode,
                                  ));
                                  _model.barcodeAddedToFirestore =
                                      LookupRecord.getDocumentFromData(
                                          createLookupRecordData(
                                            input: _model.scannedBarcode,
                                          ),
                                          lookupRecordReference);
                                }

                                setState(() {});
                              },
                            )
                                .animateOnPageLoad(animationsMap[
                                    'iconButtonOnPageLoadAnimation1']!)
                                .animateOnActionTrigger(
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
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                FFIcons.kicon,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                if (FFAppState().FABOpen) {
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
                                  setState(() {
                                    FFAppState().FABOpen = false;
                                  });
                                } else {
                                  if (animationsMap[
                                          'iconButtonOnActionTriggerAnimation1'] !=
                                      null) {
                                    animationsMap[
                                            'iconButtonOnActionTriggerAnimation1']!
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
                                          'iconButtonOnActionTriggerAnimation3'] !=
                                      null) {
                                    animationsMap[
                                            'iconButtonOnActionTriggerAnimation3']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  setState(() {
                                    FFAppState().FABOpen = true;
                                  });
                                }

                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: POSTInsulinWidget(
                                          insulinType: 'Novorapid',
                                          latestMmol: FFAppState().latestMmol,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            )
                                .animateOnPageLoad(animationsMap[
                                    'iconButtonOnPageLoadAnimation2']!)
                                .animateOnActionTrigger(
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
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                FFIcons.k12Hour,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                if (FFAppState().FABOpen) {
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
                                  setState(() {
                                    FFAppState().FABOpen = false;
                                  });
                                } else {
                                  if (animationsMap[
                                          'iconButtonOnActionTriggerAnimation1'] !=
                                      null) {
                                    animationsMap[
                                            'iconButtonOnActionTriggerAnimation1']!
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
                                          'iconButtonOnActionTriggerAnimation3'] !=
                                      null) {
                                    animationsMap[
                                            'iconButtonOnActionTriggerAnimation3']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  setState(() {
                                    FFAppState().FABOpen = true;
                                  });
                                }

                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: POSTInsulinWidget(
                                          insulinType: 'Optisulin',
                                          latestMmol: FFAppState().latestMmol,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            )
                                .animateOnPageLoad(animationsMap[
                                    'iconButtonOnPageLoadAnimation3']!)
                                .animateOnActionTrigger(
                                  animationsMap[
                                      'iconButtonOnActionTriggerAnimation3']!,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      wrapWithModel(
                        model: _model.navBar1Model,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: NavBar1Widget(
                          activePage: 'CGM',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
