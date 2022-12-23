import '../auth/auth_util.dart';
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
        VisibilityEffect(duration: 400.ms),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
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
    'containerOnActionTriggerAnimation4': AnimationInfo(
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
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
      if ((valueOrDefault(currentUserDocument?.nightscout, '') != null &&
              valueOrDefault(currentUserDocument?.nightscout, '') != '') &&
          (valueOrDefault(currentUserDocument?.apiKey, '') != null &&
              valueOrDefault(currentUserDocument?.apiKey, '') != '') &&
          (valueOrDefault(currentUserDocument?.token, '') != null &&
              valueOrDefault(currentUserDocument?.token, '') != '')) {
        if (animationsMap['containerOnActionTriggerAnimation4'] != null) {
          animationsMap['containerOnActionTriggerAnimation4']!
              .controller
              .forward(from: 0.0);
        }
        if (animationsMap['containerOnActionTriggerAnimation5'] != null) {
          animationsMap['containerOnActionTriggerAnimation5']!
              .controller
              .forward(from: 0.0);
        }
        apiResult = await GetBloodGlucoseCall.call(
          apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
          nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
          token: valueOrDefault(currentUserDocument?.token, ''),
        );
        if ((apiResult?.succeeded ?? true)) {
          context.pushNamed(
            'Main',
            queryParams: {
              'apiResult': serializeParam(
                (apiResult?.jsonBody ?? ''),
                ParamType.JSON,
              ),
              'latestMmol': serializeParam(
                valueOrDefault<double>(
                  functions.singleSgvToDouble(getJsonField(
                    (apiResult?.jsonBody ?? ''),
                    r'''$[0].sgv''',
                  )),
                  18.0,
                ),
                ParamType.double,
              ),
              'dateString': serializeParam(
                (GetBloodGlucoseCall.dateString(
                  (apiResult?.jsonBody ?? ''),
                ) as List)
                    .map<String>((s) => s.toString())
                    .toList(),
                ParamType.String,
                true,
              ),
              'sgvList': serializeParam(
                GetBloodGlucoseCall.sgv(
                  (apiResult?.jsonBody ?? ''),
                ),
                ParamType.int,
                true,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
              ),
            },
          );
        } else {
          HapticFeedback.vibrate();
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Error'),
                content:
                    Text('Error getting latest Nightscout data from the API'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('I understand that data won\'t be up to date'),
                  ),
                ],
              );
            },
          );

          context.pushNamed('Main');
        }
      } else {
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Nightscout details required'),
                  content: Text(
                      'Please enter your Nightscout details on the next screen to proceed'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, false),
                      child: Text('Back'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, true),
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            ) ??
            false;
        if (confirmDialogResponse) {
          context.pushNamed('Settings');
        } else {
          context.pushNamed('loginPage');
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
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'redirect',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                        Align(
                          alignment: AlignmentDirectional(1, -1),
                          child: Container(
                            width: 300,
                            height: 400,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              shape: BoxShape.rectangle,
                            ),
                          ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation1']!,
                              hasBeenTriggered: hasContainerTriggered1),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-3.27, -1.29),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation2']!,
                              hasBeenTriggered: hasContainerTriggered2),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 64, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                'assets/images/Logo3.2-50Transparent.png',
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    Icons.face_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 45,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Text(
                                  'Authenticating Nightscout',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation4']!,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Icon(
                                    Icons.file_copy_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 45,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Text(
                                  'Loading data',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation5']!,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 34, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 2, 0),
                          child: Text(
                            'Welcome back',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 12, 0),
                          child: AuthUserStreamWidget(
                            child: Text(
                              currentUserDisplayName,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
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
              ],
            ),
          ),
        ));
  }
}
