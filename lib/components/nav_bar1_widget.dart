import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/scaned_item/scaned_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
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

class _NavBar1WidgetState extends State<NavBar1Widget> {
  late NavBar1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
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
                                : FlutterFlowTheme.of(context).accent3,
                            FlutterFlowTheme.of(context).accent3,
                          ),
                          icon: Icon(
                            Icons.home_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('home');
                          },
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        valueOrDefault<bool>(
                            currentUserDocument?.hasCgmFeatures, false),
                        false,
                      ))
                        Flexible(
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowIconButton(
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
                              hoverColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              hoverIconColor: valueOrDefault<Color>(
                                widget.activePage == 'Home'
                                    ? FlutterFlowTheme.of(context).alternate
                                    : FlutterFlowTheme.of(context).accent3,
                                FlutterFlowTheme.of(context).accent3,
                              ),
                              icon: Icon(
                                Icons.bloodtype,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('homeCGM');
                              },
                            ),
                          ),
                        ),
                      Flexible(
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
                            widget.activePage == 'Home'
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context).accent3,
                            FlutterFlowTheme.of(context).accent3,
                          ),
                          icon: Icon(
                            Icons.fastfood_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('homeCarbs');
                          },
                        ),
                      ),
                      Flexible(
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
                            widget.activePage == 'Home'
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context).accent3,
                            FlutterFlowTheme.of(context).accent3,
                          ),
                          icon: Icon(
                            Icons.settings_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('Settings');
                          },
                        ),
                      ),
                      Flexible(
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Stack(
                                      children: [
                                        if (valueOrDefault<bool>(
                                          widget.activePage == 'CGM'
                                              ? true
                                              : false,
                                          false,
                                        ))
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 100.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 30.0,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed: () async {
                                              if (FFAppState().FABOpen) {
                                                FFAppState().update(() {
                                                  FFAppState().FABOpen = false;
                                                });
                                              } else {
                                                FFAppState().update(() {
                                                  FFAppState().FABOpen = true;
                                                });
                                              }
                                            },
                                          ),
                                        if (valueOrDefault<bool>(
                                          widget.activePage != 'CGM'
                                              ? true
                                              : false,
                                          true,
                                        ))
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 100.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: FaIcon(
                                              FontAwesomeIcons.barcode,
                                              color: Colors.white,
                                              size: 30.0,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed: () async {
                                              if (loggedIn) {
                                                _model.barcodeScan =
                                                    await FlutterBarcodeScanner
                                                        .scanBarcode(
                                                  '#C62828', // scanning line color
                                                  'Cancel', // cancel button text
                                                  true, // whether to show the flash icon
                                                  ScanMode.BARCODE,
                                                );

                                                if (functions.barcodeScanInt(
                                                        _model.barcodeScan!) >
                                                    1) {
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: ScanedItemWidget(
                                                          input: _model
                                                              .barcodeScan!,
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }
                                              } else {
                                                context.pushNamed('loginPage');
                                              }

                                              setState(() {});
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
      ),
    );
  }
}
