import '../backend/api_requests/api_calls.dart';
import '../components/b_g_container_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarbsWidget extends StatefulWidget {
  const CarbsWidget({Key? key}) : super(key: key);

  @override
  _CarbsWidgetState createState() => _CarbsWidgetState();
}

class _CarbsWidgetState extends State<CarbsWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? postCarbsResponse;
  TextEditingController? addUniitsWithCarbsController;
  TextEditingController? gramsCarbsController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 350,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(40, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 350,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(-40, 0),
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
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    addUniitsWithCarbsController = TextEditingController();
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
          appBar: AppBar(
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
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 4,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                BGContainerWidget(),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: TextFormField(
                          controller: gramsCarbsController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).title3.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'add carbs (grams)',
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                color: Color(0x80FFFFFF),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().recordInsulinWithCarbs == false)
                              InkWell(
                                onTap: () async {
                                  setState(() => FFAppState()
                                      .recordInsulinWithCarbs = true);
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] ==
                                      null) {
                                    return;
                                  }
                                  await (animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .curvedAnimation
                                          .parent as AnimationController)
                                      .forward(from: 0.0);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        FFAppState().background,
                                      ).image,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 12, 24, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Record NovoRapid As Well?',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                        Container(
                                          width: 80,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1D2429),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.95, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Icon(
                                                    Icons.add_moderator,
                                                    color: Color(0xFF95A1AC),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.85, 0),
                                                child: Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF14181B),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x430B0D0F),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ).animated([
                                                  animationsMap[
                                                      'containerOnActionTriggerAnimation1']!
                                                ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (FFAppState().recordInsulinWithCarbs == true)
                              InkWell(
                                onTap: () async {
                                  setState(() => FFAppState()
                                      .recordInsulinWithCarbs = false);
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] ==
                                      null) {
                                    return;
                                  }
                                  await (animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .curvedAnimation
                                          .parent as AnimationController)
                                      .forward(from: 0.0);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        FFAppState().background,
                                      ).image,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 12, 24, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Record NovoRapid As Well?',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF1D2429),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.9, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 2, 0, 0),
                                                      child: Icon(
                                                        Icons.remove_moderator,
                                                        color:
                                                            Color(0xFF95A1AC),
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.9, 0),
                                                    child: Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF14181B),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x430B0D0F),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                    ).animated([
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation2']!
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: TextFormField(
                                          controller:
                                              addUniitsWithCarbsController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            hintText: 'add units',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 32, 20, 12),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0x80FFFFFF),
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            postCarbsResponse = await PostCarbsCall.call(
                              enteredBy: 'MyCGM_Carbs',
                              eventType: 'Meal Bolus',
                              carbs: gramsCarbsController!.text,
                              insulin: addUniitsWithCarbsController!.text,
                              insulinInjections: 'Carbs',
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
              ],
            ),
          ),
        ));
  }
}
