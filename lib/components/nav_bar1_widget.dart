import '../auth/auth_util.dart';
import '../components/p_o_s_t_insulin_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({Key? key}) : super(key: key);

  @override
  _NavBar1WidgetState createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, 68),
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
          begin: Offset(0, 68),
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
          begin: Offset(0, 68),
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

  @override
  void initState() {
    super.initState();
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: Color(0x00EEEEEE),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AuthUserStreamWidget(
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            () {
                              if (functions.mmolListToLatestMmolFirebase(
                                      currentUserDocument!.data.mmol
                                          ?.toList()
                                          ?.toList()) <
                                  3.9) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryColor;
                              } else if (functions.mmolListToLatestMmolFirebase(
                                      currentUserDocument!.data.mmol
                                          ?.toList()
                                          ?.toList()) >
                                  9.4) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryBackground;
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0x1A57636C),
                              offset: Offset(0, -10),
                              spreadRadius: 0.1,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    icon: Icon(
                      Icons.settings_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('NAV_BAR1_settings_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed('Settings');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    icon: Icon(
                      Icons.home_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('NAV_BAR1_COMP_home_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed('HomePage');
                    },
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (FFAppState().FABOpen == false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: AuthUserStreamWidget(
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 25,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR1_COMP_FABPlus_ON_TAP');
                                logFirebaseEvent('FABPlus_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('FABPlus_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('FABPlus_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                logFirebaseEvent('FABPlus_update_local_state');
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      if (FFAppState().FABOpen)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: AuthUserStreamWidget(
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 25,
                              borderWidth: 1,
                              buttonSize: 60,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              icon: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NAV_BAR1_COMP_FABMinus_ON_TAP');
                                logFirebaseEvent('FABMinus_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0)
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse);
                                }
                                logFirebaseEvent('FABMinus_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0)
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse);
                                }
                                logFirebaseEvent('FABMinus_widget_animation');
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0)
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse);
                                }
                                logFirebaseEvent('FABMinus_update_local_state');
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.64, -4),
                child: AuthUserStreamWidget(
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                    icon: Icon(
                      Icons.speed_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('NAV_BAR1_COMP_AddNovoButton_ON_TAP');
                      logFirebaseEvent('AddNovoButton_bottom_sheet');
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: POSTInsulinWidget(
                              insulinType: 'NovoRapid',
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                  ).animateOnActionTrigger(
                    animationsMap['iconButtonOnActionTriggerAnimation1']!,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.64, -7),
                child: AuthUserStreamWidget(
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                    icon: Icon(
                      Icons.timelapse,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('NAV_BAR1_COMP_AddOptiButton_ON_TAP');
                      logFirebaseEvent('AddOptiButton_bottom_sheet');
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: POSTInsulinWidget(
                              insulinType: 'Optisulin',
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                  ).animateOnActionTrigger(
                    animationsMap['iconButtonOnActionTriggerAnimation2']!,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.64, -10),
                child: AuthUserStreamWidget(
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                    icon: Icon(
                      Icons.local_dining_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('NAV_BAR1_COMP_AddCarbsButton_ON_TAP');
                      logFirebaseEvent('AddCarbsButton_navigate_to');

                      context.pushNamed('Carbs');
                    },
                  ).animateOnActionTrigger(
                    animationsMap['iconButtonOnActionTriggerAnimation3']!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
