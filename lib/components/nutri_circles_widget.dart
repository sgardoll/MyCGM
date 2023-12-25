import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nutri_circles_model.dart';
export 'nutri_circles_model.dart';

class NutriCirclesWidget extends StatefulWidget {
  const NutriCirclesWidget({
    Key? key,
    required this.energy,
    required this.energyUnits,
    required this.protein,
    required this.proteinUnits,
    required this.carbs,
    required this.carbsUnits,
    required this.fats,
    required this.fatUnits,
  }) : super(key: key);

  final double? energy;
  final String? energyUnits;
  final double? protein;
  final String? proteinUnits;
  final double? carbs;
  final String? carbsUnits;
  final double? fats;
  final String? fatUnits;

  @override
  _NutriCirclesWidgetState createState() => _NutriCirclesWidgetState();
}

class _NutriCirclesWidgetState extends State<NutriCirclesWidget> {
  late NutriCirclesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutriCirclesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: SelectionArea(
                                  child: AutoSizeText(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.energy,
                                    formatType: FormatType.custom,
                                    format: '######0',
                                    locale: '',
                                  ),
                                  '0',
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color:
                                          FlutterFlowTheme.of(context).btnText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AutoSizeText(
                    widget.energyUnits!,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lato',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: SelectionArea(
                                    child: AutoSizeText(
                                  formatNumber(
                                    widget.energy! / 4.184,
                                    formatType: FormatType.custom,
                                    format: '####0',
                                    locale: '',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .btnText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AutoSizeText(
                      'Calories',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      width: 45.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: SelectionArea(
                                  child: AutoSizeText(
                                '${formatNumber(
                                  widget.protein,
                                  formatType: FormatType.custom,
                                  format: '###0.0',
                                  locale: '',
                                )}${widget.proteinUnits}',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color:
                                          FlutterFlowTheme.of(context).btnText,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AutoSizeText(
                    'Protein',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lato',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      width: 45.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: SelectionArea(
                                  child: AutoSizeText(
                                '${formatNumber(
                                  widget.carbs,
                                  formatType: FormatType.custom,
                                  format: '###0.0',
                                  locale: '',
                                )}${widget.carbsUnits}',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color:
                                          FlutterFlowTheme.of(context).btnText,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AutoSizeText(
                    'Carbs',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lato',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      width: 45.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: SelectionArea(
                                  child: AutoSizeText(
                                '${formatNumber(
                                  widget.fats,
                                  formatType: FormatType.custom,
                                  format: '###0.0',
                                  locale: '',
                                )}${widget.fatUnits}',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color:
                                          FlutterFlowTheme.of(context).btnText,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AutoSizeText(
                    'Fat',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lato',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
