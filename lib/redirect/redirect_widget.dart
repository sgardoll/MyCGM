import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RedirectWidget extends StatefulWidget {
  const RedirectWidget({Key? key}) : super(key: key);

  @override
  _RedirectWidgetState createState() => _RedirectWidgetState();
}

class _RedirectWidgetState extends State<RedirectWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? apiResult;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 300.ms,
          duration: 2000.ms,
          begin: 1,
          end: 0,
        ),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 300.ms,
          duration: 2000.ms,
          begin: 1,
          end: 5,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 300.ms),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 1,
          end: 4,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 1230.ms,
          begin: 1,
          end: 0,
        ),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 1230.ms,
          begin: 1,
          end: 5,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -100),
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -100),
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -100),
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REDIRECT_PAGE_redirect_ON_PAGE_LOAD');
      logFirebaseEvent('redirect_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation3'] != null) {
        setState(() => hasContainerTriggered3 = true);
        SchedulerBinding.instance.addPostFrameCallback((_) async =>
            animationsMap['containerOnActionTriggerAnimation3']!
                .controller
                .forward(from: 0.0)
                .whenComplete(
                    animationsMap['containerOnActionTriggerAnimation3']!
                        .controller
                        .reverse));
      }
      logFirebaseEvent('redirect_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
        setState(() => hasContainerTriggered1 = true);
        SchedulerBinding.instance.addPostFrameCallback((_) async =>
            animationsMap['containerOnActionTriggerAnimation1']!
                .controller
                .forward(from: 0.0)
                .whenComplete(
                    animationsMap['containerOnActionTriggerAnimation1']!
                        .controller
                        .reverse));
      }
      logFirebaseEvent('redirect_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
        setState(() => hasContainerTriggered2 = true);
        SchedulerBinding.instance.addPostFrameCallback((_) async =>
            animationsMap['containerOnActionTriggerAnimation2']!
                .controller
                .forward(from: 0.0)
                .whenComplete(
                    animationsMap['containerOnActionTriggerAnimation2']!
                        .controller
                        .reverse));
      }
      if (loggedIn) {
        logFirebaseEvent('redirect_widget_animation');
        if (animationsMap['containerOnActionTriggerAnimation4'] != null) {
          await animationsMap['containerOnActionTriggerAnimation4']!
              .controller
              .forward(from: 0.0);
        }
        // NIGHTSCOUT FLOW
        logFirebaseEvent('redirect_widget_animation');
        if (animationsMap['containerOnActionTriggerAnimation5'] != null) {
          animationsMap['containerOnActionTriggerAnimation5']!
              .controller
              .forward(from: 0.0);
        }
        if ((valueOrDefault(currentUserDocument?.nightscout, '') != null &&
                valueOrDefault(currentUserDocument?.nightscout, '') != '') &&
            (valueOrDefault(currentUserDocument?.apiKey, '') != null &&
                valueOrDefault(currentUserDocument?.apiKey, '') != '') &&
            (valueOrDefault(currentUserDocument?.units, '') != null &&
                valueOrDefault(currentUserDocument?.units, '') != '') &&
            (valueOrDefault(currentUserDocument?.token, '') != null &&
                valueOrDefault(currentUserDocument?.token, '') != '')) {
          logFirebaseEvent('redirect_wait__delay');
          await Future.delayed(const Duration(milliseconds: 600));
          logFirebaseEvent('redirect_update_local_state');
          setState(() {
            FFAppState().nightscout =
                valueOrDefault(currentUserDocument?.nightscout, '');
            FFAppState().apiKey =
                valueOrDefault(currentUserDocument?.apiKey, '');
            FFAppState().token = valueOrDefault(currentUserDocument?.token, '');
          });
          // LOGIN FLOW
          logFirebaseEvent('redirect_widget_animation');
          if (animationsMap['containerOnActionTriggerAnimation5'] != null) {
            await animationsMap['containerOnActionTriggerAnimation5']!
                .controller
                .forward();
          }
          // LOAD DATA FLOW
          logFirebaseEvent('redirect_widget_animation');
          if (animationsMap['containerOnActionTriggerAnimation6'] != null) {
            animationsMap['containerOnActionTriggerAnimation6']!
                .controller
                .forward(from: 0.0);
          }
          logFirebaseEvent('redirect_backend_call');
          apiResult = await GetBloodGlucoseCall.call(
            apiKey: FFAppState().apiKey,
            nightscout: FFAppState().nightscout,
            token: FFAppState().token,
          );
          if ((apiResult?.jsonBody ?? '')) {
            logFirebaseEvent('redirect_wait__delay');
            await Future.delayed(const Duration(milliseconds: 600));
            logFirebaseEvent('redirect_navigate_to');

            context.pushNamed(
              'Main',
              queryParams: {
                'mmolList': serializeParam(
                  functions.sgvListToMmolListDouble(GetBloodGlucoseCall.sgv(
                    (apiResult?.jsonBody ?? ''),
                  ).toList()),
                  ParamType.double,
                  true,
                ),
                'latestMmol': serializeParam(
                  functions.sgvListToMmolDouble(GetBloodGlucoseCall.sgv(
                    (apiResult?.jsonBody ?? ''),
                  ).toList()),
                  ParamType.double,
                ),
                'dateStringList': serializeParam(
                  (GetBloodGlucoseCall.dateString(
                    (apiResult?.jsonBody ?? ''),
                  ) as List)
                      .map<String>((s) => s.toString())
                      .toList(),
                  ParamType.String,
                  true,
                ),
              }.withoutNulls,
            );

            return;
          } else {
            logFirebaseEvent('redirect_haptic_feedback');
            HapticFeedback.vibrate();
            logFirebaseEvent('redirect_alert_dialog');
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Error getting Nightscout data'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child:
                          Text('I understand that data won\'t be up to date'),
                    ),
                  ],
                );
              },
            );
            logFirebaseEvent('redirect_navigate_to');

            context.pushNamed('Main');

            return;
          }
        } else {
          logFirebaseEvent('redirect_alert_dialog');
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Nightscout details required'),
                    content: Text(
                        'Please enter your Nightscout details on the next screen to proceed'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Back'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            logFirebaseEvent('redirect_navigate_to');

            context.pushNamed('Settings');

            return;
          } else {
            logFirebaseEvent('redirect_navigate_to');

            context.pushNamed('loginPage');

            return;
          }
        }
      } else {
        logFirebaseEvent('redirect_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Please login'),
              content: Text('Please login on the next screen'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        logFirebaseEvent('redirect_navigate_to');

        context.pushNamed('loginPage');

        return;
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'redirect'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation']!
          .controller
          .forward(from: 0.0);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'redirect',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 40,
                          sigmaY: 40,
                        ),
                        child: Stack(
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Align(
                                alignment: AlignmentDirectional(2.5, -1.2),
                                child: Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation1']!,
                                    hasBeenTriggered: hasContainerTriggered1),
                              ),
                            Align(
                              alignment: AlignmentDirectional(1, -1.4),
                              child: Container(
                                width: 500,
                                height: 500,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation2']!,
                                  hasBeenTriggered: hasContainerTriggered2),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Align(
                                alignment: AlignmentDirectional(-1, -1.5),
                                child: Container(
                                  width: 350,
                                  height: 350,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation3']!,
                                    hasBeenTriggered: hasContainerTriggered3),
                              ),
                          ],
                        ),
                      ),
                    ),
                    ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 12,
                          sigmaY: 12,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 64, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Heart-White-50.png',
                                width:
                                    MediaQuery.of(context).size.width * 0.339,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 64, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Heart-White-50.png',
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 400, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text(
                                      'Hey there',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 12, 0),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.login_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Logging you in',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  .animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!)
                                  .animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation4']!,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.security_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Authenticating Nightscout',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation5']!,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x34090F13),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.open_in_browser_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Text(
                                        'Loading latest data',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation6']!,
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
        ));
  }
}
