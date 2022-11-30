import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/p_o_s_t_insulin_widget.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  ApiCallResponse? apiResultOnPress;
  ApiCallResponse? apiResultzmp;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_PAGE_LOAD');
      logFirebaseEvent('HomePage_update_local_state');
      setState(() =>
          FFAppState().token = valueOrDefault(currentUserDocument?.token, ''));
      logFirebaseEvent('HomePage_update_local_state');
      setState(() => FFAppState().apikey =
          valueOrDefault(currentUserDocument?.apiKey, ''));
      logFirebaseEvent('HomePage_update_local_state');
      setState(() => FFAppState().nightscout =
          valueOrDefault(currentUserDocument?.nightscout, ''));
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
        logFirebaseEvent('HomePage_update_local_state');
        setState(() => FFAppState().mmol =
            functions.mmolListToLatestMmolFirebase(
                currentUserDocument!.data.mmol?.toList()?.toList()));
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
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
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: SpinKitRipple(
                                color:
                                    FlutterFlowTheme.of(context).blueSapphire,
                                size: 25,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> bGContainerUsersRecordList =
                            snapshot.data!;
                        final bGContainerUsersRecord =
                            bGContainerUsersRecordList.isNotEmpty
                                ? bGContainerUsersRecordList.first
                                : null;
                        return Container(
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
                                  return FlutterFlowTheme.of(context)
                                      .tertiaryColor;
                                } else if (functions
                                        .mmolListToLatestMmolFirebase(
                                            currentUserDocument!.data.mmol
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
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: Stack(
                              children: [
                                Material(
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
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
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
                                ClipRect(
                                  child: ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                      sigmaX: 4,
                                      sigmaY: 4,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 60, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: FlutterFlowLineChart(
                                          data: [
                                            FFLineChartData(
                                              xData: bGContainerUsersRecord!
                                                  .data.date!
                                                  .toList(),
                                              yData: bGContainerUsersRecord!
                                                  .data.mmol!
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
                                                FlutterFlowTheme.of(context)
                                                    .gray600,
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 60, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: FlutterFlowLineChart(
                                      data: [
                                        FFLineChartData(
                                          xData: bGContainerUsersRecord!
                                              .data.date!
                                              .toList(),
                                          yData: bGContainerUsersRecord!
                                              .data.mmol!
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
                                            FlutterFlowTheme.of(context)
                                                .gray600,
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
                                Align(
                                  alignment: AlignmentDirectional(0, -0.5),
                                  child: InkWell(
                                    onLongPress: () async {
                                      logFirebaseEvent(
                                          'HOME_ProgressBar_sl699txg_ON_LONG_PRESS');
                                      logFirebaseEvent(
                                          'ProgressBar_backend_call');
                                      apiResultOnPress =
                                          await GetBloodGlucoseCall.call(
                                        apiKey: valueOrDefault(
                                            currentUserDocument?.apiKey, ''),
                                        nightscout: valueOrDefault(
                                            currentUserDocument?.nightscout,
                                            ''),
                                        token: valueOrDefault(
                                            currentUserDocument?.token, ''),
                                      );
                                      if ((apiResultOnPress?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'ProgressBar_backend_call');

                                        final usersUpdateData =
                                            createUsersRecordData(
                                          data: createDataStruct(
                                            fieldValues: {
                                              'date': GetBloodGlucoseCall.date(
                                                (apiResultzmp?.jsonBody ?? ''),
                                              ),
                                              'dateString': (GetBloodGlucoseCall
                                                      .dateString(
                                                (apiResultzmp?.jsonBody ?? ''),
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList(),
                                              'mmol': functions
                                                  .stringListToDoubleList(
                                                      functions
                                                          .sgvToMmolList(
                                                              GetBloodGlucoseCall
                                                                  .sgv(
                                                            (apiResultzmp
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toList())
                                                          .toList()),
                                            },
                                            clearUnsetFields: true,
                                          ),
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        logFirebaseEvent(
                                            'ProgressBar_update_local_state');
                                        setState(() => FFAppState().mmol =
                                            functions
                                                .mmolListToLatestMmolFirebase(
                                                    currentUserDocument!
                                                        .data.mmol
                                                        ?.toList()
                                                        ?.toList()));
                                      }
                                      logFirebaseEvent(
                                          'ProgressBar_navigate_to');

                                      context.goNamed(
                                        'HomePage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );

                                      setState(() {});
                                    },
                                    child: CircularPercentIndicator(
                                      percent: functions.sgvToProgressInd(
                                          functions
                                              .mmolListToLatestMmolFirebase(
                                                  bGContainerUsersRecord!
                                                      .data.mmol
                                                      ?.toList()
                                                      ?.toList())),
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.375,
                                      lineWidth: 40,
                                      animation: true,
                                      progressColor: Color(0x80FFFFFF),
                                      backgroundColor: Color(0x7F202529),
                                      center: Text(
                                        functions
                                            .mmolListToLatestMmolFirebase(
                                                bGContainerUsersRecord!
                                                    .data.mmol
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 90,
                                            ),
                                      ),
                                      startAngle: 0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.1),
                                  child: Text(
                                    'as of ${functions.minutesAgo(bGContainerUsersRecord!.data.dateString?.toList()?.toList())}',
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
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, -1),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.settings,
                        color: Color(0xBEFFFFFF),
                        size: 30,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_PAGE_settings_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed('Settings');
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 24),
                      child: AuthUserStreamWidget(
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_NOVO_RAPID_BTN_ON_TAP');
                            logFirebaseEvent('Button_bottom_sheet');
                            await showModalBottomSheet(
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
                          text: 'NovoRapid',
                          icon: Icon(
                            Icons.add,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
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
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 1.4,
                                    ),
                            elevation: 8,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 84),
                      child: AuthUserStreamWidget(
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_OPTISULIN_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('Optisulin');
                          },
                          text: 'Optisulin',
                          icon: Icon(
                            Icons.add,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
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
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 1.4,
                                    ),
                            elevation: 8,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 144),
                      child: AuthUserStreamWidget(
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('HOME_PAGE_PAGE_CARBS_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('Carbs');
                          },
                          text: 'Carbs',
                          icon: Icon(
                            Icons.fastfood_outlined,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
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
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 1.4,
                                    ),
                            elevation: 8,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(100),
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
