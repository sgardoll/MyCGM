import '../auth/auth_util.dart';
import '../components/p_o_s_t_carbs_widget.dart';
import '../components/p_o_s_t_insulin_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    Key? key,
    this.apiResult,
    this.latestMmol,
    this.dateString,
    this.sgvList,
  }) : super(key: key);

  final dynamic apiResult;
  final double? latestMmol;
  final List<String>? dateString;
  final List<int>? sgvList;

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
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(75, 37.5),
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
          begin: Offset(0, 75),
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
          begin: Offset(-75, 37.5),
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().deleteFABOpen();
        FFAppState().FABOpen = false;
      });
    });

    swipeableStackController = SwipeableCardSectionController();
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
          backgroundColor: Color(0x4D005F73),
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
                ),
                Align(
                  alignment: AlignmentDirectional(0, -4),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.92,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FlutterFlowSwipeableStack(
                        topCardHeightFraction: 0.75,
                        middleCardHeightFraction: 0.5,
                        bottomCardHeightFraction: 0.75,
                        topCardWidthFraction: 1,
                        middleCardWidthFraction: 0.9,
                        bottomCardWidthFraction: 0.8,
                        onSwipeFn: (index) {},
                        onLeftSwipe: (index) {},
                        onRightSwipe: (index) {},
                        onUpSwipe: (index) {},
                        onDownSwipe: (index) {},
                        itemBuilder: (context, index) {
                          return [
                            () => Material(
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
                                    height: MediaQuery.of(context).size.height *
                                        0.75,
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
                                        FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                return functions
                                                    .quickProgressInd(
                                                        widget.latestMmol!);
                                              }
                                            }(),
                                            radius: 150,
                                            lineWidth: 40,
                                            animation: true,
                                            progressColor: Color(0x80001219),
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 90,
                                                      ),
                                            ),
                                            startAngle: 0,
                                          ),
                                          AuthUserStreamWidget(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              'as of ${functions.minutesAgo(widget.dateString?.toList())}',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                    ),
                                  ),
                                ),
                            () => Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 20,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (widget.latestMmol! < 3.9) {
                                              return Color(0xC0AE2012);
                                            } else if (widget.latestMmol! >
                                                9.4) {
                                              return Color(0xC0CA6702);
                                            } else {
                                              return Color(0xBF0A9396);
                                            }
                                          }(),
                                          Color(0xBF0A9396),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 8,
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
                                      child: ClipRect(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 2,
                                            sigmaY: 2,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                                child: FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData: widget.dateString!
                                                          .map((e) => e)
                                                          .toList(),
                                                      yData: functions
                                                          .intListToMmolDoubleList(
                                                              widget.sgvList!
                                                                  .toList()),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            Color(0x7FFFFFFF),
                                                        barWidth: 5,
                                                        isCurved: true,
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      ChartStylingInfo(
                                                    enableTooltip: true,
                                                    tooltipBackgroundColor:
                                                        Color(0x801E2429),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    showGrid: true,
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: AxisBounds(
                                                    minY: 0,
                                                    maxY: 18,
                                                  ),
                                                  xAxisLabelInfo:
                                                      AxisLabelInfo(),
                                                  yAxisLabelInfo: AxisLabelInfo(
                                                    showLabels: true,
                                                    labelTextStyle:
                                                        GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0x7CFFFFFF),
                                                      fontSize: 10,
                                                    ),
                                                    labelInterval: 5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            () => Material(
                                  color: Colors.transparent,
                                  elevation: 10,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.75,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        () {
                                          if (widget.latestMmol! < 3.9) {
                                            return Color(0x80AE2012);
                                          } else if (widget.latestMmol! > 9.4) {
                                            return Color(0x80CA6702);
                                          } else {
                                            return Color(0x820A9396);
                                          }
                                        }(),
                                        Color(0x800A9396),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0x4D202529),
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
                                    child: ClipRect(
                                      child: ImageFiltered(
                                        imageFilter: ImageFilter.blur(
                                          sigmaX: 5,
                                          sigmaY: 5,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            () => Material(
                                  color: Colors.transparent,
                                  elevation: 30,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
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
                                        FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 16,
                                          color: Color(0x7F202529),
                                          offset: Offset(2, 4),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircularPercentIndicator(
                                      percent: () {
                                        if (widget.latestMmol == null) {
                                          return 0.1;
                                        } else if (widget.latestMmol! < 3.9) {
                                          return 0.1;
                                        } else if (widget.latestMmol! > 9.4) {
                                          return 1.0;
                                        } else {
                                          return functions.quickProgressInd(
                                              widget.latestMmol!);
                                        }
                                      }(),
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.125,
                                      lineWidth: 20,
                                      animation: true,
                                      progressColor: Color(0x80001219),
                                      backgroundColor: valueOrDefault<Color>(
                                        () {
                                          if (widget.latestMmol! < 3.9) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryColor;
                                          } else if (widget.latestMmol! > 9.4) {
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
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                      startAngle: 0,
                                    ),
                                  ),
                                ),
                          ][index]();
                        },
                        itemCount: 4,
                        controller: swipeableStackController,
                        enableSwipeUp: false,
                        enableSwipeDown: false,
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
                          width: 90,
                          height: 90,
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
                                      .forward()
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
                                      .forward()
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
                                      .forward()
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
                                      .forward()
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
                              size: 75,
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 15, 37.5),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 50,
                            borderWidth: 1,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
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
                              size: 30,
                            ),
                            onPressed: () async {
                              if (FFAppState().FABOpen) {
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward()
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
                                      .forward()
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
                                      .forward()
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
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse);
                                }
                                setState(() {
                                  FFAppState().FABOpen = false;
                                });
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
                              }

                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: POSTCarbsWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                          ).animateOnActionTrigger(
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation1']!,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 75),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 50,
                            borderWidth: 1,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              FFIcons.kicon,
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
                              size: 30,
                            ),
                            onPressed: () async {
                              if (FFAppState().FABOpen) {
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward()
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
                                      .forward()
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
                                      .forward()
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
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse);
                                }
                                setState(() {
                                  FFAppState().FABOpen = false;
                                });
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
                              }

                              await showModalBottomSheet(
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
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation2']!,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 37.5),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 50,
                            borderWidth: 1,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              FFIcons.k12Hour,
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
                              size: 30,
                            ),
                            onPressed: () async {
                              if (FFAppState().FABOpen) {
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward()
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
                                      .forward()
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
                                      .forward()
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
                                      .forward()
                                      .whenComplete(animationsMap[
                                              'iconButtonOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse);
                                }
                                setState(() {
                                  FFAppState().FABOpen = false;
                                });
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
                              }

                              await showModalBottomSheet(
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
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation3']!,
                          ),
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
