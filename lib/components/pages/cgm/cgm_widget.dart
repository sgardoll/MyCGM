import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar1_widget.dart';
import '/components/p_o_s_t_insulin/p_o_s_t_insulin_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cgm_model.dart';
export 'cgm_model.dart';

class CgmWidget extends StatefulWidget {
  const CgmWidget({Key? key}) : super(key: key);

  @override
  _CgmWidgetState createState() => _CgmWidgetState();
}

class _CgmWidgetState extends State<CgmWidget> with TickerProviderStateMixin {
  late CgmModel _model;

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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CgmModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CGM'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(
            valueOrDefault(currentUserDocument?.nightscout, '') != null &&
                valueOrDefault(currentUserDocument?.nightscout, '') != '',
            false,
          ) &&
          valueOrDefault<bool>(
            valueOrDefault(currentUserDocument?.apiKey, '') != null &&
                valueOrDefault(currentUserDocument?.apiKey, '') != '',
            false,
          ) &&
          valueOrDefault<bool>(
            valueOrDefault(currentUserDocument?.units, '') != null &&
                valueOrDefault(currentUserDocument?.units, '') != '',
            false,
          ) &&
          (valueOrDefault(currentUserDocument?.token, '') != null &&
              valueOrDefault(currentUserDocument?.token, '') != '')) {
        _model.pageLoadAPICall = await GetBloodGlucoseCall.call(
          apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
          nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
          token: valueOrDefault(currentUserDocument?.token, ''),
          count: '30',
        );
        if ((_model.pageLoadAPICall?.succeeded ?? true)) {
          if (valueOrDefault(currentUserDocument?.units, '') == 'mmol/L'
              ? true
              : false) {
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
              FFAppState().lastSgvDate = getJsonField(
                (_model.pageLoadAPICall?.jsonBody ?? ''),
                r'''$[0].date''',
              );
            });
          } else {
            setState(() {
              FFAppState().latestMmol = valueOrDefault<double>(
                getJsonField(
                  (_model.pageLoadAPICall?.jsonBody ?? ''),
                  r'''$[0].sgv''',
                ),
                18.0,
              );
              FFAppState().lastSgvDate = getJsonField(
                (_model.pageLoadAPICall?.jsonBody ?? ''),
                r'''$[0].date''',
              );
            });
          }
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Nightscout, units or diabetes settings missing'),
              content: Text(
                  'Please enter your missing details in Settings to view this section'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.pushNamed('Settings');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    final gaugePieChartColorsList = [
      Color(0xFF1B998B),
      Colors.white,
      Color(0xFF00335A)
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'My CGM',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).secondary,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 6.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () async {
                            _model.longPressAPICall =
                                await GetBloodGlucoseCall.call(
                              apiKey: valueOrDefault(
                                  currentUserDocument?.apiKey, ''),
                              nightscout: valueOrDefault(
                                  currentUserDocument?.nightscout, ''),
                              token: valueOrDefault(
                                  currentUserDocument?.token, ''),
                              count: '30',
                            );
                            if ((_model.longPressAPICall?.succeeded ?? true)) {
                              if (valueOrDefault(
                                          currentUserDocument?.units, '') ==
                                      'mmol/L'
                                  ? true
                                  : false) {
                                FFAppState().update(() {
                                  FFAppState().latestMmol =
                                      valueOrDefault<double>(
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
                              } else {
                                FFAppState().update(() {
                                  FFAppState().latestMmol =
                                      valueOrDefault<double>(
                                    getJsonField(
                                      (_model.pageLoadAPICall?.jsonBody ?? ''),
                                      r'''$[0].sgv''',
                                    ),
                                    18.0,
                                  );
                                });
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Error Refreshing CGM',
                                    style: GoogleFonts.getFont(
                                      'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          child: RefreshIndicator(
                            color: FlutterFlowTheme.of(context).secondary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            onRefresh: () async {
                              _model.pullRefreshAPICall =
                                  await GetBloodGlucoseCall.call(
                                apiKey: valueOrDefault(
                                    currentUserDocument?.apiKey, ''),
                                nightscout: valueOrDefault(
                                    currentUserDocument?.nightscout, ''),
                                token: valueOrDefault(
                                    currentUserDocument?.token, ''),
                                count: '30',
                              );
                              if ((_model.pullRefreshAPICall?.succeeded ??
                                  true)) {
                                if (valueOrDefault(
                                            currentUserDocument?.units, '') ==
                                        'mmol/L'
                                    ? true
                                    : false) {
                                  FFAppState().update(() {
                                    FFAppState().latestMmol =
                                        valueOrDefault<double>(
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
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().latestMmol =
                                        valueOrDefault<double>(
                                      getJsonField(
                                        (_model.pageLoadAPICall?.jsonBody ??
                                            ''),
                                        r'''$[0].sgv''',
                                      ),
                                      18.0,
                                    );
                                  });
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Error Refreshing CGM',
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                              }
                            },
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (valueOrDefault<bool>(
                                    FFAppState().latestMmol != null,
                                    false,
                                  ))
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.4,
                                                      height: 40.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.4,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
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
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      valueOrDefault<String>(
                                                                                valueOrDefault<String>(
                                                                                  dateTimeFormat(
                                                                                    'relative',
                                                                                    DateTime.fromMillisecondsSinceEpoch(FFAppState().lastSgvDate),
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  'OFFLINE',
                                                                                )?.toUpperCase(),
                                                                                'OFFLINE',
                                                                              ) ==
                                                                              '54 YEARS AGO'
                                                                          ? ''
                                                                          : valueOrDefault<String>(
                                                                              valueOrDefault<String>(
                                                                                dateTimeFormat(
                                                                                  'relative',
                                                                                  DateTime.fromMillisecondsSinceEpoch(FFAppState().lastSgvDate),
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                'OFFLINE',
                                                                              )?.toUpperCase(),
                                                                              'OFFLINE',
                                                                            ),
                                                                      '-',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      FFAppState().lastSgvDate >=
                                                                              (getCurrentTimestamp.millisecondsSinceEpoch -
                                                                                  24000)
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .info
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                    ),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 240.0,
                                            height: 240.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            child: FlutterFlowPieChart(
                                              data: FFPieChartData(
                                                values:
                                                    FFAppState().percentages,
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
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Text(
                                                    'GLUCOSE',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: AutoSizeText(
                                                  FFAppState()
                                                      .latestMmol
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayLarge
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        fontSize: 64.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        lineHeight: 0.9,
                                                      ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.units,
                                                          ''),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 50.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  icon: Icon(
                                    FFIcons.k12Hour,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
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
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: POSTInsulinWidget(
                                              insulinType: 'Optisulin',
                                              latestMmol:
                                                  FFAppState().latestMmol,
                                              userRef: currentUserReference,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 50.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    icon: Icon(
                                      FFIcons.kicon,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    onPressed: () async {
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
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: POSTInsulinWidget(
                                                insulinType: 'Novorapid',
                                                latestMmol:
                                                    FFAppState().latestMmol,
                                                userRef: currentUserReference,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBar1Model,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: NavBar1Widget(
                      activePage: 'CGM',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
