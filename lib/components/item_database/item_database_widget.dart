import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'item_database_model.dart';
export 'item_database_model.dart';

class ItemDatabaseWidget extends StatefulWidget {
  const ItemDatabaseWidget({
    Key? key,
    this.imageUrl,
    this.title,
    this.subtitle,
    String? blurHash,
    bool? isDetailsPage,
  })  : this.blurHash = blurHash ?? 'L9SF;Lay~qof%Mj[M{ay_3j[D%fQ',
        this.isDetailsPage = isDetailsPage ?? false,
        super(key: key);

  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String blurHash;
  final bool isDetailsPage;

  @override
  _ItemDatabaseWidgetState createState() => _ItemDatabaseWidgetState();
}

class _ItemDatabaseWidgetState extends State<ItemDatabaseWidget> {
  late ItemDatabaseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemDatabaseModel());
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
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  constraints: BoxConstraints(
                    maxWidth: 40.0,
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: OctoImage(
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      valueOrDefault<String>(
                        widget.blurHash,
                        'L9SF;Lay~qof%Mj[M{ay_3j[D%fQ',
                      ),
                    ),
                    image: NetworkImage(
                      valueOrDefault<String>(
                        widget.imageUrl,
                        'https://www.connectio.com.au/nutri/error.png',
                      ),
                    ),
                    width: 45.0,
                    height: 45.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.jpg',
                      width: 45.0,
                      height: 45.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: AutoSizeText(
                              widget.title!,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          if (valueOrDefault<bool>(
                            widget.subtitle != null && widget.subtitle != ''
                                ? true
                                : false,
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: AutoSizeText(
                                widget.subtitle!,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
          ],
        ),
      ),
    );
  }
}
