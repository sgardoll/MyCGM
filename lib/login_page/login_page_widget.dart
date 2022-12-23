import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
  TextEditingController? displayNameController;
  TextEditingController? emailAddressCreateController;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  TextEditingController? passwordCreateConfirmController;
  late bool passwordCreateConfirmVisibility;
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  bool bioLoginResult = false;
  bool? checkboxValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
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
    'tabBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
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
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 200),
          end: Offset(0, 0),
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

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

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
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
                Align(
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
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      20,
                                                                      24,
                                                                      0),
                                                          child: TextFormField(
                                                            controller:
                                                                emailAddressController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Email Address',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          24,
                                                                          20,
                                                                          24),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                            maxLines: null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      24,
                                                                      24,
                                                                      12),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          12,
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
                                                                            BorderRadius.circular(60),
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
                                                                            BorderRadius.circular(60),
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
                                                                            BorderRadius.circular(60),
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
                                                                            BorderRadius.circular(60),
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
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  if (animationsMap[
                                                                          'tabBarOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    animationsMap[
                                                                            'tabBarOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation2'] !=
                                                                      null) {
                                                                    setState(() =>
                                                                        hasContainerTriggered2 =
                                                                            true);
                                                                    SchedulerBinding.instance.addPostFrameCallback((_) async => animationsMap[
                                                                            'containerOnActionTriggerAnimation2']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0));
                                                                  }
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation3'] !=
                                                                      null) {
                                                                    setState(() =>
                                                                        hasContainerTriggered3 =
                                                                            true);
                                                                    SchedulerBinding.instance.addPostFrameCallback((_) async => animationsMap[
                                                                            'containerOnActionTriggerAnimation3']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0));
                                                                  }
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation1'] !=
                                                                      null) {
                                                                    setState(() =>
                                                                        hasContainerTriggered1 =
                                                                            true);
                                                                    SchedulerBinding.instance.addPostFrameCallback((_) async => animationsMap[
                                                                            'containerOnActionTriggerAnimation1']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0));
                                                                  }
                                                                  if (animationsMap[
                                                                          'tabBarOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    animationsMap[
                                                                            'tabBarOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();

                                                                  final user =
                                                                      await signInWithEmail(
                                                                    context,
                                                                    emailAddressController!
                                                                        .text,
                                                                    passwordController!
                                                                        .text,
                                                                  );
                                                                  if (user ==
                                                                      null) {
                                                                    return;
                                                                  }

                                                                  if (loggedIn ==
                                                                      true) {
                                                                    if (FFAppState()
                                                                            .useBio !=
                                                                        null) {
                                                                      final _localAuth =
                                                                          LocalAuthentication();
                                                                      bool
                                                                          _isBiometricSupported =
                                                                          await _localAuth
                                                                              .isDeviceSupported();

                                                                      if (_isBiometricSupported) {
                                                                        bioLoginResult =
                                                                            await _localAuth.authenticate(localizedReason: 'Please login with biometrics');
                                                                        setState(
                                                                            () {});
                                                                      }

                                                                      _shouldSetState =
                                                                          true;
                                                                    } else {
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
                                                                        setState(
                                                                            () {
                                                                          FFAppState().useBio =
                                                                              true;
                                                                        });
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().useBio =
                                                                              false;
                                                                        });
                                                                      }
                                                                    }

                                                                    context
                                                                        .pushNamedAuth(
                                                                      'redirect',
                                                                      mounted,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        kTransitionInfoKey:
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                },
                                                                text: 'Sign In',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 130,
                                                                  height: 50,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                      ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      12, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    shape:
                                                                        CircleBorder(),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      Color(
                                                                          0xFFF5F5F5),
                                                                ),
                                                                child: Checkbox(
                                                                  value: checkboxValue ??= FFAppState().rememberedPass !=
                                                                              null &&
                                                                          FFAppState().rememberedPass !=
                                                                              ''
                                                                      ? true
                                                                      : false,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(() =>
                                                                        checkboxValue =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().rememberedUser =
                                                                            emailAddressController!.text;
                                                                        FFAppState().rememberedPass =
                                                                            passwordController!.text;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .deleteRememberedPass();
                                                                        FFAppState().rememberedPass =
                                                                            '';

                                                                        FFAppState()
                                                                            .deleteRememberedUser();
                                                                        FFAppState().rememberedUser =
                                                                            '';
                                                                      });
                                                                    }
                                                                  },
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  checkColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            24,
                                                                            0),
                                                                child: Text(
                                                                  'Remember me',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button-ForgotPassword pressed ...');
                                                                },
                                                                text:
                                                                    'Forgot Password?',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 140,
                                                                  height: 40,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  textStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                  elevation: 0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            12,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Or use a social account to login',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  borderRadius:
                                                                      12,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      44,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .google,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 16,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    GoRouter.of(
                                                                            context)
                                                                        .prepareAuthEvent();
                                                                    final user =
                                                                        await signInWithGoogle(
                                                                            context);
                                                                    if (user ==
                                                                        null) {
                                                                      return;
                                                                    }
                                                                    if (loggedIn ==
                                                                        true) {
                                                                      context.pushNamedAuth(
                                                                          'redirect',
                                                                          mounted);
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Google Login Error',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              Color(0x00000000),
                                                                        ),
                                                                      );
                                                                      return;
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  borderRadius:
                                                                      12,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      44,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .apple,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 16,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    GoRouter.of(
                                                                            context)
                                                                        .prepareAuthEvent();
                                                                    final user =
                                                                        await signInWithApple(
                                                                            context);
                                                                    if (user ==
                                                                        null) {
                                                                      return;
                                                                    }

                                                                    context.goNamedAuth(
                                                                        'redirect',
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      24,
                                                                      24,
                                                                      0),
                                                          child: TextFormField(
                                                            controller:
                                                                displayNameController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Your name',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              hintText:
                                                                  'Enter your name...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          24,
                                                                          20,
                                                                          24),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                            maxLines: null,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      24,
                                                                      24,
                                                                      0),
                                                          child: TextFormField(
                                                            controller:
                                                                emailAddressCreateController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Email Address',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              hintText:
                                                                  'Enter your email...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          24,
                                                                          20,
                                                                          24),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                            maxLines: null,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      24,
                                                                      24,
                                                                      0),
                                                          child: TextFormField(
                                                            controller:
                                                                passwordCreateController,
                                                            obscureText:
                                                                !passwordCreateVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Password',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              hintText:
                                                                  'Enter your password...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
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
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  passwordCreateVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      24,
                                                                      24,
                                                                      0),
                                                          child: TextFormField(
                                                            controller:
                                                                passwordCreateConfirmController,
                                                            obscureText:
                                                                !passwordCreateConfirmVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Confirm Password',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              hintText:
                                                                  'Enter your password again...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
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
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  passwordCreateConfirmVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      24, 0, 0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              if (passwordCreateController
                                                                      ?.text !=
                                                                  passwordCreateConfirmController
                                                                      ?.text) {
                                                                ScaffoldMessenger.of(
                                                                        context)
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
                                                                email:
                                                                    displayNameController!
                                                                        .text,
                                                                createdTime:
                                                                    getCurrentTimestamp,
                                                                displayName:
                                                                    displayNameController!
                                                                        .text,
                                                              );
                                                              await UsersRecord
                                                                  .collection
                                                                  .doc(user.uid)
                                                                  .update(
                                                                      usersCreateData);

                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Biometric Login'),
                                                                            content:
                                                                                Text('Use Biometric Login In Future?'),
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
                                                                setState(() {
                                                                  FFAppState()
                                                                          .useBio =
                                                                      true;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .useBio =
                                                                      false;
                                                                });
                                                              }

                                                              context
                                                                  .pushNamedAuth(
                                                                      'loginPage',
                                                                      mounted);
                                                            },
                                                            text:
                                                                'Create Account',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 190,
                                                              height: 50,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                      ),
                                                              elevation: 3,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                                      )
                                          .animateOnPageLoad(animationsMap[
                                              'tabBarOnPageLoadAnimation']!)
                                          .animateOnActionTrigger(
                                            animationsMap[
                                                'tabBarOnActionTriggerAnimation']!,
                                          ),
                                    ),
                                  ],
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 64, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (((isAndroid == true) || (isiOS == true)) &&
                              (isWeb
                                  ? MediaQuery.of(context).viewInsets.bottom > 0
                                  : _isKeyboardVisible)
                          ? false
                          : true)
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              'assets/images/Logo3.2-50Transparent.png',
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.3,
                              fit: BoxFit.contain,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation']!),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
