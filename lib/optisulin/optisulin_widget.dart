import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  backgroundColor: valueOrDefault<Color>(
                    () {
                      if (FFAppState().mmol < 3.9) {
                        return FlutterFlowTheme.of(context).tertiaryColor;
                      } else if (FFAppState().mmol > 9.4) {
                        return FlutterFlowTheme.of(context).secondaryColor;
                      } else {
                        return FlutterFlowTheme.of(context).primaryColor;
                      }
                    }(),
                    FlutterFlowTheme.of(context).richBlackFOGRA29,
                  ),
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
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    () {
                      if (FFAppState().mmol < 3.9) {
                        return FlutterFlowTheme.of(context).tertiaryColor;
                      } else if (FFAppState().mmol > 9.4) {
                        return FlutterFlowTheme.of(context).secondaryColor;
                      } else {
                        return FlutterFlowTheme.of(context).primaryColor;
                      }
                    }(),
                    FlutterFlowTheme.of(context).richBlackFOGRA29,
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
                        padding: EdgeInsetsDirectional.fromSTEB(16, 125, 16, 0),
                        child: TextFormField(
                          controller: unitsOptiController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'add units',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
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
                            setState(() => FFAppState().OptiUnitsEntered =
                                unitsOptiController!.text);
                            postOptiResponse = await PostOptiCall.call(
                              insulin: FFAppState().OptiUnitsEntered,
                              enteredBy: 'MyCGM_Opti',
                              insulinInjections: 'Opti',
                            );
                            if ((postOptiResponse?.succeeded ?? true) == true) {
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
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Post Was Unsuccessful',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color:
                                              FlutterFlowTheme.of(context).rust,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              );
                            }

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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
        ));
  }
}
