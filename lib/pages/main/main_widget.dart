import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/p_o_s_t_carbs/p_o_s_t_carbs_widget.dart';
import '/components/p_o_s_t_insulin/p_o_s_t_insulin_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
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

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation1': AnimationInfo(
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
    'progressBarOnPageLoadAnimation2': AnimationInfo(
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
      if (isAndroid) {
        await actions.updateCheck(
          context,
        );
      } else {
        if (isiOS) {
          await actions.updateCheckIos(
            context,
          );
        }
      }

      _model.refreshTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 240000),
        callback: (timer) async {
          setState(() => _model.apiRequestCompleter = null);
          await _model.waitForApiRequestCompleter(minWait: 10000);
        },
        startImmediately: true,
      );
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
              )))
            .future,
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 40.0,
                ),
              ),
            );
          }
          final mainGetBloodGlucoseResponse = snapshot.data!;
          return Title(
              title: 'Main',
              color: FlutterFlowTheme.of(context).primaryColor,
              child: Scaffold(
                key: scaffoldKey,
                body: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 1.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            () {
                              if (GetBloodGlucoseCall.singleSgv(
                                    mainGetBloodGlucoseResponse.jsonBody,
                                  ) <
                                  70) {
                                return FlutterFlowTheme.of(context)
                                    .tertiaryColor;
                              } else if (GetBloodGlucoseCall.singleSgv(
                                    mainGetBloodGlucoseResponse.jsonBody,
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
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (valueOrDefault<bool>(
                                    valueOrDefault(
                                            currentUserDocument?.units, '') ==
                                        'mmol/L',
                                    true,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 50.0, 0.0, 0.0),
                                      child: CircularPercentIndicator(
                                        percent: () {
                                          if (GetBloodGlucoseCall.singleSgv(
                                                mainGetBloodGlucoseResponse
                                                    .jsonBody,
                                              ) ==
                                              null) {
                                            return 0.1;
                                          } else if (GetBloodGlucoseCall
                                                  .singleSgv(
                                                mainGetBloodGlucoseResponse
                                                    .jsonBody,
                                              ) <
                                              70) {
                                            return 0.1;
                                          } else if (GetBloodGlucoseCall
                                                  .singleSgv(
                                                mainGetBloodGlucoseResponse
                                                    .jsonBody,
                                              ) >
                                              169) {
                                            return 1.0;
                                          } else {
                                            return ((GetBloodGlucoseCall
                                                        .singleSgv(
                                                      mainGetBloodGlucoseResponse
                                                          .jsonBody,
                                                    ) -
                                                    70) /
                                                (169 - 70));
                                          }
                                        }(),
                                        radius: 150.0,
                                        lineWidth: 40.0,
                                        animation: true,
                                        progressColor: Color(0x80001219),
                                        backgroundColor: valueOrDefault<Color>(
                                          () {
                                            if (GetBloodGlucoseCall.singleSgv(
                                                  mainGetBloodGlucoseResponse
                                                      .jsonBody,
                                                ) <
                                                70) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryColor;
                                            } else if (GetBloodGlucoseCall
                                                    .singleSgv(
                                                  mainGetBloodGlucoseResponse
                                                      .jsonBody,
                                                ) >
                                                169) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryBackground;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        center: Text(
                                          formatNumber(
                                            GetBloodGlucoseCall.singleSgv(
                                                  mainGetBloodGlucoseResponse
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 90.0,
                                              ),
                                        ),
                                        startAngle: 0.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'progressBarOnPageLoadAnimation1']!),
                                    ),
                                  if (valueOrDefault<bool>(
                                    valueOrDefault(
                                            currentUserDocument?.units, '') !=
                                        'mmol/L',
                                    false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 50.0, 0.0, 0.0),
                                      child: CircularPercentIndicator(
                                        percent: () {
                                          if (GetBloodGlucoseCall.singleSgv(
                                                mainGetBloodGlucoseResponse
                                                    .jsonBody,
                                              ) ==
                                              null) {
                                            return 0.1;
                                          } else if (GetBloodGlucoseCall
                                                  .singleSgv(
                                                mainGetBloodGlucoseResponse
                                                    .jsonBody,
                                              ) <
                                              70) {
                                            return 0.1;
                                          } else if (GetBloodGlucoseCall
                                                  .singleSgv(
                                                mainGetBloodGlucoseResponse
                                                    .jsonBody,
                                              ) >
                                              169) {
                                            return 1.0;
                                          } else {
                                            return ((GetBloodGlucoseCall
                                                        .singleSgv(
                                                      mainGetBloodGlucoseResponse
                                                          .jsonBody,
                                                    ) -
                                                    70) /
                                                (169 - 70));
                                          }
                                        }(),
                                        radius: 150.0,
                                        lineWidth: 40.0,
                                        animation: true,
                                        progressColor: Color(0x80001219),
                                        backgroundColor: valueOrDefault<Color>(
                                          () {
                                            if (GetBloodGlucoseCall.singleSgv(
                                                  mainGetBloodGlucoseResponse
                                                      .jsonBody,
                                                ) <
                                                70) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryColor;
                                            } else if (GetBloodGlucoseCall
                                                    .singleSgv(
                                                  mainGetBloodGlucoseResponse
                                                      .jsonBody,
                                                ) >
                                                169) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryBackground;
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        center: Text(
                                          GetBloodGlucoseCall.singleSgv(
                                            mainGetBloodGlucoseResponse
                                                .jsonBody,
                                          ).toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 90.0,
                                              ),
                                        ),
                                        startAngle: 0.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'progressBarOnPageLoadAnimation2']!),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
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
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: Text(
                                        'as of ${functions.minutesAgo((GetBloodGlucoseCall.dateString(
                                          mainGetBloodGlucoseResponse.jsonBody,
                                        ) as List).map<String>((s) => s.toString()).toList()!.toList())}',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 60.0,
                                child: custom_widgets.CurvedNavigationBarWidget(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 60.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  backgroundColor: Colors.transparent,
                                  buttonBackgroundColor: valueOrDefault<Color>(
                                    () {
                                      if (GetBloodGlucoseCall.singleSgv(
                                            mainGetBloodGlucoseResponse
                                                .jsonBody,
                                          ) <
                                          70) {
                                        return FlutterFlowTheme.of(context)
                                            .tertiaryColor;
                                      } else if (GetBloodGlucoseCall.singleSgv(
                                            mainGetBloodGlucoseResponse
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
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
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
                                      () {
                                        if (GetBloodGlucoseCall.singleSgv(
                                              mainGetBloodGlucoseResponse
                                                  .jsonBody,
                                            ) <
                                            70) {
                                          return FlutterFlowTheme.of(context)
                                              .tertiaryColor;
                                        } else if (GetBloodGlucoseCall
                                                .singleSgv(
                                              mainGetBloodGlucoseResponse
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
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.85,
                                            child: POSTCarbsWidget(),
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
                                      () {
                                        if (GetBloodGlucoseCall.singleSgv(
                                              mainGetBloodGlucoseResponse
                                                  .jsonBody,
                                            ) <
                                            70) {
                                          return FlutterFlowTheme.of(context)
                                              .tertiaryColor;
                                        } else if (GetBloodGlucoseCall
                                                .singleSgv(
                                              mainGetBloodGlucoseResponse
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
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: POSTInsulinWidget(
                                            insulinType: 'Novorapid',
                                            latestMmol:
                                                GetBloodGlucoseCall.singleSgv(
                                                      mainGetBloodGlucoseResponse
                                                          .jsonBody,
                                                    ) /
                                                    18,
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
                                      () {
                                        if (GetBloodGlucoseCall.singleSgv(
                                              mainGetBloodGlucoseResponse
                                                  .jsonBody,
                                            ) <
                                            70) {
                                          return FlutterFlowTheme.of(context)
                                              .tertiaryColor;
                                        } else if (GetBloodGlucoseCall
                                                .singleSgv(
                                              mainGetBloodGlucoseResponse
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
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: POSTInsulinWidget(
                                            insulinType: 'Optisulin',
                                            latestMmol:
                                                GetBloodGlucoseCall.singleSgv(
                                                      mainGetBloodGlucoseResponse
                                                          .jsonBody,
                                                    ) /
                                                    18,
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
                                  GetBloodGlucoseCall.singleSgv(
                                        mainGetBloodGlucoseResponse.jsonBody,
                                      ) /
                                      18,
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
              ));
        },
      ),
    );
  }
}
