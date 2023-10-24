import '/backend/backend.dart';
import '/components/nutri_circles_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'value_list_item_model.dart';
export 'value_list_item_model.dart';

class ValueListItemWidget extends StatefulWidget {
  const ValueListItemWidget({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final FoodDataRecord? doc;

  @override
  _ValueListItemWidgetState createState() => _ValueListItemWidgetState();
}

class _ValueListItemWidgetState extends State<ValueListItemWidget> {
  late ValueListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValueListItemModel());
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
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 200),
                              fadeOutDuration: Duration(milliseconds: 200),
                              imageUrl: valueOrDefault<String>(
                                widget.doc?.icon,
                                'https://www.connectio.com.au/grateful/loading.png',
                              ),
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                              alignment: Alignment(0.00, 0.00),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: AutoSizeText(
                                valueOrDefault<String>(
                                  widget.doc?.foodName,
                                  'Name',
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: AutoSizeText(
                                '${widget.doc?.foodDetail1?.trimLeft()}${widget.doc?.foodDetail2}${widget.doc?.foodDetail3}${widget.doc?.foodDetail4}${widget.doc?.foodDetail5}${widget.doc?.foodDetail6}',
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.nutriCirclesModel,
                            updateCallback: () => setState(() {}),
                            child: NutriCirclesWidget(
                              energy: 0.0,
                              energyUnits: 'kj',
                              protein: 0.0,
                              proteinUnits: 'g',
                              carbs: widget.doc!.totalsugarsg,
                              carbsUnits: 'g',
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 8.0))
                            .around(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
