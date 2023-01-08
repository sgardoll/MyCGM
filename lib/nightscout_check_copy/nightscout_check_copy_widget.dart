import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NightscoutCheckCopyWidget extends StatefulWidget {
  const NightscoutCheckCopyWidget({Key? key}) : super(key: key);

  @override
  _NightscoutCheckCopyWidgetState createState() =>
      _NightscoutCheckCopyWidgetState();
}

class _NightscoutCheckCopyWidgetState extends State<NightscoutCheckCopyWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? apiResult;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? pageViewController;
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
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NIGHTSCOUT_CHECK_COPY_nightscoutCheckCop');
      logFirebaseEvent('nightscoutCheckCopy_widget_animation');
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
      logFirebaseEvent('nightscoutCheckCopy_widget_animation');
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
      logFirebaseEvent('nightscoutCheckCopy_widget_animation');
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
        logFirebaseEvent('nightscoutCheckCopy_backend_call');
        apiResult = await GetBloodGlucoseCall.call(
          apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
          nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
          token: valueOrDefault(currentUserDocument?.token, ''),
        );
        if ((apiResult?.succeeded ?? true)) {
          logFirebaseEvent('nightscoutCheckCopy_navigate_to');

          context.goNamed(
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
          logFirebaseEvent('nightscoutCheckCopy_haptic_feedback');
          HapticFeedback.vibrate();
          logFirebaseEvent('nightscoutCheckCopy_alert_dialog');
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
          logFirebaseEvent('nightscoutCheckCopy_navigate_to');

          context.pushNamed('Main');
        }
      } else {
        logFirebaseEvent('nightscoutCheckCopy_alert_dialog');
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
          logFirebaseEvent('nightscoutCheckCopy_navigate_to');

          context.pushNamed('Settings');
        } else {
          logFirebaseEvent('nightscoutCheckCopy_navigate_to');

          context.pushNamed('loginPage');
        }
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nightscoutCheckCopy'});
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
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'nightscoutCheckCopy',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 50),
                                child: PageView(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => AutoSizeText(
                                              'Welcome to MyCGM ${currentUserDisplayName}',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: AutoSizeText(
                                              'With a quick glance, MyCGM makes it easy to take control of your glucose levels.\n\nHere\'s how...',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: AutoSizeText(
                                            'Sometimes you just want to know...',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          '\"am I in range?\"',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 45,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: AutoSizeText(
                                            'without all the fuss',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: AutoSizeText(
                                            'With MyCGM all it takes is a quick glance',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: AutoSizeText(
                                            'with green indicating target range, orange indicating above range, and red indicating below range',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: AutoSizeText(
                                            'And if you need to take action, recording your insulin injection is a click of a button',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: AutoSizeText(
                                            '',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 4,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 32,
                                      dotHeight: 4,
                                      dotColor: Color(0x81262D34),
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
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NIGHTSCOUT_CHECK_COPY_Button-Logout_ON_T');
                                logFirebaseEvent('Button-Logout_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('loginPage', mounted);
                              },
                              text: '',
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NIGHTSCOUT_CHECK_COPY_Button-Logout_ON_T');
                                logFirebaseEvent('Button-Logout_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('loginPage', mounted);
                              },
                              text:
                                  (pageViewController?.page?.round() ?? 0) == 0
                                      ? 'Let\'s Begin'
                                      : 'Next',
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
