import '../backend/api_requests/api_calls.dart';
import '../components/b_g_container_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarbsWidget extends StatefulWidget {
  const CarbsWidget({Key? key}) : super(key: key);

  @override
  _CarbsWidgetState createState() => _CarbsWidgetState();
}

class _CarbsWidgetState extends State<CarbsWidget> {
  ApiCallResponse? postCarbsResponse;
  TextEditingController? addUniitsWithCarbsController;
  TextEditingController? overrideRatioTextFieldController;
  bool? addNovoSwitchValue;
  TextEditingController? gramsCarbsController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addUniitsWithCarbsController =
        TextEditingController(text: FFAppState().novoCalcField);
    overrideRatioTextFieldController = TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().ratio,
      '20',
    ));
    gramsCarbsController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Carbs',
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
                    'Add Carbs',
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
                          context.pop();
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
              child: Stack(
                children: [
                  BGContainerWidget(),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 125, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            child: TextFormField(
                              controller: gramsCarbsController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'gramsCarbsController',
                                Duration(milliseconds: 50),
                                () async {
                                  setState(() => FFAppState().carbValuForCalc =
                                      gramsCarbsController!.text);
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'add carbs (grams)',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 32, 20, 12),
                              ),
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0x99001219),
                                      ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: SwitchListTile(
                                      value: addNovoSwitchValue ??= false,
                                      onChanged: (newValue) => setState(
                                          () => addNovoSwitchValue = newValue),
                                      title: Text(
                                        'Offset With NovoRapid',
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      activeTrackColor: Color(0x99001219),
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 12, 12),
                                    ),
                                  ),
                                ),
                                if (addNovoSwitchValue == true)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (gramsCarbsController!.text != null &&
                                          gramsCarbsController!.text != '')
                                        Expanded(
                                          flex: 2,
                                          child: TextFormField(
                                            controller:
                                                addUniitsWithCarbsController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 32, 20, 12),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0x99001219),
                                                ),
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: TextFormField(
                                            controller:
                                                overrideRatioTextFieldController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              'overrideRatioTextFieldController',
                                              Duration(milliseconds: 1500),
                                              () async {
                                                setState(() => FFAppState()
                                                        .ratio =
                                                    overrideRatioTextFieldController!
                                                        .text);
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'ratio',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 32, 20, 12),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0x99001219),
                                                ),
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                postCarbsResponse = await PostCarbsCall.call(
                                  enteredBy: 'MyCGM_Carbs',
                                  eventType: 'Meal Bolus',
                                  carbs: gramsCarbsController!.text,
                                  insulin: addUniitsWithCarbsController!.text,
                                  insulinInjections:
                                      '[{\\\"insulin\\\":\\\"Novorapid\\\",\\\"units\\\":XX.0}]',
                                );
                                if ((postCarbsResponse?.succeeded ?? true) ==
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Submission to Nightscout Successful',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Post Was Unsuccessful',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 2,
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
            ),
          ),
        ));
  }
}
