import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptisulinWidget extends StatefulWidget {
  const OptisulinWidget({Key? key}) : super(key: key);

  @override
  _OptisulinWidgetState createState() => _OptisulinWidgetState();
}

class _OptisulinWidgetState extends State<OptisulinWidget> {
  ApiCallResponse? postOptiResponse;
  TextEditingController? unitsOptiController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Optisulin'});
    unitsOptiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    unitsOptiController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Optisulin',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: responsiveVisibility(
            context: context,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Add Optisulin',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        buttonSize: 48,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'OPTISULIN_PAGE_close_rounded_ICN_ON_TAP');
                          logFirebaseEvent(
                              'IconButton_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 4,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AuthUserStreamWidget(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      () {
                        if (functions.mmolListToLatestMmolFirebase(
                                currentUserDocument!.data.mmol
                                    ?.toList()
                                    ?.toList()) <
                            3.9) {
                          return FlutterFlowTheme.of(context).tertiaryColor;
                        } else if (functions.mmolListToLatestMmolFirebase(
                                currentUserDocument!.data.mmol
                                    ?.toList()
                                    ?.toList()) >
                            9.4) {
                          return FlutterFlowTheme.of(context).secondaryColor;
                        } else {
                          return FlutterFlowTheme.of(context).primaryColor;
                        }
                      }(),
                      FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 125, 16, 0),
                          child: TextFormField(
                            controller: unitsOptiController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'add units',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 32, 20, 12),
                            ),
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0x99001219),
                                ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'OPTISULIN_PAGE_SUBMIT_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_local_state');
                              setState(() {});
                              logFirebaseEvent('Button_backend_call');
                              postOptiResponse = await PostOptiCall.call(
                                insulin: FFAppState().OptiUnitsEntered,
                                enteredBy: 'MyCGM_Opti',
                                insulinInjections: 'Opti',
                              );
                              if ((postOptiResponse?.succeeded ?? true) ==
                                  true) {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Submission to Nightscout Successful',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                );
                              } else {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Post Was Unsuccessful',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .rust,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                );
                              }

                              logFirebaseEvent(
                                  'Button_close_dialog,_drawer,_etc');
                              Navigator.pop(context);

                              setState(() {});
                            },
                            text: 'Submit',
                            options: FFButtonOptions(
                              width: 270,
                              height: 50,
                              color: Color(0x7FFFFFFF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 2,
                              ),
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
        ));
  }
}
