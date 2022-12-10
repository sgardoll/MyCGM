import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    Key? key,
    this.mmolList,
    this.latestMmol,
    this.dateStringList,
  }) : super(key: key);

  final List<double>? mmolList;
  final double? latestMmol;
  final List<String>? dateStringList;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'flippableCardOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: Offset(0, -100),
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Main'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Main',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      () {
                        if (FFAppState().latestMmol < 3.9) {
                          return FlutterFlowTheme.of(context).tertiaryColor;
                        } else if (FFAppState().latestMmol > 9.4) {
                          return FlutterFlowTheme.of(context).secondaryColor;
                        } else {
                          return FlutterFlowTheme.of(context).primaryColor;
                        }
                      }(),
                      FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Material(
                        color: Colors.transparent,
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(75),
                            bottomRight: Radius.circular(75),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              () {
                                if (FFAppState().latestMmol < 3.9) {
                                  return FlutterFlowTheme.of(context)
                                      .tertiaryColor;
                                } else if (FFAppState().latestMmol > 9.4) {
                                  return FlutterFlowTheme.of(context)
                                      .secondaryColor;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryColor;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 16,
                                color: Color(0x7F202529),
                                offset: Offset(2, 4),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(75),
                              bottomRight: Radius.circular(75),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: AuthUserStreamWidget(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: FlutterFlowLineChart(
                                      data: [
                                        FFLineChartData(
                                          xData: currentUserDocument!.data.date!
                                              .toList(),
                                          yData: currentUserDocument!.data.mmol!
                                              .toList()
                                              .map((e) => formatNumber(
                                                    e,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '#0.0',
                                                    locale: '',
                                                  ))
                                              .toList(),
                                          settings: LineChartBarData(
                                            color: Color(0x7FFFFFFF),
                                            barWidth: 5,
                                            isCurved: true,
                                          ),
                                        )
                                      ],
                                      chartStylingInfo: ChartStylingInfo(
                                        enableTooltip: true,
                                        tooltipBackgroundColor:
                                            Color(0x801E2429),
                                        backgroundColor: Colors.transparent,
                                        showBorder: false,
                                      ),
                                      axisBounds: AxisBounds(
                                        maxY: 18,
                                      ),
                                      xAxisLabelInfo: AxisLabelInfo(),
                                      yAxisLabelInfo: AxisLabelInfo(
                                        showLabels: true,
                                        labelTextStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0x7CFFFFFF),
                                          fontSize: 10,
                                        ),
                                        labelInterval: 5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AuthUserStreamWidget(
                                child: CircularPercentIndicator(
                                  percent: functions.sgvToProgressInd(
                                      functions.mmolListToLatestMmolFirebase(
                                          currentUserDocument!.data.mmol
                                              ?.toList()
                                              ?.toList()))!,
                                  radius:
                                      MediaQuery.of(context).size.width * 0.375,
                                  lineWidth: 40,
                                  animation: true,
                                  progressColor: valueOrDefault<Color>(
                                    () {
                                      if (functions
                                              .mmolListToLatestMmolFirebase(
                                                  currentUserDocument!.data.mmol
                                                      ?.toList()
                                                      ?.toList())! <
                                          3.9) {
                                        return FlutterFlowTheme.of(context)
                                            .secondaryColor;
                                      } else if (functions
                                              .mmolListToLatestMmolFirebase(
                                                  currentUserDocument!.data.mmol
                                                      ?.toList()
                                                      ?.toList())! >
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
                                    formatNumber(
                                      FFAppState().latestMmol,
                                      formatType: FormatType.custom,
                                      format: '#0.0',
                                      locale: '',
                                    ).maybeHandleOverflow(
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
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: Text(
                                    'as of ${functions.minutesAgo(FFAppState().latestDateList.toList())}',
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      back: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'Back',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['flippableCardOnPageLoadAnimation']!),
                    custom_widgets.CurvedNavigationBarWidget(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: Colors.transparent,
                      buttonBackgroundColor: valueOrDefault<Color>(
                        () {
                          if (FFAppState().latestMmol < 3.9) {
                            return FlutterFlowTheme.of(context).tertiaryColor;
                          } else if (FFAppState().latestMmol > 9.4) {
                            return FlutterFlowTheme.of(context).secondaryColor;
                          } else {
                            return FlutterFlowTheme.of(context).primaryColor;
                          }
                        }(),
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      index: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
