import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'main_t_v_model.dart';
export 'main_t_v_model.dart';

class MainTVWidget extends StatefulWidget {
  const MainTVWidget({Key? key}) : super(key: key);

  @override
  _MainTVWidgetState createState() => _MainTVWidgetState();
}

class _MainTVWidgetState extends State<MainTVWidget>
    with TickerProviderStateMixin {
  late MainTVModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -54.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainTVModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MainTV'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => FutureBuilder<ApiCallResponse>(
        future: GetBloodGlucoseCall.call(
          apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
          nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
          token: valueOrDefault(currentUserDocument?.token, ''),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
              body: Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: SpinKitRipple(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 40.0,
                  ),
                ),
              ),
            );
          }
          final mainTVGetBloodGlucoseResponse = snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  () {
                    if (GetBloodGlucoseCall.singleSgv(
                          mainTVGetBloodGlucoseResponse.jsonBody,
                        ) <
                        70) {
                      return FlutterFlowTheme.of(context).tertiary;
                    } else if (GetBloodGlucoseCall.singleSgv(
                          mainTVGetBloodGlucoseResponse.jsonBody,
                        ) >
                        169) {
                      return FlutterFlowTheme.of(context).secondary;
                    } else {
                      return FlutterFlowTheme.of(context).primary;
                    }
                  }(),
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (valueOrDefault<bool>(
                      valueOrDefault(currentUserDocument?.units, '') ==
                          'mmol/L',
                      true,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: CircularPercentIndicator(
                          percent: () {
                            if (GetBloodGlucoseCall.singleSgv(
                                  mainTVGetBloodGlucoseResponse.jsonBody,
                                ) ==
                                null) {
                              return 0.1;
                            } else if (GetBloodGlucoseCall.singleSgv(
                                  mainTVGetBloodGlucoseResponse.jsonBody,
                                ) <
                                70) {
                              return 0.1;
                            } else if (GetBloodGlucoseCall.singleSgv(
                                  mainTVGetBloodGlucoseResponse.jsonBody,
                                ) >
                                169) {
                              return 1.0;
                            } else {
                              return ((GetBloodGlucoseCall.singleSgv(
                                        mainTVGetBloodGlucoseResponse.jsonBody,
                                      ) -
                                      70) /
                                  (169 - 70));
                            }
                          }(),
                          radius: MediaQuery.sizeOf(context).width * 0.375,
                          lineWidth: 100.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: Color(0x80001219),
                          backgroundColor: valueOrDefault<Color>(
                            () {
                              if (GetBloodGlucoseCall.singleSgv(
                                    mainTVGetBloodGlucoseResponse.jsonBody,
                                  ) <
                                  70) {
                                return FlutterFlowTheme.of(context).secondary;
                              } else if (GetBloodGlucoseCall.singleSgv(
                                    mainTVGetBloodGlucoseResponse.jsonBody,
                                  ) >
                                  169) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryBackground;
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          startAngle: 0.0,
                        ).animateOnPageLoad(
                            animationsMap['progressBarOnPageLoadAnimation']!),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: formatNumber(
                                        GetBloodGlucoseCall.singleSgv(
                                              mainTVGetBloodGlucoseResponse
                                                  .jsonBody,
                                            ) /
                                            18.0,
                                        formatType: FormatType.custom,
                                        format: '#0.0',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 300.0,
                                          ),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault(currentUserDocument?.units, ''),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 45.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Text(
                              'as of ${functions.minutesAgo(getJsonField(
                                mainTVGetBloodGlucoseResponse.jsonBody,
                                r'''$.singleDateInt''',
                              ))}',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 45.0,
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
            ),
          );
        },
      ),
    );
  }
}
