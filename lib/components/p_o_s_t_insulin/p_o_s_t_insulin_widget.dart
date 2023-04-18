import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_o_s_t_insulin_model.dart';
export 'p_o_s_t_insulin_model.dart';

class POSTInsulinWidget extends StatefulWidget {
  const POSTInsulinWidget({
    Key? key,
    this.insulinType,
    this.latestMmol,
    this.userRef,
  }) : super(key: key);

  final String? insulinType;
  final double? latestMmol;
  final DocumentReference? userRef;

  @override
  _POSTInsulinWidgetState createState() => _POSTInsulinWidgetState();
}

class _POSTInsulinWidgetState extends State<POSTInsulinWidget> {
  late POSTInsulinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => POSTInsulinModel());

    _model.unitsController ??= TextEditingController();
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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 400.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (widget.latestMmol! < 3.9) {
                return FlutterFlowTheme.of(context).tertiary;
              } else if (widget.latestMmol! > 9.4) {
                return FlutterFlowTheme.of(context).secondary;
              } else {
                return FlutterFlowTheme.of(context).primary;
              }
            }(),
            FlutterFlowTheme.of(context).primary,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 50.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Add ${widget.insulinType}',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.unitsController,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'units',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x7EFFFFFF),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x7EFFFFFF),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                        textAlign: TextAlign.start,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        validator: _model.unitsControllerValidator
                            .asValidator(context),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 50.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: FlutterFlowTheme.of(context).secondaryText,
                      icon: Icon(
                        Icons.send_rounded,
                        color: valueOrDefault<Color>(
                          () {
                            if (widget.latestMmol! < 3.9) {
                              return FlutterFlowTheme.of(context).tertiary;
                            } else if (widget.latestMmol! > 9.4) {
                              return FlutterFlowTheme.of(context).secondary;
                            } else {
                              return FlutterFlowTheme.of(context).primary;
                            }
                          }(),
                          FlutterFlowTheme.of(context).primary,
                        ),
                        size: 30.0,
                      ),
                      showLoadingIndicator: true,
                      onPressed: () async {
                        _model.postInsulin = await PostInsulinCall.call(
                          insulin: valueOrDefault<String>(
                            functions.novoTo1DecimalPlace(
                                _model.unitsController.text),
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
                        if ((_model.postInsulin?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Submission to Nightscout Successful',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Post Was Unsuccessful',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
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

                        Navigator.pop(context);

                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
