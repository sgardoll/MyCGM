import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar1_model.dart';
export 'nav_bar1_model.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({
    Key? key,
    String? activePage,
  })  : this.activePage = activePage ?? 'Home',
        super(key: key);

  final String activePage;

  @override
  _NavBar1WidgetState createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget>
    with TickerProviderStateMixin {
  late NavBar1Model _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 100.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar1Model());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      alignment: AlignmentDirectional(0.0, 1.0),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (_model.loadingItem ?? true)
              Align(
                alignment: AlignmentDirectional(1.00, 1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 12.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1200),
                        curve: Curves.easeInOut,
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, -2.0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 6.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 6.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                _model.loadingText,
                                                'Scanning',
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(
                                          width: valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 50.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 150.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 300.0;
                                          } else {
                                            return 50.0;
                                          }
                                        }(),
                                        50.0,
                                      ))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      .animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!)
                      .animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation']!,
                      ),
                ),
              ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 12.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, -2.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 1,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        fillColor: valueOrDefault<Color>(
                          widget.activePage == 'Home'
                              ? Color(0xC1FFFFFF)
                              : Colors.transparent,
                          Colors.transparent,
                        ),
                        hoverColor: FlutterFlowTheme.of(context).primaryText,
                        hoverIconColor: valueOrDefault<Color>(
                          widget.activePage == 'Home'
                              ? FlutterFlowTheme.of(context).alternate
                              : FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        icon: Icon(
                          Icons.fastfood_rounded,
                          color: valueOrDefault<Color>(
                            widget.activePage == 'Home'
                                ? FlutterFlowTheme.of(context).secondary
                                : FlutterFlowTheme.of(context).white,
                            FlutterFlowTheme.of(context).white,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('home');
                        },
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        fillColor: valueOrDefault<Color>(
                          widget.activePage == 'Carbs'
                              ? Color(0xC1FFFFFF)
                              : Colors.transparent,
                          Colors.transparent,
                        ),
                        hoverColor: FlutterFlowTheme.of(context).primaryText,
                        hoverIconColor: valueOrDefault<Color>(
                          widget.activePage == 'Carbs'
                              ? FlutterFlowTheme.of(context).alternate
                              : FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        icon: Icon(
                          Icons.devices_fold_outlined,
                          color: valueOrDefault<Color>(
                            widget.activePage == 'Carbs'
                                ? FlutterFlowTheme.of(context).secondary
                                : FlutterFlowTheme.of(context).white,
                            FlutterFlowTheme.of(context).white,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (loggedIn) {
                            context.pushNamed('homeScanned');
                          } else {
                            context.pushNamed('loginPage');
                          }
                        },
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      FFAppState().hasCgmFeatures == true ? true : false,
                      false,
                    ))
                      Flexible(
                        flex: 1,
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          fillColor: valueOrDefault<Color>(
                            widget.activePage == 'CGM'
                                ? Color(0xC1FFFFFF)
                                : Colors.transparent,
                            Colors.transparent,
                          ),
                          hoverColor: FlutterFlowTheme.of(context).primaryText,
                          hoverIconColor: valueOrDefault<Color>(
                            widget.activePage == 'CGM'
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          icon: Icon(
                            Icons.bloodtype,
                            color: valueOrDefault<Color>(
                              widget.activePage == 'CGM'
                                  ? FlutterFlowTheme.of(context).secondary
                                  : FlutterFlowTheme.of(context).white,
                              FlutterFlowTheme.of(context).white,
                            ),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('homeCGM');
                          },
                        ),
                      ),
                    Flexible(
                      flex: 1,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        fillColor: valueOrDefault<Color>(
                          widget.activePage == 'Settings'
                              ? Color(0xC1FFFFFF)
                              : Colors.transparent,
                          Colors.transparent,
                        ),
                        hoverColor: FlutterFlowTheme.of(context).primaryText,
                        hoverIconColor: valueOrDefault<Color>(
                          widget.activePage == 'Settings'
                              ? FlutterFlowTheme.of(context).alternate
                              : FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        icon: Icon(
                          Icons.settings_rounded,
                          color: valueOrDefault<Color>(
                            widget.activePage == 'Settings'
                                ? FlutterFlowTheme.of(context).secondary
                                : FlutterFlowTheme.of(context).white,
                            FlutterFlowTheme.of(context).white,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (loggedIn) {
                            context.pushNamed('Settings');
                          } else {
                            context.pushNamed('loginPage');
                          }
                        },
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 6.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(-4.0, 2.0),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Stack(
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 100.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: FaIcon(
                                          FontAwesomeIcons.barcode,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 30.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          setState(() {
                                            _model.loadingItem = true;
                                          });
                                          _model.barcodeScan =
                                              await FlutterBarcodeScanner
                                                  .scanBarcode(
                                            '#C62828', // scanning line color
                                            'Cancel', // cancel button text
                                            true, // whether to show the flash icon
                                            ScanMode.BARCODE,
                                          );

                                          _shouldSetState = true;
                                          setState(() {
                                            _model.loadingText =
                                                'Scanned ${_model.barcodeScan}';
                                          });
                                          _model.getOpenFoodFactsName =
                                              await OpenFoodFactsCall.call(
                                            barcode: _model.barcodeScan,
                                          );
                                          _shouldSetState = true;
                                          if (OpenFoodFactsCall.productName(
                                                (_model.getOpenFoodFactsName
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null) {
                                            setState(() {
                                              _model.loadingText =
                                                  valueOrDefault<String>(
                                                'Loading ${OpenFoodFactsCall.productName(
                                                  (_model.getOpenFoodFactsName
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString()}',
                                                'Loading...',
                                              );
                                            });
                                          } else {
                                            setState(() {
                                              _model.loadingText = 'Loading...';
                                            });
                                          }

                                          if (_model.barcodeScan != '-1'
                                              ? true
                                              : false) {
                                            _model.doesCodeExist =
                                                await queryLookupRecordOnce(
                                              queryBuilder: (lookupRecord) =>
                                                  lookupRecord.where(
                                                'code',
                                                isEqualTo: _model.barcodeScan,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            if (_model.doesCodeExist != null) {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .reverse();
                                              }
                                              setState(() {
                                                _model.loadingItem = false;
                                                _model.loadingText =
                                                    'Opening Camera';
                                              });

                                              context.pushNamed(
                                                'Details',
                                                queryParameters: {
                                                  'code': serializeParam(
                                                    _model.barcodeScan,
                                                    ParamType.String,
                                                  ),
                                                  'docRef': serializeParam(
                                                    _model.doesCodeExist
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              _model.buildshipAPI =
                                                  await BuildshipGroup
                                                      .barcodeScanCall
                                                      .call(
                                                userId: currentUserUid,
                                                input: _model.barcodeScan,
                                              );
                                              _shouldSetState = true;
                                              if ((_model.buildshipAPI
                                                      ?.succeeded ??
                                                  true)) {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'containerOnActionTriggerAnimation']!
                                                      .controller
                                                      .reverse();
                                                }
                                                setState(() {
                                                  _model.loadingItem = false;
                                                  _model.loadingText =
                                                      'Opening Camera';
                                                });

                                                context.pushNamed(
                                                  'Details',
                                                  queryParameters: {
                                                    'code': serializeParam(
                                                      _model.barcodeScan,
                                                      ParamType.String,
                                                    ),
                                                    'docRef': serializeParam(
                                                      functions.getDocRef(
                                                          _model.loadingText),
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                setState(() {
                                                  _model.loadingText =
                                                      'Error Finding Item';
                                                });
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 5000));
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'containerOnActionTriggerAnimation']!
                                                      .controller
                                                      .reverse();
                                                }
                                                setState(() {
                                                  _model.loadingItem = false;
                                                  _model.loadingText =
                                                      'Opening Camera';
                                                });
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse();
                                            }
                                            setState(() {
                                              _model.loadingItem = false;
                                            });
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                      ),
                                    ],
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
            ),
          ],
        ),
      ],
    );
  }
}
