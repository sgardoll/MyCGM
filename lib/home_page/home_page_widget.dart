import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'stackOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1, -200),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'progressBarOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 260.ms,
          duration: 600.ms,
          begin: Offset(1, -200),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 260.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 440.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  ApiCallResponse? apiResults;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().deleteMmol();
        FFAppState().mmol = 0.0;
      });
      apiResults = await GetBloodGlucoseCall.call();
      if ((apiResults?.succeeded ?? true)) {
        if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
          animationsMap['containerOnActionTriggerAnimation1']!
              .controller
              .forward(from: 0.0);
        }
        setState(
            () => FFAppState().mmol = functions.mmolListToLatestMmol(functions
                .sgvToMmolList(GetBloodGlucoseCall.sgv(
                  (apiResults?.jsonBody ?? ''),
                ).toList())
                .toList()));
        if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
          animationsMap['containerOnActionTriggerAnimation2']!
              .controller
              .forward(from: 0.0);
        }
        if (animationsMap['progressBarOnActionTriggerAnimation'] != null) {
          animationsMap['progressBarOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
        if (animationsMap['textOnActionTriggerAnimation'] != null) {
          animationsMap['textOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      } else {
        HapticFeedback.heavyImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (apiResults?.jsonBody ?? ''),
                r'''$.detail''',
              ).toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
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
  Widget build(BuildContext context) {
    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).black600,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    () {
                      if (FFAppState().mmol < 3.9) {
                        return FlutterFlowTheme.of(context).tertiaryColor;
                      } else if (FFAppState().mmol > 9.4) {
                        return FlutterFlowTheme.of(context).secondaryColor;
                      } else {
                        return FlutterFlowTheme.of(context).primaryColor;
                      }
                    }(),
                    FlutterFlowTheme.of(context).richBlackFOGRA29,
                  ),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Stack(
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              () {
                                if (FFAppState().mmol < 3.9) {
                                  return FlutterFlowTheme.of(context)
                                      .tertiaryColor;
                                } else if (FFAppState().mmol > 9.4) {
                                  return FlutterFlowTheme.of(context)
                                      .secondaryColor;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryColor;
                                }
                              }(),
                              FlutterFlowTheme.of(context).richBlackFOGRA29,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 16,
                                color: Color(0x7F202529),
                                offset: Offset(2, 4),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 200),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: GetBloodGlucoseCall.delta(
                                      (apiResults?.jsonBody ?? ''),
                                    ),
                                    yData: functions.stringListToDoubleList(
                                        functions
                                            .sgvToMmolList(
                                                GetBloodGlucoseCall.sgv(
                                              (apiResults?.jsonBody ?? ''),
                                            ).toList())
                                            .toList()),
                                    settings: LineChartBarData(
                                      color: Color(0x37FFFFFF),
                                      barWidth: 5,
                                      isCurved: true,
                                    ),
                                  )
                                ],
                                chartStylingInfo: ChartStylingInfo(
                                  enableTooltip: true,
                                  tooltipBackgroundColor: Color(0xC9FFFFFF),
                                  backgroundColor: Color(0x00FFFFFF),
                                  showBorder: false,
                                ),
                                axisBounds: AxisBounds(
                                  minY: 3,
                                  maxY: 25,
                                ),
                                xAxisLabelInfo: AxisLabelInfo(),
                                yAxisLabelInfo: AxisLabelInfo(),
                              ),
                            ),
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.5),
                        child: CircularPercentIndicator(
                          percent:
                              functions.sgvToProgressInd(FFAppState().mmol),
                          radius: MediaQuery.of(context).size.width * 0.375,
                          lineWidth: 40,
                          animation: true,
                          progressColor: Color(0x80FFFFFF),
                          backgroundColor: Color(0x7F202529),
                          center: Text(
                            FFAppState().mmol.toString().maybeHandleOverflow(
                                  maxChars: 20,
                                  replacement: '…',
                                ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 90,
                                ),
                          ),
                          startAngle: 30,
                        ).animateOnActionTrigger(
                          animationsMap['progressBarOnActionTriggerAnimation']!,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.1),
                        child: Text(
                          'as of ${functions.minutesAgo((GetBloodGlucoseCall.dateString(
                            (apiResults?.jsonBody ?? ''),
                          ) as List).map<String>((s) => s.toString()).toList())}',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ).animateOnActionTrigger(
                          animationsMap['textOnActionTriggerAnimation']!,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 24),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('NovoRapid');
                            },
                            text: 'NovoRapid',
                            icon: Icon(
                              Icons.add,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 50,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().mmol < 3.9) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryColor;
                                  } else if (FFAppState().mmol > 9.4) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryBackground;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).richBlackFOGRA29,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 1.4,
                                  ),
                              elevation: 8,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 84),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('Optisulin');
                            },
                            text: 'Optisulin',
                            icon: Icon(
                              Icons.add,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 50,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().mmol < 3.9) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryColor;
                                  } else if (FFAppState().mmol > 9.4) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryBackground;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).richBlackFOGRA29,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 1.4,
                                  ),
                              elevation: 8,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 1),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 24, 144),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('Carbs');
                            },
                            text: 'Carbs',
                            icon: Icon(
                              Icons.fastfood_outlined,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 50,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().mmol < 3.9) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryColor;
                                  } else if (FFAppState().mmol > 9.4) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryBackground;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).richBlackFOGRA29,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 1.4,
                                  ),
                              elevation: 8,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, -1),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.settings,
                            color: Color(0xBEFFFFFF),
                            size: 30,
                          ),
                          onPressed: () async {
                            context.pushNamed('Settings');
                          },
                        ),
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['stackOnActionTriggerAnimation']!,
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation1']!,
              ),
            ),
          ),
        ));
  }
}
