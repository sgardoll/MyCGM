import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
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
    'tabBarOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
  };
  TextEditingController? displayNameController;
  TextEditingController? emailAddressCreateController;
  TextEditingController? passwordCreateController;

  late bool passwordCreateVisibility;
  TextEditingController? passwordCreateConfirmController;

  late bool passwordCreateConfirmVisibility;
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  bool? checkboxValue;
  bool bioAfterAutoLogin = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_PAGE_PAGE_loginPage_ON_PAGE_LOAD');
      Function() _navigate = () {};
      if ((FFAppState().rememberedPass != null &&
              FFAppState().rememberedPass != '') &&
          (FFAppState().rememberedUser != null &&
              FFAppState().rememberedUser != '')) {
        logFirebaseEvent('loginPage_auth');
        GoRouter.of(context).prepareAuthEvent();

        final user = await signInWithEmail(
          context,
          emailAddressController!.text,
          passwordController!.text,
        );
        if (user == null) {
          return;
        }

        _navigate = () => context.goNamedAuth('redirect', mounted);
        logFirebaseEvent('loginPage_biometric_verification');
        final _localAuth = LocalAuthentication();
        bool _isBiometricSupported = await _localAuth.isDeviceSupported();

        if (_isBiometricSupported) {
          bioAfterAutoLogin = await _localAuth.authenticate(
              localizedReason: 'Please authenticate to login');
          setState(() {});
        }
      }

      _navigate();
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'loginPage'});
    displayNameController = TextEditingController();
    emailAddressCreateController = TextEditingController();
    passwordCreateController = TextEditingController();
    passwordCreateVisibility = false;
    passwordCreateConfirmController = TextEditingController();
    passwordCreateConfirmVisibility = false;
    emailAddressController = TextEditingController(
        text: FFAppState().rememberedUser != null &&
                FFAppState().rememberedUser != ''
            ? FFAppState().rememberedUser
            : '');
    passwordController = TextEditingController(
        text: FFAppState().rememberedPass != null &&
                FFAppState().rememberedPass != ''
            ? FFAppState().rememberedPass
            : '');
    passwordVisibility = false;
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['tabBarOnPageLoadAnimation']!.controller.forward(from: 0.0);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    displayNameController?.dispose();
    emailAddressCreateController?.dispose();
    passwordCreateController?.dispose();
    passwordCreateConfirmController?.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'loginPage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: GestureDetector(
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
                    ),
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
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(-1.25, -1.5),
                      child: Container(
                        width: 600,
                        height: 600,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
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
                        animationsMap['containerOnActionTriggerAnimation3']!,
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(1, -0.95),
                      child: Container(
                        width: 700,
                        height: 700,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation']!),
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
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: DefaultTabController(
                                                length: 2,
                                                initialIndex: 0,
                                                child: Column(
                                                  children: [
                                                    TabBar(
                                                      isScrollable: true,
                                                      labelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      unselectedLabelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      labelPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 0, 24, 0),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                      indicatorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      indicatorWeight: 2,
                                                      tabs: [
                                                        Tab(
                                                          text: 'Sign In',
                                                        ),
                                                        Tab(
                                                          text: 'Sign Up',
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: TabBarView(
                                                        children: [
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          20,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        emailAddressController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Email Address',
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              24,
                                                                              20,
                                                                              24),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                    maxLines:
                                                                        null,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          12,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        passwordController,
                                                                    obscureText:
                                                                        !passwordVisibility,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Password',
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              24,
                                                                              20,
                                                                              24),
                                                                      suffixIcon:
                                                                          InkWell(
                                                                        onTap: () =>
                                                                            setState(
                                                                          () => passwordVisibility =
                                                                              !passwordVisibility,
                                                                        ),
                                                                        focusNode:
                                                                            FocusNode(skipTraversal: true),
                                                                        child:
                                                                            Icon(
                                                                          passwordVisibility
                                                                              ? Icons.visibility_outlined
                                                                              : Icons.visibility_off_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              12,
                                                                              12,
                                                                              0),
                                                                      child:
                                                                          Theme(
                                                                        data:
                                                                            ThemeData(
                                                                          checkboxTheme:
                                                                              CheckboxThemeData(
                                                                            shape:
                                                                                CircleBorder(),
                                                                          ),
                                                                          unselectedWidgetColor:
                                                                              Color(0xFFF5F5F5),
                                                                        ),
                                                                        child:
                                                                            Checkbox(
                                                                          value: checkboxValue ??=
                                                                              true,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            setState(() =>
                                                                                checkboxValue = newValue!);
                                                                            if (newValue!) {
                                                                              logFirebaseEvent('LOGIN_Checkbox_aco6hpkq_ON_TOGGLE_ON');
                                                                              logFirebaseEvent('Checkbox_update_local_state');
                                                                              setState(() {
                                                                                FFAppState().rememberedUser = emailAddressController!.text;
                                                                                FFAppState().rememberedPass = passwordController!.text;
                                                                              });
                                                                              if (FFAppState().useBio == null) {
                                                                                logFirebaseEvent('Checkbox_alert_dialog');
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Biometric Login'),
                                                                                          content: Text('Use Biometric Login In Future?'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('No'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('Yes'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (confirmDialogResponse) {
                                                                                  logFirebaseEvent('Checkbox_update_local_state');
                                                                                  setState(() {
                                                                                    FFAppState().useBio = true;
                                                                                  });
                                                                                } else {
                                                                                  logFirebaseEvent('Checkbox_update_local_state');
                                                                                  setState(() {
                                                                                    FFAppState().useBio = false;
                                                                                  });
                                                                                }
                                                                              }
                                                                            } else {
                                                                              logFirebaseEvent('LOGIN_Checkbox_aco6hpkq_ON_TOGGLE_OFF');
                                                                              logFirebaseEvent('Checkbox_update_local_state');
                                                                              setState(() {
                                                                                FFAppState().deleteRememberedPass();
                                                                                FFAppState().rememberedPass = '';

                                                                                FFAppState().deleteRememberedUser();
                                                                                FFAppState().rememberedUser = '';
                                                                              });
                                                                            }
                                                                          },
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          checkColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              12,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Remember me',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          16,
                                                                          24,
                                                                          0),
                                                                  child: Wrap(
                                                                    spacing: 24,
                                                                    runSpacing:
                                                                        8,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .center,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'Button-ForgotPassword pressed ...');
                                                                        },
                                                                        text:
                                                                            'Forgot Password?',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              140,
                                                                          height:
                                                                              40,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 12,
                                                                              ),
                                                                          elevation:
                                                                              0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LOGIN_PAGE_PAGE_Button-Login_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button-Login_widget_animation');
                                                                          if (animationsMap['containerOnActionTriggerAnimation1'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation1']!.controller.forward(from: 0.0);
                                                                          }
                                                                          logFirebaseEvent(
                                                                              'Button-Login_widget_animation');
                                                                          if (animationsMap['containerOnActionTriggerAnimation2'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation2']!.controller.forward(from: 0.0);
                                                                          }
                                                                          logFirebaseEvent(
                                                                              'Button-Login_widget_animation');
                                                                          if (animationsMap['containerOnActionTriggerAnimation3'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation3']!.controller.forward(from: 0.0);
                                                                          }
                                                                          logFirebaseEvent(
                                                                              'Button-Login_widget_animation');
                                                                          if (animationsMap['tabBarOnActionTriggerAnimation'] !=
                                                                              null) {
                                                                            animationsMap['tabBarOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                          }
                                                                          logFirebaseEvent(
                                                                              'Button-Login_auth');
                                                                          GoRouter.of(context)
                                                                              .prepareAuthEvent();

                                                                          final user =
                                                                              await signInWithEmail(
                                                                            context,
                                                                            emailAddressController!.text,
                                                                            passwordController!.text,
                                                                          );
                                                                          if (user ==
                                                                              null) {
                                                                            return;
                                                                          }

                                                                          logFirebaseEvent(
                                                                              'Button-Login_navigate_to');
                                                                          if (Navigator.of(context)
                                                                              .canPop()) {
                                                                            context.pop();
                                                                          }
                                                                          context
                                                                              .pushNamedAuth(
                                                                            'redirect',
                                                                            mounted,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        text:
                                                                            'Sign In',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              130,
                                                                          height:
                                                                              50,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryColor,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                          elevation:
                                                                              3,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(60),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            12,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Or use a social account to login',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText2,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          borderRadius:
                                                                              12,
                                                                          borderWidth:
                                                                              1,
                                                                          buttonSize:
                                                                              44,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.google,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                16,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('LOGIN_PAGE_PAGE_google_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_auth');
                                                                            GoRouter.of(context).prepareAuthEvent();
                                                                            final user =
                                                                                await signInWithGoogle(context);
                                                                            if (user ==
                                                                                null) {
                                                                              return;
                                                                            }
                                                                            if (loggedIn ==
                                                                                true) {
                                                                              logFirebaseEvent('IconButton_navigate_to');

                                                                              context.pushNamedAuth('redirect', mounted);
                                                                            } else {
                                                                              logFirebaseEvent('IconButton_show_snack_bar');
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Google Login Error',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: Color(0x00000000),
                                                                                ),
                                                                              );
                                                                              return;
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          borderRadius:
                                                                              12,
                                                                          borderWidth:
                                                                              1,
                                                                          buttonSize:
                                                                              44,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.apple,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                16,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('LOGIN_PAGE_PAGE_apple_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_auth');
                                                                            GoRouter.of(context).prepareAuthEvent();
                                                                            final user =
                                                                                await signInWithApple(context);
                                                                            if (user ==
                                                                                null) {
                                                                              return;
                                                                            }

                                                                            context.goNamedAuth('redirect',
                                                                                mounted);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          20,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        displayNameController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Your name',
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      hintText:
                                                                          'Enter your name...',
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              24,
                                                                              20,
                                                                              24),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                    maxLines:
                                                                        null,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          20,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        emailAddressCreateController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Email Address',
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      hintText:
                                                                          'Enter your email...',
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              24,
                                                                              20,
                                                                              24),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                    maxLines:
                                                                        null,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          12,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        passwordCreateController,
                                                                    obscureText:
                                                                        !passwordCreateVisibility,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Password',
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      hintText:
                                                                          'Enter your password...',
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              24,
                                                                              20,
                                                                              24),
                                                                      suffixIcon:
                                                                          InkWell(
                                                                        onTap: () =>
                                                                            setState(
                                                                          () => passwordCreateVisibility =
                                                                              !passwordCreateVisibility,
                                                                        ),
                                                                        focusNode:
                                                                            FocusNode(skipTraversal: true),
                                                                        child:
                                                                            Icon(
                                                                          passwordCreateVisibility
                                                                              ? Icons.visibility_outlined
                                                                              : Icons.visibility_off_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          12,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        passwordCreateConfirmController,
                                                                    obscureText:
                                                                        !passwordCreateConfirmVisibility,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Confirm Password',
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      hintText:
                                                                          'Enter your password again...',
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              24,
                                                                              20,
                                                                              24),
                                                                      suffixIcon:
                                                                          InkWell(
                                                                        onTap: () =>
                                                                            setState(
                                                                          () => passwordCreateConfirmVisibility =
                                                                              !passwordCreateConfirmVisibility,
                                                                        ),
                                                                        focusNode:
                                                                            FocusNode(skipTraversal: true),
                                                                        child:
                                                                            Icon(
                                                                          passwordCreateConfirmVisibility
                                                                              ? Icons.visibility_outlined
                                                                              : Icons.visibility_off_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          16,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LOGIN_PAGE_PAGE_Button-Login_ON_TAP');
                                                                      Function()
                                                                          _navigate =
                                                                          () {};
                                                                      logFirebaseEvent(
                                                                          'Button-Login_auth');
                                                                      GoRouter.of(
                                                                              context)
                                                                          .prepareAuthEvent();
                                                                      if (passwordCreateController
                                                                              ?.text !=
                                                                          passwordCreateConfirmController
                                                                              ?.text) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Passwords don\'t match!',
                                                                            ),
                                                                          ),
                                                                        );
                                                                        return;
                                                                      }

                                                                      final user =
                                                                          await createAccountWithEmail(
                                                                        context,
                                                                        displayNameController!
                                                                            .text,
                                                                        passwordCreateController!
                                                                            .text,
                                                                      );
                                                                      if (user ==
                                                                          null) {
                                                                        return;
                                                                      }

                                                                      final usersCreateData =
                                                                          createUsersRecordData(
                                                                        email: displayNameController!
                                                                            .text,
                                                                        createdTime:
                                                                            getCurrentTimestamp,
                                                                        displayName:
                                                                            displayNameController!.text,
                                                                      );
                                                                      await UsersRecord
                                                                          .collection
                                                                          .doc(user
                                                                              .uid)
                                                                          .update(
                                                                              usersCreateData);

                                                                      _navigate = () => context.goNamedAuth(
                                                                          'redirect',
                                                                          mounted);
                                                                      logFirebaseEvent(
                                                                          'Button-Login_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Biometric Login'),
                                                                                content: Text('Use Biometric Login In Future?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('No'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Yes'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        logFirebaseEvent(
                                                                            'Button-Login_update_local_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().useBio =
                                                                              true;
                                                                        });
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button-Login_update_local_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().useBio =
                                                                              false;
                                                                        });
                                                                      }

                                                                      _navigate();
                                                                    },
                                                                    text:
                                                                        'Create Account',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          190,
                                                                      height:
                                                                          50,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                          ),
                                                                      elevation:
                                                                          3,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'tabBarOnActionTriggerAnimation']!,
                                              ),
                                            ),
                                          ],
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
        ));
  }
}
