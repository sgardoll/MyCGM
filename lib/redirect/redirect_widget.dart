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
  ApiCallResponse? apiOnPageLoad;
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
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 1,
          end: 4,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
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
    'containerOnActionTriggerAnimation3': AnimationInfo(
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
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
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
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REDIRECT_PAGE_redirect_ON_PAGE_LOAD');
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
      if (loggedIn) {
        logFirebaseEvent('redirect_backend_call');
        apiOnPageLoad = await GetBloodGlucoseCall.call(
          apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
          nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
          token: valueOrDefault(currentUserDocument?.token, ''),
        );
        if ((apiOnPageLoad?.succeeded ?? true)) {
          logFirebaseEvent('redirect_update_local_state');
          setState(() {
            FFAppState().latestMmolList = functions
                .sgvListToMmolListDouble(GetBloodGlucoseCall.sgv(
                  (apiOnPageLoad?.jsonBody ?? ''),
                ).toList())
                .toList();
            FFAppState().latestDateList = (GetBloodGlucoseCall.dateString(
              (apiOnPageLoad?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()
                .toList();
            FFAppState().latestMmol = valueOrDefault<double>(
              functions.sgvListToMmolDouble(GetBloodGlucoseCall.sgv(
                (apiOnPageLoad?.jsonBody ?? ''),
              ).toList()),
              5.0,
            );
          });
          logFirebaseEvent('redirect_navigate_to');
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(
            'Main',
            queryParams: {
              'mmolList': serializeParam(
                functions.sgvListToMmolListDouble(GetBloodGlucoseCall.sgv(
                  (apiOnPageLoad?.jsonBody ?? ''),
                ).toList()),
                ParamType.double,
                true,
              ),
              'latestMmol': serializeParam(
                valueOrDefault<double>(
                  functions.sgvListToMmolDouble(GetBloodGlucoseCall.sgv(
                    (apiOnPageLoad?.jsonBody ?? ''),
                  ).toList()),
                  5.0,
                ),
                ParamType.double,
              ),
              'dateStringList': serializeParam(
                (GetBloodGlucoseCall.dateString(
                  (apiOnPageLoad?.jsonBody ?? ''),
                ) as List)
                    .map<String>((s) => s.toString())
                    .toList(),
                ParamType.String,
                true,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else {
          logFirebaseEvent('redirect_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error getting Nightscout data. Retrying in 5 seconds',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondaryText,
            ),
          );
          logFirebaseEvent('redirect_wait__delay');
          await Future.delayed(const Duration(milliseconds: 5000));
          logFirebaseEvent('redirect_navigate_to');

          context.goNamed(
            'redirect',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
              ),
            },
          );
        }
      } else {
        logFirebaseEvent('redirect_navigate_to');

        context.goNamed('loginPage');
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'redirect'});
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
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(0, 1),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1, -1.4),
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          shape: BoxShape.circle,
                        ),
                      ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation1']!,
                          hasBeenTriggered: hasContainerTriggered1),
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
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                        alignment: AlignmentDirectional(2.5, -1.2),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            shape: BoxShape.circle,
                          ),
                        ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation3']!,
                            hasBeenTriggered: hasContainerTriggered3),
                      ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 40,
                            sigmaY: 40,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0, 1),
                              child: Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 64, 0, 24),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                'assets/images/Heart-White-50.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                                fit: BoxFit.contain,
                                              ),
                                              ClipRect(
                                                child: ImageFiltered(
                                                  imageFilter: ImageFilter.blur(
                                                    sigmaX: 6,
                                                    sigmaY: 6,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Heart-White-50.png',
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.3,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'rowOnPageLoadAnimation']!),
                                    ),
                                    Text(
                                      'Loading...',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: Container(
                                          width: double.infinity,
                                          height: 500,
                                          constraints: BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
