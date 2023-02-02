import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/p_o_s_t_carbs_widget.dart';
import '../components/p_o_s_t_insulin_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
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
          begin: Offset(75, 37.5),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
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
          begin: Offset(0, 75),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
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
          begin: Offset(-75, 37.5),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Main'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Main',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0x4D005F73),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Stack(
              children: [
                AuthUserStreamWidget(
                  builder: (context) => FutureBuilder<ApiCallResponse>(
                    future: GetBloodGlucoseCall.call(
                      apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
                      nightscout:
                          valueOrDefault(currentUserDocument?.nightscout, ''),
                      token: valueOrDefault(currentUserDocument?.token, ''),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).blueSapphire,
                              size: 25,
                            ),
                          ),
                        );
                      }
                      final backgroundGetBloodGlucoseResponse = snapshot.data!;
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            () {
                              if (GetBloodGlucoseCall.singleSgv(
                                    backgroundGetBloodGlucoseResponse.jsonBody,
                                  ) <
                                  70) {
                                return FlutterFlowTheme.of(context)
                                    .tertiaryColor;
                              } else if (GetBloodGlucoseCall.singleSgv(
                                    backgroundGetBloodGlucoseResponse.jsonBody,
                                  ) >
                                  169) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryColor;
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryColor;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: CircularPercentIndicator(
                                    percent: () {
                                      if (GetBloodGlucoseCall.singleSgv(
                                            backgroundGetBloodGlucoseResponse
                                                .jsonBody,
                                          ) ==
                                          null) {
                                        return 0.1;
                                      } else if (GetBloodGlucoseCall.singleSgv(
                                            backgroundGetBloodGlucoseResponse
                                                .jsonBody,
                                          ) <
                                          70) {
                                        return 0.1;
                                      } else if (GetBloodGlucoseCall.singleSgv(
                                            backgroundGetBloodGlucoseResponse
                                                .jsonBody,
                                          ) >
                                          169) {
                                        return 1.0;
                                      } else {
                                        return ((GetBloodGlucoseCall.singleSgv(
                                                  backgroundGetBloodGlucoseResponse
                                                      .jsonBody,
                                                ) -
                                                70) /
                                            (169 - 70));
                                      }
                                    }(),
                                    radius: 150,
                                    lineWidth: 40,
                                    animation: true,
                                    progressColor: Color(0x80001219),
                                    backgroundColor: valueOrDefault<Color>(
                                      () {
                                        if (GetBloodGlucoseCall.singleSgv(
                                              backgroundGetBloodGlucoseResponse
                                                  .jsonBody,
                                            ) <
                                            70) {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryColor;
                                        } else if (GetBloodGlucoseCall
                                                .singleSgv(
                                              backgroundGetBloodGlucoseResponse
                                                  .jsonBody,
                                            ) >
                                            169) {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        }
                                      }(),
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    center: Text(
                                      formatNumber(
                                        GetBloodGlucoseCall.singleSgv(
                                              backgroundGetBloodGlucoseResponse
                                                  .jsonBody,
                                            ) /
                                            18.0,
                                        formatType: FormatType.custom,
                                        format: '#0.0',
                                        locale: '',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 90,
                                          ),
                                    ),
                                    startAngle: 0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 40, 0, 0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      valueOrDefault(
                                          currentUserDocument?.units, ''),
                                      'mmol',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Text(
                                      'as of ${functions.minutesAgo((GetBloodGlucoseCall.dateString(
                                        backgroundGetBloodGlucoseResponse
                                            .jsonBody,
                                      ) as List).map<String>((s) => s.toString()).toList()!.toList())}',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: custom_widgets.CurvedNavigationBarWidget(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  backgroundColor: Colors.transparent,
                                  buttonBackgroundColor: valueOrDefault<Color>(
                                    () {
                                      if (GetBloodGlucoseCall.singleSgv(
                                            backgroundGetBloodGlucoseResponse
                                                .jsonBody,
                                          ) <
                                          70) {
                                        return FlutterFlowTheme.of(context)
                                            .tertiaryColor;
                                      } else if (GetBloodGlucoseCall.singleSgv(
                                            backgroundGetBloodGlucoseResponse
                                                .jsonBody,
                                          ) >
                                          169) {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryColor;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .primaryColor;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context).primaryColor,
                                  ),
                                  index: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 24,
                                color: Color(0x40000000),
                                offset: Offset(0, 2),
                                spreadRadius: 12,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent('MAIN_PAGE_FABIcon_ON_TAP');
                              if (FFAppState().FABOpen) {
                                logFirebaseEvent('FABIcon_widget_animation');
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
                                logFirebaseEvent('FABIcon_widget_animation');
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
                                logFirebaseEvent('FABIcon_widget_animation');
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
                                logFirebaseEvent('FABIcon_widget_animation');
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
                                logFirebaseEvent('FABIcon_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = false;
                                });
                                return;
                              } else {
                                logFirebaseEvent('FABIcon_widget_animation');
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('FABIcon_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('FABIcon_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('FABIcon_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('FABIcon_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = true;
                                });
                                return;
                              }
                            },
                            child: Icon(
                              Icons.add_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 75,
                            ),
                          ).animateOnActionTrigger(
                            animationsMap['iconOnActionTriggerAnimation']!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 15, 37.5),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 50,
                            borderWidth: 1,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              Icons.local_dining_rounded,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().latestMmol < 3.9) {
                                    return FlutterFlowTheme.of(context)
                                        .tertiaryColor;
                                  } else if (FFAppState().latestMmol > 9.4) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryColor;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryColor;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).primaryColor,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MAIN_PAGE_AddCarbsButton_ON_TAP');
                              if (FFAppState().FABOpen) {
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddCarbsButton_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = false;
                                });
                              } else {
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddCarbsButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddCarbsButton_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = true;
                                });
                              }

                              logFirebaseEvent('AddCarbsButton_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: POSTCarbsWidget(
                                      latestMmol: FFAppState().latestMmol,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 75),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 50,
                            borderWidth: 1,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              FFIcons.kicon,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().latestMmol < 3.9) {
                                    return FlutterFlowTheme.of(context)
                                        .tertiaryColor;
                                  } else if (FFAppState().latestMmol > 9.4) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryColor;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryColor;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).primaryColor,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MAIN_PAGE_AddNovoButton_ON_TAP');
                              if (FFAppState().FABOpen) {
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddNovoButton_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = false;
                                });
                              } else {
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddNovoButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddNovoButton_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = true;
                                });
                              }

                              logFirebaseEvent('AddNovoButton_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: POSTInsulinWidget(
                                      insulinType: 'Novorapid',
                                      latestMmol: FFAppState().latestMmol,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 37.5),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 50,
                            borderWidth: 1,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              FFIcons.k12Hour,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().latestMmol < 3.9) {
                                    return FlutterFlowTheme.of(context)
                                        .tertiaryColor;
                                  } else if (FFAppState().latestMmol > 9.4) {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryColor;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryColor;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).primaryColor,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MAIN_PAGE_AddOptiButton_ON_TAP');
                              if (FFAppState().FABOpen) {
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
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
                                logFirebaseEvent(
                                    'AddOptiButton_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = false;
                                });
                              } else {
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddOptiButton_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent(
                                    'AddOptiButton_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().FABOpen = true;
                                });
                              }

                              logFirebaseEvent('AddOptiButton_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: POSTInsulinWidget(
                                      insulinType: 'Optisulin',
                                      latestMmol: FFAppState().latestMmol,
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
                  alignment: AlignmentDirectional(-1, 1),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('MAIN_PAGE_LeftNavClick_ON_TAP');
                      if (FFAppState().FABOpen) {
                        logFirebaseEvent('LeftNavClick_widget_animation');
                        if (animationsMap['iconOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['iconOnActionTriggerAnimation']!
                              .controller
                              .forward()
                              .whenComplete(
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .reverse);
                        }
                        logFirebaseEvent('LeftNavClick_widget_animation');
                        if (animationsMap[
                                'iconButtonOnActionTriggerAnimation2'] !=
                            null) {
                          animationsMap['iconButtonOnActionTriggerAnimation2']!
                              .controller
                              .forward()
                              .whenComplete(animationsMap[
                                      'iconButtonOnActionTriggerAnimation2']!
                                  .controller
                                  .reverse);
                        }
                        logFirebaseEvent('LeftNavClick_widget_animation');
                        if (animationsMap[
                                'iconButtonOnActionTriggerAnimation1'] !=
                            null) {
                          animationsMap['iconButtonOnActionTriggerAnimation1']!
                              .controller
                              .forward()
                              .whenComplete(animationsMap[
                                      'iconButtonOnActionTriggerAnimation1']!
                                  .controller
                                  .reverse);
                        }
                        logFirebaseEvent('LeftNavClick_widget_animation');
                        if (animationsMap[
                                'iconButtonOnActionTriggerAnimation3'] !=
                            null) {
                          animationsMap['iconButtonOnActionTriggerAnimation3']!
                              .controller
                              .forward()
                              .whenComplete(animationsMap[
                                      'iconButtonOnActionTriggerAnimation3']!
                                  .controller
                                  .reverse);
                        }
                        logFirebaseEvent('LeftNavClick_update_local_state');
                        FFAppState().update(() {
                          FFAppState().FABOpen = false;
                        });
                      }
                      logFirebaseEvent('LeftNavClick_wait__delay');
                      await Future.delayed(const Duration(milliseconds: 200));
                      logFirebaseEvent('LeftNavClick_navigate_to');

                      context.pushNamed('Settings');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: 60,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('MAIN_PAGE_RightNavClick_ON_TAP');
                      if (FFAppState().FABOpen) {
                        logFirebaseEvent('RightNavClick_widget_animation');
                        if (animationsMap['iconOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['iconOnActionTriggerAnimation']!
                              .controller
                              .forward()
                              .whenComplete(
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .reverse);
                        }
                        logFirebaseEvent('RightNavClick_widget_animation');
                        if (animationsMap[
                                'iconButtonOnActionTriggerAnimation2'] !=
                            null) {
                          animationsMap['iconButtonOnActionTriggerAnimation2']!
                              .controller
                              .forward()
                              .whenComplete(animationsMap[
                                      'iconButtonOnActionTriggerAnimation2']!
                                  .controller
                                  .reverse);
                        }
                        logFirebaseEvent('RightNavClick_widget_animation');
                        if (animationsMap[
                                'iconButtonOnActionTriggerAnimation1'] !=
                            null) {
                          animationsMap['iconButtonOnActionTriggerAnimation1']!
                              .controller
                              .forward()
                              .whenComplete(animationsMap[
                                      'iconButtonOnActionTriggerAnimation1']!
                                  .controller
                                  .reverse);
                        }
                        logFirebaseEvent('RightNavClick_widget_animation');
                        if (animationsMap[
                                'iconButtonOnActionTriggerAnimation3'] !=
                            null) {
                          animationsMap['iconButtonOnActionTriggerAnimation3']!
                              .controller
                              .forward()
                              .whenComplete(animationsMap[
                                      'iconButtonOnActionTriggerAnimation3']!
                                  .controller
                                  .reverse);
                        }
                        logFirebaseEvent('RightNavClick_update_local_state');
                        FFAppState().update(() {
                          FFAppState().FABOpen = false;
                        });
                      }
                      logFirebaseEvent('RightNavClick_navigate_to');

                      context.pushNamed('Main');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: 60,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
