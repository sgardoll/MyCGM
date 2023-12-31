import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              Image.network(
                valueOrDefault<String>(
                  widget.imageUrl,
                  'https://www.connectio.com.au/nutri/error.png',
                ),
                width: valueOrDefault<double>(
                  widget.isDetailsPage
                      ? MediaQuery.sizeOf(context).height
                      : 45.0,
                  45.0,
                ),
                height: valueOrDefault<double>(
                  widget.isDetailsPage
                      ? MediaQuery.sizeOf(context).height
                      : 45.0,
                  45.0,
                ),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/error_image.jpg',
                  width: valueOrDefault<double>(
                    widget.isDetailsPage
                        ? MediaQuery.sizeOf(context).height
                        : 45.0,
                    45.0,
                  ),
                  height: valueOrDefault<double>(
                    widget.isDetailsPage
                        ? MediaQuery.sizeOf(context).height
                        : 45.0,
                    45.0,
                  ),
                  fit: BoxFit.cover,
                ),
                cacheWidth: 45,
                cacheHeight: 45,
              ),
              if (widget.isDetailsPage ? false : true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
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
                              if (valueOrDefault<bool>(
                                widget.title != null && widget.title != ''
                                    ? true
                                    : false,
                                false,
                              ))
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
      ),
    );
  }
}
