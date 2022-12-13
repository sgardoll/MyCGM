import '../auth/auth_util.dart';
import '../components/p_o_s_t_insulin_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
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
    this.apiResult,
    this.mmolList,
    this.latestMmol,
    this.dateString,
  }) : super(key: key);

  final dynamic apiResult;
  final List<double>? mmolList;
  final double? latestMmol;
  final List<String>? dateString;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 0.125,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(55, 0),
          end: Offset(-12.5, -22.5),
        ),
        FadeEffect(
          curve: Curves.easeIn,
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
          begin: Offset(0, 0),
          end: Offset(0, -55),
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
          begin: Offset(-55, 0),
          end: Offset(12.5, -22.5),
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
  PageController? pageViewController;
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      () {
                        if (widget.latestMmol! < 3.9) {
                          return FlutterFlowTheme.of(context).tertiaryColor;
                        } else if (widget.latestMmol! > 9.4) {
                          return FlutterFlowTheme.of(context).secondaryColor;
                        } else {
                          return FlutterFlowTheme.of(context).primaryColor;
                        }
                      }(),
                      FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
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
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.65,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              () {
                                if (widget.latestMmol! < 3.9) {
                                  return FlutterFlowTheme.of(context)
                                      .tertiaryColor;
                                } else if (widget.latestMmol! > 9.4) {
                                  return FlutterFlowTheme.of(context)
                                      .secondaryColor;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryColor;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryColor,
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
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                PageView(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CircularPercentIndicator(
                                          percent: () {
                                            if (widget.latestMmol == null) {
                                              return 0.1;
                                            } else if (widget.latestMmol! <
                                                3.9) {
                                              return 0.1;
                                            } else if (widget.latestMmol! >
                                                9.4) {
                                              return 1.0;
                                            } else {
                                              return functions.quickProgressInd(
                                                  widget.latestMmol!);
                                            }
                                          }(),
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.375,
                                          lineWidth: 40,
                                          animation: true,
                                          progressColor: Color(0x40FFFFFF),
                                          backgroundColor:
                                              valueOrDefault<Color>(
                                            () {
                                              if (widget.latestMmol! < 3.9) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryColor;
                                              } else if (widget.latestMmol! >
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
                                          center: Text(
                                            formatNumber(
                                              widget.latestMmol,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 90,
                                                ),
                                          ),
                                          startAngle: 0,
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 12, 0, 0),
                                            child: AuthUserStreamWidget(
                                              child: Text(
                                                valueOrDefault(
                                                    currentUserDocument?.units,
                                                    ''),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            'as of ${functions.minutesAgo(widget.dateString?.toList())}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: FlutterFlowLineChart(
                                        data: [
                                          FFLineChartData(
                                            xData: widget.dateString!,
                                            yData: widget.mmolList!,
                                            settings: LineChartBarData(
                                              color: Color(0x7FFFFFFF),
                                              barWidth: 5,
                                              isCurved: true,
                                            ),
                                          )
                                        ],
                                        chartStylingInfo: ChartStylingInfo(
                                          backgroundColor: Colors.transparent,
                                          showBorder: false,
                                        ),
                                        axisBounds: AxisBounds(
                                          minY: 0,
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
                                    Container(),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: pageViewController ??=
                                          PageController(initialPage: 0),
                                      count: 3,
                                      axisDirection: Axis.vertical,
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
                                        dotWidth: 16,
                                        dotHeight: 16,
                                        dotColor: Color(0x41FFFFFF),
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
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x00FFFFFF), Color(0x67001219)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: custom_widgets.CurvedNavigationBarWidget(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: Colors.transparent,
                      buttonBackgroundColor: valueOrDefault<Color>(
                        () {
                          if (widget.latestMmol! < 3.9) {
                            return FlutterFlowTheme.of(context).tertiaryColor;
                          } else if (widget.latestMmol! > 9.4) {
                            return FlutterFlowTheme.of(context).secondaryColor;
                          } else {
                            return FlutterFlowTheme.of(context).primaryColor;
                          }
                        }(),
                        FlutterFlowTheme.of(context).primaryColor,
                      ),
                      index: 1,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 24,
                                color: Color(0x40000000),
                                offset: Offset(0, 2),
                                spreadRadius: 12,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () async {
                              if (FFAppState().FABOpen) {
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0)
                                      .whenComplete(animationsMap[
                                              'iconOnActionTriggerAnimation']!
                                          .controller
                                          .reverse);
                                }
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
                                setState(() {
                                  FFAppState().FABOpen = false;
                                });
                                return;
                              } else {
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'iconButtonOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                setState(() {
                                  FFAppState().FABOpen = true;
                                });
                                return;
                              }
                            },
                            child: Icon(
                              Icons.add_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 60,
                            ),
                          ).animateOnActionTrigger(
                            animationsMap['iconOnActionTriggerAnimation']!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 45,
                          fillColor: FlutterFlowTheme.of(context).secondaryText,
                          icon: Icon(
                            Icons.local_dining_rounded,
                            color: valueOrDefault<Color>(
                              () {
                                if (widget.latestMmol! < 3.9) {
                                  return FlutterFlowTheme.of(context)
                                      .tertiaryColor;
                                } else if (widget.latestMmol! > 9.4) {
                                  return FlutterFlowTheme.of(context)
                                      .secondaryColor;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryColor;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryColor,
                            ),
                            size: 25,
                          ),
                          onPressed: () {
                            print('AddCarbsButton pressed ...');
                          },
                        ).animateOnActionTrigger(
                          animationsMap['iconButtonOnActionTriggerAnimation1']!,
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 45,
                          fillColor: FlutterFlowTheme.of(context).secondaryText,
                          icon: Icon(
                            Icons.speed_rounded,
                            color: valueOrDefault<Color>(
                              () {
                                if (widget.latestMmol! < 3.9) {
                                  return FlutterFlowTheme.of(context)
                                      .tertiaryColor;
                                } else if (widget.latestMmol! > 9.4) {
                                  return FlutterFlowTheme.of(context)
                                      .secondaryColor;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryColor;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryColor,
                            ),
                            size: 25,
                          ),
                          onPressed: () async {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: POSTInsulinWidget(
                                    insulinType: 'Novorapid',
                                    latestMmol: widget.latestMmol,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                        ).animateOnActionTrigger(
                          animationsMap['iconButtonOnActionTriggerAnimation2']!,
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 45,
                          fillColor: FlutterFlowTheme.of(context).secondaryText,
                          icon: Icon(
                            Icons.timelapse,
                            color: valueOrDefault<Color>(
                              () {
                                if (widget.latestMmol! < 3.9) {
                                  return FlutterFlowTheme.of(context)
                                      .tertiaryColor;
                                } else if (widget.latestMmol! > 9.4) {
                                  return FlutterFlowTheme.of(context)
                                      .secondaryColor;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryColor;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryColor,
                            ),
                            size: 25,
                          ),
                          onPressed: () async {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: POSTInsulinWidget(
                                    insulinType: 'Optisulin',
                                    latestMmol: widget.latestMmol,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                        ).animateOnActionTrigger(
                          animationsMap['iconButtonOnActionTriggerAnimation3']!,
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
