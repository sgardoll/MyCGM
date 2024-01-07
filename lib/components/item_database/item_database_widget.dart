import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
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
              if (widget.isDetailsPage ? false : true)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(0.0),
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(0.0),
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
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.jpg',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
              if (!(widget.isDetailsPage ? false : true))
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
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
                                  image: OctoImage(
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
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
                                    fit: BoxFit.contain,
                                    alignment: Alignment(0.0, 0.0),
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.jpg',
                                      fit: BoxFit.contain,
                                      alignment: Alignment(0.0, 0.0),
                                    ),
                                  ),
                                  allowRotation: false,
                                  tag: valueOrDefault<String>(
                                    widget.imageUrl,
                                    'https://www.connectio.com.au/nutri/error.png',
                                  ),
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: valueOrDefault<String>(
                              widget.imageUrl,
                              'https://www.connectio.com.au/nutri/error.png',
                            ),
                            transitionOnUserGestures: true,
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
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              fit: BoxFit.cover,
                              alignment: Alignment(0.0, 0.0),
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.jpg',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
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
