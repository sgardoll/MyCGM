import '../auth/auth_util.dart';
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
        FadeEffect(
          curve: Curves.easeOut,
          delay: 550.ms,
          duration: 1240.ms,
          begin: 1,
          end: 0,
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
          delay: 0.ms,
          duration: 1210.ms,
          begin: 1,
          end: 0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1210.ms,
          begin: 1,
          end: 5,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 640.ms,
          duration: 2000.ms,
          hz: 0,
          offset: Offset(100, 100),
          rotation: -6.283,
        ),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 640.ms,
          duration: 2000.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 5,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
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
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  TextEditingController? emailAddressCreateController;
  TextEditingController? passwordCreateController;

  late bool passwordCreateVisibility;
  TextEditingController? passwordCreateConfirmController;

  late bool passwordCreateConfirmVisibility;
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

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['tabBarOnPageLoadAnimation']!.controller.forward(from: 0.0);
    });

    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    emailAddressCreateController = TextEditingController();
    passwordCreateController = TextEditingController();
    passwordCreateVisibility = false;
    passwordCreateConfirmController = TextEditingController();
    passwordCreateConfirmVisibility = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    emailAddressCreateController?.dispose();
    passwordCreateController?.dispose();
    passwordCreateConfirmController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation3']!,
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
                        animationsMap['containerOnActionTriggerAnimation4']!,
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation5']!,
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

                                                                          if (animationsMap['containerOnActionTriggerAnimation1'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation1']!.controller.forward(from: 0.0);
                                                                          }
                                                                          if (animationsMap['containerOnActionTriggerAnimation2'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation2']!.controller.forward(from: 0.0);
                                                                          }
                                                                          if (animationsMap['containerOnActionTriggerAnimation3'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation3']!.controller.forward(from: 0.0);
                                                                          }
                                                                          if (animationsMap['containerOnActionTriggerAnimation4'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation4']!.controller.forward(from: 0.0);
                                                                          }
                                                                          if (animationsMap['containerOnActionTriggerAnimation5'] !=
                                                                              null) {
                                                                            animationsMap['containerOnActionTriggerAnimation5']!.controller.forward(from: 0.0);
                                                                          }
                                                                          if (animationsMap['tabBarOnActionTriggerAnimation'] !=
                                                                              null) {
                                                                            animationsMap['tabBarOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                          }

                                                                          context.goNamedAuth(
                                                                              'HomePage',
                                                                              mounted);
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
                                                                            GoRouter.of(context).prepareAuthEvent();
                                                                            final user =
                                                                                await signInWithGoogle(context);
                                                                            if (user ==
                                                                                null) {
                                                                              return;
                                                                            }

                                                                            context.goNamedAuth('HomePage',
                                                                                mounted);
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
                                                                            GoRouter.of(context).prepareAuthEvent();
                                                                            final user =
                                                                                await signInWithApple(context);
                                                                            if (user ==
                                                                                null) {
                                                                              return;
                                                                            }

                                                                            context.goNamedAuth('HomePage',
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
                                                                        email: emailAddressCreateController!
                                                                            .text,
                                                                        createdTime:
                                                                            getCurrentTimestamp,
                                                                      );
                                                                      await UsersRecord
                                                                          .collection
                                                                          .doc(user
                                                                              .uid)
                                                                          .update(
                                                                              usersCreateData);

                                                                      context.goNamedAuth(
                                                                          'HomePage',
                                                                          mounted);
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
