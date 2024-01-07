import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nutri_circle_list_model.dart';
export 'nutri_circle_list_model.dart';

class NutriCircleListWidget extends StatefulWidget {
  const NutriCircleListWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final String? parameter1;

  @override
  _NutriCircleListWidgetState createState() => _NutriCircleListWidgetState();
}

class _NutriCircleListWidgetState extends State<NutriCircleListWidget> {
  late NutriCircleListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutriCircleListModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
            child: Container(
              width: 50.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  width: 0.5,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: AutoSizeText(
                widget.parameter1!,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Lato',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 8.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
