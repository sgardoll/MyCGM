import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'servings_per_pack_model.dart';
export 'servings_per_pack_model.dart';

class ServingsPerPackWidget extends StatefulWidget {
  const ServingsPerPackWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
  }) : super(key: key);

  final double? parameter1;
  final String? parameter2;

  @override
  _ServingsPerPackWidgetState createState() => _ServingsPerPackWidgetState();
}

class _ServingsPerPackWidgetState extends State<ServingsPerPackWidget> {
  late ServingsPerPackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServingsPerPackModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: valueOrDefault<bool>(
        () {
          if (widget.parameter2 != 'null') {
            return false;
          } else if (widget.parameter2 == null || widget.parameter2 == '') {
            return false;
          } else {
            return true;
          }
        }(),
        false,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(1.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: AutoSizeText(
                      widget.parameter1!.toString(),
                      textAlign: TextAlign.center,
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
          Text(
            'servings/pack',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Lato',
                  fontSize: 10.0,
                ),
          ),
        ],
      ),
    );
  }
}
