import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
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
    'progressBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-50, 0),
        scale: 0.7,
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
      backgroundColor: FlutterFlowTheme.of(context).richBlackFOGRA29,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            if (!(Theme.of(context).brightness == Brightness.light))
              FutureBuilder<ApiCallResponse>(
                future: GetBloodGlucoseCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                    );
                  }
                  final bGImageDarkModeGetBloodGlucoseResponse = snapshot.data!;
                  return CachedNetworkImage(
                    imageUrl: valueOrDefault<String>(
                      functions.setBgByMmol(valueOrDefault<double>(
                        functions.sgvToMmol(valueOrDefault<double>(
                          GetBloodGlucoseCall.sgv(
                            bGImageDarkModeGetBloodGlucoseResponse.jsonBody,
                          ),
                          5.0,
                        )),
                        5.0,
                      )),
                      'https://connectio.com.au/MyCGM/assets/PrimaryBGDark.png',
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    fit: BoxFit.cover,
                  ).animated([animationsMap['imageOnPageLoadAnimation1']!]);
                },
              ),
            if (Theme.of(context).brightness == Brightness.light)
              FutureBuilder<ApiCallResponse>(
                future: GetBloodGlucoseCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                    );
                  }
                  final bGImageGetBloodGlucoseResponse = snapshot.data!;
                  return CachedNetworkImage(
                    imageUrl: valueOrDefault<String>(
                      functions.setBgByMmolLight(valueOrDefault<double>(
                        GetBloodGlucoseCall.sgv(
                          bGImageGetBloodGlucoseResponse.jsonBody,
                        ),
                        5.0,
                      )),
                      'https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png',
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    fit: BoxFit.cover,
                  ).animated([animationsMap['imageOnPageLoadAnimation2']!]);
                },
              ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 200, 20, 20),
                  child: FutureBuilder<ApiCallResponse>(
                    future: GetBloodGlucoseCall.call(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                        );
                      }
                      final dashboardMainCardGetBloodGlucoseResponse =
                          snapshot.data!;
                      return Material(
                        color: Colors.transparent,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(
                                valueOrDefault<String>(
                                  functions.setColByMmol(valueOrDefault<double>(
                                    GetBloodGlucoseCall.sgv(
                                      dashboardMainCardGetBloodGlucoseResponse
                                          .jsonBody,
                                    ),
                                    5.0,
                                  )),
                                  'https://connectio.com.au/MyCGM/assets/Pri.png',
                                ),
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x23000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your blood glucose is',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (functions.showUpArrow(1.0) ==
                                              false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future:
                                                    GetBloodGlucoseCall.call(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final iconGetBloodGlucoseResponse =
                                                      snapshot.data!;
                                                  return Icon(
                                                    Icons.trending_up,
                                                    color: Color(0x9AFFFFFF),
                                                    size: 24,
                                                  );
                                                },
                                              ),
                                            ),
                                          if (functions.showDownArrow(-1.0) ==
                                              false)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future:
                                                    GetBloodGlucoseCall.call(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final iconGetBloodGlucoseResponse =
                                                      snapshot.data!;
                                                  return Icon(
                                                    Icons.trending_down,
                                                    color: Color(0x9AFFFFFF),
                                                    size: 24,
                                                  );
                                                },
                                              ),
                                            ),
                                          if (functions.showUpArrow(1.0) ==
                                              functions.showDownArrow(-1.0))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future:
                                                    GetBloodGlucoseCall.call(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final iconGetBloodGlucoseResponse =
                                                      snapshot.data!;
                                                  return Icon(
                                                    Icons.trending_flat,
                                                    color: Color(0x9AFFFFFF),
                                                    size: 24,
                                                  );
                                                },
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetBloodGlucoseCall.call(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 25,
                                                      height: 25,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final textGetBloodGlucoseResponse =
                                                    snapshot.data!;
                                                return Text(
                                                  valueOrDefault<String>(
                                                    functions.minutesAgo(
                                                        GetBloodGlucoseCall
                                                            .dateString(
                                                      textGetBloodGlucoseResponse
                                                          .jsonBody,
                                                    ).toString()),
                                                    'as of some time ago',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0x9AFFFFFF),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: GetBloodGlucoseCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                      );
                                    }
                                    final progressBarGetBloodGlucoseResponse =
                                        snapshot.data!;
                                    return CircularPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        functions.sgvToProgressInd(
                                            valueOrDefault<double>(
                                          GetBloodGlucoseCall.sgv(
                                            progressBarGetBloodGlucoseResponse
                                                .jsonBody,
                                          ),
                                          1.0,
                                        )),
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
                                          formatNumber(
                                            functions.sgvToMmol(
                                                valueOrDefault<double>(
                                              GetBloodGlucoseCall.sgv(
                                                progressBarGetBloodGlucoseResponse
                                                    .jsonBody,
                                              ),
                                              1.0,
                                            )),
                                            formatType: FormatType.custom,
                                            format: '#0.0',
                                            locale: '',
                                          ),
                                          '1.1',
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
                                    ).animated([
                                      animationsMap[
                                          'progressBarOnPageLoadAnimation']!
                                    ]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animated(
                          [animationsMap['containerOnPageLoadAnimation']!]);
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 50),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'NovoRapid',
                            icon: Icon(
                              Icons.add_circle,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 50,
                              color: Color(0x340A9396),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 6,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                          ).animated(
                              [animationsMap['buttonOnPageLoadAnimation1']!]),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Optisulin',
                            icon: Icon(
                              Icons.add_circle,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 50,
                              color: Color(0x340A9396),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 6,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                          ).animated(
                              [animationsMap['buttonOnPageLoadAnimation2']!]),
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
    );
  }
}
