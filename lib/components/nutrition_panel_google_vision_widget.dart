import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nutrition_panel_google_vision_model.dart';
export 'nutrition_panel_google_vision_model.dart';

class NutritionPanelGoogleVisionWidget extends StatefulWidget {
  const NutritionPanelGoogleVisionWidget({
    Key? key,
    String? source,
    required this.markdown,
  })  : this.source = source ?? '-',
        super(key: key);

  final String source;
  final String? markdown;

  @override
  _NutritionPanelGoogleVisionWidgetState createState() =>
      _NutritionPanelGoogleVisionWidgetState();
}

class _NutritionPanelGoogleVisionWidgetState
    extends State<NutritionPanelGoogleVisionWidget> {
  late NutritionPanelGoogleVisionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionPanelGoogleVisionModel());

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
                      border: Border.all(
                        color: Colors.transparent,
                      ),
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
            expanded: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MarkdownBody(
                      data: widget.markdown!,
                      selectable: true,
                    ),
                  ],
                ),
              ),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: true,
              expandIcon: Icons.keyboard_arrow_down_rounded,
              collapseIcon: Icons.keyboard_arrow_up_rounded,
              iconSize: 24.0,
              iconColor: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
        ),
      ),
    );
  }
}
