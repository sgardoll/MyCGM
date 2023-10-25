import '/components/nutri_circles_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nutrition_box_model.dart';
export 'nutrition_box_model.dart';

class NutritionBoxWidget extends StatefulWidget {
  const NutritionBoxWidget({
    Key? key,
    String? source,
    double? energy,
    String? energyUnits,
    double? energyPerServing,
    double? protein,
    String? proteinUnits,
    double? proteinPerServing,
    double? carbs,
    String? carbUnits,
    double? carbsPerServing,
    String? servingSize,
  })  : this.source = source ?? '-',
        this.energy = energy ?? 0.0,
        this.energyUnits = energyUnits ?? '0',
        this.energyPerServing = energyPerServing ?? 0.0,
        this.protein = protein ?? 0.0,
        this.proteinUnits = proteinUnits ?? '0',
        this.proteinPerServing = proteinPerServing ?? 0.0,
        this.carbs = carbs ?? 0.0,
        this.carbUnits = carbUnits ?? '0',
        this.carbsPerServing = carbsPerServing ?? 0.0,
        this.servingSize = servingSize ?? '0',
        super(key: key);

  final String source;
  final double energy;
  final String energyUnits;
  final double energyPerServing;
  final double protein;
  final String proteinUnits;
  final double proteinPerServing;
  final double carbs;
  final String carbUnits;
  final double carbsPerServing;
  final String servingSize;

  @override
  _NutritionBoxWidgetState createState() => _NutritionBoxWidgetState();
}

class _NutritionBoxWidgetState extends State<NutritionBoxWidget> {
  late NutritionBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionBoxModel());

    _model.expandableController = ExpandableController(initialExpanded: true);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
          width: 2.0,
        ),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        color: Color(0x00000000),
        child: ExpandableNotifier(
          controller: _model.expandableController,
          child: ExpandablePanel(
            header: Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.source,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Lato',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            collapsed: Container(),
            expanded: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.nutriCirclesModel1,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: NutriCirclesWidget(
                      energy: valueOrDefault<double>(
                        widget.energy,
                        0.0,
                      ),
                      energyUnits: valueOrDefault<String>(
                        widget.energyUnits,
                        '0',
                      ),
                      protein: valueOrDefault<double>(
                        widget.protein,
                        0.0,
                      ),
                      proteinUnits: valueOrDefault<String>(
                        widget.proteinUnits,
                        '0',
                      ),
                      carbs: valueOrDefault<double>(
                        widget.carbs,
                        0.0,
                      ),
                      carbsUnits: valueOrDefault<String>(
                        widget.carbUnits,
                        '0',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 4.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, -1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x420C2533),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            'per serving ${widget.servingSize != null && widget.servingSize != '' ? '(${widget.servingSize})' : ''}',
                                            'per serving',
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.nutriCirclesModel2,
                                updateCallback: () => setState(() {}),
                                child: NutriCirclesWidget(
                                  energy: valueOrDefault<double>(
                                    widget.energy,
                                    0.0,
                                  ),
                                  energyUnits: valueOrDefault<String>(
                                    widget.energyUnits,
                                    '0',
                                  ),
                                  protein: valueOrDefault<double>(
                                    widget.protein,
                                    0.0,
                                  ),
                                  proteinUnits: valueOrDefault<String>(
                                    widget.proteinUnits,
                                    '0',
                                  ),
                                  carbs: valueOrDefault<double>(
                                    widget.carbs,
                                    0.0,
                                  ),
                                  carbsUnits: valueOrDefault<String>(
                                    widget.carbUnits,
                                    '0',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: false,
            ),
          ),
        ),
      ),
    );
  }
}
