import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key? key,
    this.loggedInUser,
  }) : super(key: key);

  final DocumentReference? loggedInUser;

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
  final _unfocusNode = FocusNode();
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'loginPage'});
    displayNameController = TextEditingController();
    emailAddressCreateController = TextEditingController();
    passwordCreateController = TextEditingController();
    passwordCreateVisibility = false;
    passwordCreateConfirmController = TextEditingController();
    passwordCreateConfirmVisibility = false;
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
                                                      .gray600,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              indicatorWeight: 3,
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
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
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
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  emailAddressController,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Email Address',
                                                                labelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
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
                                                                  child:
                                                                      Padding(
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
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          !passwordVisibility,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Password',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).bodyText2,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodyText2,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                            width:
                                                                                2,
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
                                                                                2,
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
                                                                                2,
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
                                                                                2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(60),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            24,
                                                                            20,
                                                                            24),
                                                                        suffixIcon:
                                                                            InkWell(
                                                                          onTap: () =>
                                                                              setState(
                                                                            () =>
                                                                                passwordVisibility = !passwordVisibility,
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
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'LOGIN_PAGE_PAGE_Button-Login_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button-Login_widget_animation');
                                                                    if (animationsMap[
                                                                            'tabBarOnActionTriggerAnimation'] !=
                                                                        null) {
                                                                      animationsMap[
                                                                              'tabBarOnActionTriggerAnimation']!
                                                                          .controller
                                                                          .forward(
                                                                              from: 0.0);
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Button-Login_widget_animation');
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation2'] !=
                                                                        null) {
                                                                      setState(() =>
                                                                          hasContainerTriggered2 =
                                                                              true);
                                                                      SchedulerBinding
                                                                          .instance
                                                                          .addPostFrameCallback((_) async => animationsMap['containerOnActionTriggerAnimation2']!
                                                                              .controller
                                                                              .forward(from: 0.0));
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Button-Login_widget_animation');
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation3'] !=
                                                                        null) {
                                                                      setState(() =>
                                                                          hasContainerTriggered3 =
                                                                              true);
                                                                      SchedulerBinding
                                                                          .instance
                                                                          .addPostFrameCallback((_) async => animationsMap['containerOnActionTriggerAnimation3']!
                                                                              .controller
                                                                              .forward(from: 0.0));
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Button-Login_widget_animation');
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation1'] !=
                                                                        null) {
                                                                      setState(() =>
                                                                          hasContainerTriggered1 =
                                                                              true);
                                                                      SchedulerBinding
                                                                          .instance
                                                                          .addPostFrameCallback((_) async => animationsMap['containerOnActionTriggerAnimation1']!
                                                                              .controller
                                                                              .forward(from: 0.0));
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Button-Login_auth');
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

                                                                    context.goNamedAuth(
                                                                        'Main',
                                                                        mounted);
                                                                  },
                                                                  text:
                                                                      'Sign In',
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                        ),
                                                                    elevation:
                                                                        3,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            60),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        12,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
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
                                                                    elevation:
                                                                        3,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                    padding: EdgeInsetsDirectional
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
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .lineColor,
                                                                      borderRadius:
                                                                          12,
                                                                      borderWidth:
                                                                          2,
                                                                      buttonSize:
                                                                          44,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .google,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .gray600,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'LOGIN_PAGE_PAGE_google_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_auth');
                                                                        GoRouter.of(context)
                                                                            .prepareAuthEvent();
                                                                        final user =
                                                                            await signInWithGoogle(context);
                                                                        if (user ==
                                                                            null) {
                                                                          return;
                                                                        }

                                                                        context.goNamedAuth(
                                                                            'Main',
                                                                            mounted);
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .lineColor,
                                                                      borderRadius:
                                                                          12,
                                                                      borderWidth:
                                                                          2,
                                                                      buttonSize:
                                                                          44,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .apple,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .gray600,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'LOGIN_PAGE_PAGE_apple_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_auth');
                                                                        GoRouter.of(context)
                                                                            .prepareAuthEvent();
                                                                        final user =
                                                                            await signInWithApple(context);
                                                                        if (user ==
                                                                            null) {
                                                                          return;
                                                                        }

                                                                        context.goNamedAuth(
                                                                            'Main',
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
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
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
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                hintText:
                                                                    'Enter your name...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
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
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                hintText:
                                                                    'Enter your email...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
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
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                hintText:
                                                                    'Enter your password...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
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
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
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
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                hintText:
                                                                    'Confirm password...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lineColor,
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
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
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
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
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        24,
                                                                        0,
                                                                        0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'LOGIN_PAGE_PAGE_Button-Login_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Button-Login_auth');
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
                                                                  emailAddressCreateController!
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
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  displayName:
                                                                      displayNameController!
                                                                          .text,
                                                                );
                                                                await UsersRecord
                                                                    .collection
                                                                    .doc(user
                                                                        .uid)
                                                                    .update(
                                                                        usersCreateData);

                                                                logFirebaseEvent(
                                                                    'Button-Login_navigate_to');

                                                                context.pushNamedAuth(
                                                                    'nightscoutCheck',
                                                                    mounted);
                                                              },
                                                              text:
                                                                  'Get Started',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 190,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
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
                      if (() {
                        if ((MediaQuery.of(context).size.height > 800.0) &&
                            (isWeb
                                ? MediaQuery.of(context).viewInsets.bottom > 0
                                : _isKeyboardVisible)) {
                          return true;
                        } else if (((isAndroid == true) || (isiOS == true)) &&
                            (isWeb
                                ? MediaQuery.of(context).viewInsets.bottom > 0
                                : _isKeyboardVisible)) {
                          return false;
                        } else {
                          return true;
                        }
                      }())
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
