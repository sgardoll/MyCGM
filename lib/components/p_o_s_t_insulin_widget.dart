import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class POSTInsulinWidget extends StatefulWidget {
  const POSTInsulinWidget({
    Key? key,
    this.insulinType,
  }) : super(key: key);

  final String? insulinType;

  @override
  _POSTInsulinWidgetState createState() => _POSTInsulinWidgetState();
}

class _POSTInsulinWidgetState extends State<POSTInsulinWidget> {
  ApiCallResponse? postInsulin;
  TextEditingController? unitsController;

  @override
  void initState() {
    super.initState();
    unitsController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    unitsController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              () {
                if (functions.mmolListToLatestMmolFirebase(
                        currentUserDocument!.data.mmol?.toList()?.toList())! <
                    3.9) {
                  return FlutterFlowTheme.of(context).tertiaryColor;
                } else if (functions.mmolListToLatestMmolFirebase(
                        currentUserDocument!.data.mmol?.toList()?.toList())! >
                    9.4) {
                  return FlutterFlowTheme.of(context).secondaryColor;
                } else {
                  return FlutterFlowTheme.of(context).primaryColor;
                }
              }(),
              FlutterFlowTheme.of(context).richBlackFOGRA29,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).lineColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Add ${widget.insulinType}',
                      style: FlutterFlowTheme.of(context).title2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: TextFormField(
                          controller: unitsController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'units',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x7EFFFFFF),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x7EFFFFFF),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 60,
                      fillColor: FlutterFlowTheme.of(context).secondaryText,
                      icon: Icon(
                        Icons.send_rounded,
                        color: valueOrDefault<Color>(
                          () {
                            if (functions.mmolListToLatestMmolFirebase(
                                    currentUserDocument!.data.mmol
                                        ?.toList()
                                        ?.toList())! <
                                3.9) {
                              return FlutterFlowTheme.of(context).tertiaryColor;
                            } else if (functions.mmolListToLatestMmolFirebase(
                                    currentUserDocument!.data.mmol
                                        ?.toList()
                                        ?.toList())! >
                                9.4) {
                              return FlutterFlowTheme.of(context)
                                  .secondaryColor;
                            } else {
                              return FlutterFlowTheme.of(context).primaryColor;
                            }
                          }(),
                          FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        size: 30,
                      ),
                      showLoadingIndicator: true,
                      onPressed: () async {
                        logFirebaseEvent(
                            'P_O_S_T_INSULIN_send_rounded_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_backend_call');
                        postInsulin = await PostInsulinCall.call(
                          insulin: valueOrDefault<String>(
                            functions
                                .novoTo1DecimalPlace(unitsController!.text),
                            '1.0',
                          ),
                          enteredBy: 'MyCGM',
                          insulinInjections: widget.insulinType == 'NovoRapid'
                              ? '[{\\\"insulin\\\":\\\"Novorapid\\\",\\\"units\\\":XX}]'
                              : '[{\\\"insulin\\\":\\\"Toujeo\\\",\\\"units\\\":XX.0}]',
                          insulinType: widget.insulinType == 'Optisulin'
                              ? 'Toujeo'
                              : widget.insulinType,
                          apiKey:
                              valueOrDefault(currentUserDocument?.apiKey, ''),
                          nightscout: valueOrDefault(
                              currentUserDocument?.nightscout, ''),
                          token: valueOrDefault(currentUserDocument?.token, ''),
                        );
                        if ((postInsulin?.succeeded ?? true)) {
                          logFirebaseEvent('IconButton_show_snack_bar');
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
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          );
                        } else {
                          logFirebaseEvent('IconButton_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Post Was Unsuccessful',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).rust,
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          );
                        }

                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(context);

                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
