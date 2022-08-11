import '../backend/api_requests/api_calls.dart';
import '../components/b_g_dark_widget.dart';
import '../components/b_g_light_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? apiGET;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      apiGET = await GetBloodGlucoseCall.call();
      setState(() => FFAppState().latestSGV = valueOrDefault<int>(
            GetBloodGlucoseCall.sgv(
              (apiGET?.jsonBody ?? ''),
            ),
            160,
          ));
      setState(() => FFAppState().latestDate = valueOrDefault<String>(
            GetBloodGlucoseCall.dateString(
              (apiGET?.jsonBody ?? ''),
            ).toString(),
            'null',
          ));
      setState(() => FFAppState().latestDelta = valueOrDefault<double>(
            GetBloodGlucoseCall.delta(
              (apiGET?.jsonBody ?? ''),
            ),
            0.0,
          ));
      if (Theme.of(context).brightness == Brightness.dark) {
        setState(() => FFAppState().background =
            functions.setBgBySgvDark(FFAppState().latestSGV));
      } else {
        setState(() => FFAppState().background =
            functions.setBgBySgvLight(FFAppState().latestSGV));
      }
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My CGM',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            if (Theme.of(context).brightness == Brightness.light)
              BGLightWidget(),
            if (Theme.of(context).brightness == Brightness.dark) BGDarkWidget(),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 200, 20, 20),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x23000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: AutoSizeText(
                                        'Your blood glucose is',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: CircularPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        functions.sgvToProgressInd(
                                            FFAppState().latestSGV),
                                        1.0,
                                      ),
                                      radius: 45,
                                      lineWidth: 4,
                                      animation: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      backgroundColor: Color(0x2B202529),
                                      center: Text(
                                        valueOrDefault<String>(
                                          functions
                                              .sgvToDoubleMmol(
                                                  FFAppState().latestSGV)
                                              .toString(),
                                          '5.0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 28,
                                            ),
                                      ),
                                      startAngle: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: custom_widgets.DeltaIcon(
                                    width: 24,
                                    height: 24,
                                    latestDelta: FFAppState().latestDelta,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions
                                          .minutesAgo(valueOrDefault<String>(
                                        FFAppState().latestDate,
                                        'as of some time ago',
                                      )),
                                      'as of some time ago',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0x9AFFFFFF),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animated([animationsMap['containerOnPageLoadAnimation']!]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('NovoRapid');
                        },
                        text: 'NovoRapid',
                        icon: Icon(
                          Icons.add_circle,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 150,
                          height: 50,
                          color: Color(0x7FFFFFFF),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 2,
                          ),
                        ),
                      ).animated(
                          [animationsMap['buttonOnPageLoadAnimation1']!]),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('Optisulin');
                          },
                          text: 'Optisulin',
                          icon: Icon(
                            Icons.add_circle,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: Color(0x7FFFFFFF),
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 2,
                            ),
                          ),
                        ).animated(
                            [animationsMap['buttonOnPageLoadAnimation2']!]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
