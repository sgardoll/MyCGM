import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'item_model.dart';
export 'item_model.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    Key? key,
    String? imageUrl,
    this.title,
    this.subtitle,
    this.size,
    String? blurHash,
    bool? isDetailsPage,
  })  : this.imageUrl =
            imageUrl ?? 'https://www.connectio.com.au/nutri/error.png',
        this.blurHash = blurHash ?? 'L9SF;Lay~qof%Mj[M{ay_3j[D%fQ',
        this.isDetailsPage = isDetailsPage ?? false,
        super(key: key);

  final String imageUrl;
  final String? title;
  final String? subtitle;
  final String? size;
  final String blurHash;
  final bool isDetailsPage;

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> with TickerProviderStateMixin {
  late ItemModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        if (valueOrDefault<bool>(
          widget.isDetailsPage != true,
          false,
        )
            ? true
            : false)
          Material(
            color: Colors.transparent,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: double.infinity,
                height: 45.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
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
                                alignment: AlignmentDirectional(0.00, 0.00),
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
                                    'assets/images/error_image.png',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      widget.title!,
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Lato',
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (valueOrDefault<bool>(
                            widget.subtitle != null && widget.subtitle != ''
                                ? true
                                : false,
                            false,
                          ))
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: AutoSizeText(
                                    widget.subtitle!,
                                    textAlign: TextAlign.end,
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (valueOrDefault<bool>(
                          () {
                            if (widget.size == '') {
                              return false;
                            } else if (widget.size != '-') {
                              return true;
                            } else {
                              return false;
                            }
                          }(),
                          false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: AutoSizeText(
                                    widget.size!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        if (valueOrDefault<bool>(
          valueOrDefault<bool>(
            widget.isDetailsPage == true,
            false,
          )
              ? true
              : false,
          false,
        ))
          Material(
            color: Colors.transparent,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.8),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.8),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(8.0),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.8),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
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
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              fit: BoxFit.contain,
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
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
