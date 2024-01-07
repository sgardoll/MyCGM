import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'nutrition_panel_google_vision_model.dart';
export 'nutrition_panel_google_vision_model.dart';

class NutritionPanelGoogleVisionWidget extends StatefulWidget {
  const NutritionPanelGoogleVisionWidget({
    Key? key,
    String? source,
    required this.markdown,
    this.nutritionPanel,
  })  : this.source = source ?? '-',
        super(key: key);

  final String source;
  final String? markdown;
  final String? nutritionPanel;

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      color: Color(0x00000000),
      child: ExpandableNotifier(
        controller: _model.expandableController,
        child: ExpandablePanel(
          header: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
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
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                  if (valueOrDefault<bool>(
                    widget.nutritionPanel != null && widget.nutritionPanel != ''
                        ? true
                        : false,
                    false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  widget.nutritionPanel!,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: widget.nutritionPanel!,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: widget.nutritionPanel!,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.nutritionPanel!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
    );
  }
}
