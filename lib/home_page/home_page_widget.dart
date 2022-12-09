import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/p_o_s_t_insulin_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 200.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 200.ms,
          duration: 300.ms,
          begin: Offset(0, 68),
          end: Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 200.ms,
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
  };
  ApiCallResponse? apiResultTap;
  ApiCallResponse? apiResultzmp;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_PAGE_LOAD');
      logFirebaseEvent('HomePage_backend_call');
      apiResultzmp = await GetBloodGlucoseCall.call(
        apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
        nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
        token: valueOrDefault(currentUserDocument?.token, ''),
      );
      if ((apiResultzmp?.succeeded ?? true)) {
        logFirebaseEvent('HomePage_backend_call');

        final usersUpdateData = createUsersRecordData(
          data: createDataStruct(
            fieldValues: {
              'date': GetBloodGlucoseCall.date(
                (apiResultzmp?.jsonBody ?? ''),
              ),
              'dateString': (GetBloodGlucoseCall.dateString(
                (apiResultzmp?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList(),
              'mmol': functions.stringListToDoubleList(functions
                  .sgvToMmolList(GetBloodGlucoseCall.sgv(
                    (apiResultzmp?.jsonBody ?? ''),
                  ).toList())
                  .toList()),
            },
            clearUnsetFields: true,
          ),
        );
        await currentUserReference!.update(usersUpdateData);
      } else {
        logFirebaseEvent('HomePage_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error getting Nightscout data',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
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
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -0.4),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Text(
                        'Please set your Nightscout details up in Settings',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          () {
                            if (functions.mmolListToLatestMmolFirebase(
                                    currentUserDocument!.data.mmol
                                        ?.toList()
                                        ?.toList()) <
                                3.9) {
                              return FlutterFlowTheme.of(context).tertiaryColor;
                            } else if (functions.mmolListToLatestMmolFirebase(
                                    currentUserDocument!.data.mmol
                                        ?.toList()
                                        ?.toList()) >
                                9.4) {
                              return FlutterFlowTheme.of(context)
                                  .secondaryColor;
                            } else {
                              return FlutterFlowTheme.of(context).primaryColor;
                            }
                          }(),
                          FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_PAGE_Container_k2453dfy_ON_TAP');
                                logFirebaseEvent('Container_backend_call');
                                apiResultTap = await GetBloodGlucoseCall.call(
                                  apiKey: valueOrDefault(
                                      currentUserDocument?.apiKey, ''),
                                  nightscout: valueOrDefault(
                                      currentUserDocument?.nightscout, ''),
                                  token: valueOrDefault(
                                      currentUserDocument?.token, ''),
                                );
                                if ((apiResultTap?.succeeded ?? true)) {
                                  logFirebaseEvent('Container_backend_call');

                                  final usersUpdateData = createUsersRecordData(
                                    data: createDataStruct(
                                      fieldValues: {
                                        'date': GetBloodGlucoseCall.date(
                                          (apiResultzmp?.jsonBody ?? ''),
                                        ),
                                        'dateString':
                                            (GetBloodGlucoseCall.dateString(
                                          (apiResultzmp?.jsonBody ?? ''),
                                        ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList(),
                                        'mmol': functions
                                            .stringListToDoubleList(functions
                                                .sgvToMmolList(
                                                    GetBloodGlucoseCall.sgv(
                                                  (apiResultzmp?.jsonBody ??
                                                      ''),
                                                ).toList())
                                                .toList()),
                                      },
                                      clearUnsetFields: true,
                                    ),
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                } else {
                                  logFirebaseEvent('Container_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Error getting Nightscout data',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );
                                }

                                setState(() {});
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      () {
                                        if (functions
                                                .mmolListToLatestMmolFirebase(
                                                    currentUserDocument!
                                                        .data.mmol
                                                        ?.toList()
                                                        ?.toList()) <
                                            3.9) {
                                          return FlutterFlowTheme.of(context)
                                              .tertiaryColor;
                                        } else if (functions
                                                .mmolListToLatestMmolFirebase(
                                                    currentUserDocument!
                                                        .data.mmol
                                                        ?.toList()
                                                        ?.toList()) >
                                            9.4) {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryColor;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primaryColor;
                                        }
                                      }(),
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 16,
                                        color: Color(0x7F202529),
                                        offset: Offset(2, 4),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ClipRect(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 4,
                                  sigmaY: 4,
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: FlutterFlowLineChart(
                                    data: [
                                      FFLineChartData(
                                        xData: currentUserDocument!.data.date!
                                            .toList(),
                                        yData: currentUserDocument!.data.mmol!
                                            .toList(),
                                        settings: LineChartBarData(
                                          color: Color(0x7FFFFFFF),
                                          barWidth: 6,
                                          isCurved: true,
                                        ),
                                      )
                                    ],
                                    chartStylingInfo: ChartStylingInfo(
                                      enableTooltip: true,
                                      tooltipBackgroundColor:
                                          FlutterFlowTheme.of(context).gray600,
                                      backgroundColor: Color(0x00FFFFFF),
                                      showBorder: false,
                                    ),
                                    axisBounds: AxisBounds(
                                      maxY: 18,
                                    ),
                                    xAxisLabelInfo: AxisLabelInfo(),
                                    yAxisLabelInfo: AxisLabelInfo(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: currentUserDocument!.data.date!
                                        .toList(),
                                    yData: currentUserDocument!.data.mmol!
                                        .toList(),
                                    settings: LineChartBarData(
                                      color: Color(0x7FFFFFFF),
                                      barWidth: 3,
                                      isCurved: true,
                                    ),
                                  )
                                ],
                                chartStylingInfo: ChartStylingInfo(
                                  enableTooltip: true,
                                  tooltipBackgroundColor:
                                      FlutterFlowTheme.of(context).gray600,
                                  backgroundColor: Color(0x00FFFFFF),
                                  showBorder: false,
                                ),
                                axisBounds: AxisBounds(
                                  maxY: 18,
                                ),
                                xAxisLabelInfo: AxisLabelInfo(),
                                yAxisLabelInfo: AxisLabelInfo(),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, -0.5),
                              child: CircularPercentIndicator(
                                percent: functions.sgvToProgressInd(
                                    functions.mmolListToLatestMmolFirebase(
                                        currentUserDocument!.data.mmol
                                            ?.toList()
                                            ?.toList())),
                                radius:
                                    MediaQuery.of(context).size.width * 0.375,
                                lineWidth: 40,
                                animation: true,
                                progressColor: valueOrDefault<Color>(
                                  () {
                                    if (functions.mmolListToLatestMmolFirebase(
                                            currentUserDocument!.data.mmol
                                                ?.toList()
                                                ?.toList()) <
                                        3.9) {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryColor;
                                    } else if (functions
                                            .mmolListToLatestMmolFirebase(
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
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                backgroundColor: Color(0x40FFFFFF),
                                center: Text(
                                  functions
                                      .mmolListToLatestMmolFirebase(
                                          currentUserDocument!.data.mmol
                                              ?.toList()
                                              ?.toList())
                                      .toString()
                                      .maybeHandleOverflow(
                                        maxChars: 20,
                                        replacement: '…',
                                      ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 90,
                                      ),
                                ),
                                startAngle: 0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0.1),
                              child: Text(
                                'as of ${functions.minutesAgo(currentUserDocument!.data.dateString?.toList()?.toList())}',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional(0, 1),
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
                              height: 60,
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
                                    } else if (functions
                                            .mmolListToLatestMmolFirebase(
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
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      icon: Icon(
                                        Icons.settings_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HOME_settings_rounded_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_navigate_to');

                                        context.pushNamed('Settings');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      icon: Icon(
                                        Icons.home_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_PAGE_home_rounded_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_navigate_to');

                                        context.pushNamed('HomePage');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: AuthUserStreamWidget(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20,
                                          borderWidth: 1,
                                          buttonSize: 50,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          icon: Icon(
                                            Icons.local_dining_rounded,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (functions
                                                        .mmolListToLatestMmolFirebase(
                                                            currentUserDocument!
                                                                .data.mmol
                                                                ?.toList()
                                                                ?.toList()) <
                                                    3.9) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor;
                                                } else if (functions
                                                        .mmolListToLatestMmolFirebase(
                                                            currentUserDocument!
                                                                .data.mmol
                                                                ?.toList()
                                                                ?.toList()) >
                                                    9.4) {
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
                                            size: 25,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_AddCarbsButton_ON_TAP');
                                            logFirebaseEvent(
                                                'AddCarbsButton_navigate_to');

                                            context.pushNamed('Carbs');
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconButtonOnActionTriggerAnimation1']!,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: AuthUserStreamWidget(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20,
                                          borderWidth: 1,
                                          buttonSize: 50,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          icon: Icon(
                                            Icons.timelapse,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (functions
                                                        .mmolListToLatestMmolFirebase(
                                                            currentUserDocument!
                                                                .data.mmol
                                                                ?.toList()
                                                                ?.toList()) <
                                                    3.9) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor;
                                                } else if (functions
                                                        .mmolListToLatestMmolFirebase(
                                                            currentUserDocument!
                                                                .data.mmol
                                                                ?.toList()
                                                                ?.toList()) >
                                                    9.4) {
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
                                            size: 25,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_AddOptiButton_ON_TAP');
                                            logFirebaseEvent(
                                                'AddOptiButton_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: POSTInsulinWidget(
                                                    insulinType: 'Optisulin',
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: AuthUserStreamWidget(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20,
                                          borderWidth: 1,
                                          buttonSize: 50,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          icon: Icon(
                                            Icons.speed_rounded,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (functions
                                                        .mmolListToLatestMmolFirebase(
                                                            currentUserDocument!
                                                                .data.mmol
                                                                ?.toList()
                                                                ?.toList()) <
                                                    3.9) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor;
                                                } else if (functions
                                                        .mmolListToLatestMmolFirebase(
                                                            currentUserDocument!
                                                                .data.mmol
                                                                ?.toList()
                                                                ?.toList()) >
                                                    9.4) {
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
                                            size: 25,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_AddNovoButton_ON_TAP');
                                            logFirebaseEvent(
                                                'AddNovoButton_bottom_sheet');
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: POSTInsulinWidget(
                                                    insulinType: 'NovoRapid',
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
                                    ),
                                    if (FFAppState().FABOpen)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: AuthUserStreamWidget(
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 25,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_PAGE_FABMinus_ON_TAP');
                                              logFirebaseEvent(
                                                  'FABMinus_widget_animation');
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
                                              logFirebaseEvent(
                                                  'FABMinus_widget_animation');
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
                                              logFirebaseEvent(
                                                  'FABMinus_widget_animation');
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
                                              logFirebaseEvent(
                                                  'FABMinus_update_local_state');
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    if (!FFAppState().FABOpen)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 24),
                                        child: AuthUserStreamWidget(
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 25,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            icon: Icon(
                                              Icons.add,
                                              color: valueOrDefault<Color>(
                                                () {
                                                  if (functions
                                                          .mmolListToLatestMmolFirebase(
                                                              currentUserDocument!
                                                                  .data.mmol
                                                                  ?.toList()
                                                                  ?.toList()) <
                                                      3.9) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor;
                                                  } else if (functions
                                                          .mmolListToLatestMmolFirebase(
                                                              currentUserDocument!
                                                                  .data.mmol
                                                                  ?.toList()
                                                                  ?.toList()) >
                                                      9.4) {
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
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_PAGE_FABPlus_ON_TAP');
                                              logFirebaseEvent(
                                                  'FABPlus_widget_animation');
                                              if (animationsMap[
                                                      'iconButtonOnActionTriggerAnimation3'] !=
                                                  null) {
                                                animationsMap[
                                                        'iconButtonOnActionTriggerAnimation3']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              logFirebaseEvent(
                                                  'FABPlus_widget_animation');
                                              if (animationsMap[
                                                      'iconButtonOnActionTriggerAnimation2'] !=
                                                  null) {
                                                animationsMap[
                                                        'iconButtonOnActionTriggerAnimation2']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              logFirebaseEvent(
                                                  'FABPlus_widget_animation');
                                              if (animationsMap[
                                                      'iconButtonOnActionTriggerAnimation1'] !=
                                                  null) {
                                                animationsMap[
                                                        'iconButtonOnActionTriggerAnimation1']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              logFirebaseEvent(
                                                  'FABPlus_update_local_state');
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
