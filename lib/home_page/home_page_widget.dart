import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
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
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 200,
      hideBeforeAnimating: true,
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
    'progressBarOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.linear,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 0,
      hideBeforeAnimating: true,
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
    'wrapOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 150),
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
      await actions.lockOrientation();
      apiGET = await GetBloodGlucoseCall.call();
      if ((apiGET?.succeeded ?? true) == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Data refreshed successfully',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0xCC000000),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (apiGET?.statusCode ?? 200).toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 8000),
            backgroundColor: FlutterFlowTheme.of(context).rubyRed,
          ),
        );
      }

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
      if (Theme.of(context).brightness == Brightness.dark) {
        setState(() => FFAppState().background =
            functions.setBgBySgvDark(FFAppState().latestSGV));
      } else {
        setState(() => FFAppState().background =
            functions.setBgBySgvLight(FFAppState().latestSGV));
      }

      if (animationsMap['containerOnActionTriggerAnimation'] == null) {
        return;
      }
      await (animationsMap['containerOnActionTriggerAnimation']!
              .curvedAnimation
              .parent as AnimationController)
          .forward(from: 0.0);

      if (animationsMap['progressBarOnActionTriggerAnimation'] == null) {
        return;
      }
      await (animationsMap['progressBarOnActionTriggerAnimation']!
              .curvedAnimation
              .parent as AnimationController)
          .forward(from: 0.0);

      if (animationsMap['wrapOnActionTriggerAnimation'] == null) {
        return;
      }
      await (animationsMap['wrapOnActionTriggerAnimation']!
              .curvedAnimation
              .parent as AnimationController)
          .forward(from: 0.0);
    });

    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: isAndroid == true
              ? responsiveVisibility(
                  context: context,
                  desktop: false,
                )
                  ? AppBar(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      automaticallyImplyLeading: false,
                      title: Text(
                        'My CGM',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                      actions: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.refresh,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () async {
                            context.pushNamed('HomePage');
                          },
                        ),
                      ],
                      centerTitle: false,
                      elevation: 6,
                    )
                  : null
              : null,
          backgroundColor: Color(0xCBFFFFFF),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Hero(
                    tag: valueOrDefault<String>(
                      FFAppState().background,
                      'https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png',
                    ),
                    transitionOnUserGestures: true,
                    child: CachedNetworkImage(
                      imageUrl: valueOrDefault<String>(
                        FFAppState().background,
                        'https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png',
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 125, 20, 20),
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
                                          .richBlackFOGRA29,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 200,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.8,
                                  ),
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
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 0),
                                                child: AutoSizeText(
                                                  'Your blood glucose is',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: CircularPercentIndicator(
                                                percent: valueOrDefault<double>(
                                                  functions.sgvToProgressInd(
                                                      FFAppState().latestSGV),
                                                  180.0,
                                                ),
                                                radius: 45,
                                                lineWidth: 4,
                                                animation: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                backgroundColor:
                                                    Color(0x2B202529),
                                                center: Text(
                                                  functions
                                                      .sgvToDoubleMmol(
                                                          FFAppState()
                                                              .latestSGV)
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                        maxChars: 20,
                                                        replacement: '…',
                                                      ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 28,
                                                      ),
                                                ),
                                                startAngle: 1,
                                              ).animated([
                                                animationsMap[
                                                    'progressBarOnActionTriggerAnimation']!
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                functions.minutesAgo(
                                                    FFAppState().latestDate),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0x9AFFFFFF),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animated([
                                animationsMap[
                                    'containerOnActionTriggerAnimation']!
                              ]);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 100),
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('NovoRapid');
                              },
                              text: 'NovoRapid',
                              icon: Icon(
                                Icons.add_circle,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              options: FFButtonOptions(
                                width: 150,
                                height: 50,
                                color: Color(0x7FFFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('Optisulin');
                                },
                                text: 'Optisulin',
                                icon: Icon(
                                  Icons.add_circle,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 50,
                                  color: Color(0x7FFFFFFF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('Carbs');
                              },
                              text: 'Carbs',
                              icon: Icon(
                                Icons.restaurant_menu,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              options: FFButtonOptions(
                                width: 150,
                                height: 50,
                                color: Color(0x7FFFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        ).animated(
                            [animationsMap['wrapOnActionTriggerAnimation']!]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
