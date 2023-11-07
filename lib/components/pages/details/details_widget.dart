import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/nutrition_box_widget.dart';
import '/components/nutrition_panel_google_vision_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    Key? key,
    this.docRef,
    this.code,
  }) : super(key: key);

  final DocumentReference? docRef;
  final String? code;

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.docRef?.id != null && widget.docRef?.id != '' ? true : false) {
        setState(() {
          _model.loadedDocRef = widget.docRef;
        });
      } else if (widget.code != null && widget.code != '' ? true : false) {
        _model.codeLookup = await queryLookupRecordOnce(
          queryBuilder: (lookupRecord) => lookupRecord.where(
            'code',
            isEqualTo: widget.code,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        setState(() {
          _model.loadedDocRef = _model.codeLookup?.reference;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error loading product',
              style: GoogleFonts.getFont(
                'Lato',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).primary,
          ),
        );

        context.goNamed('homeCarbs');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<LookupRecord>(
      stream: LookupRecord.getDocument(_model.loadedDocRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        final detailsLookupRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  expandedHeight: 250.0,
                  collapsedHeight: 56.0,
                  pinned: false,
                  floating: false,
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(
                      color: FlutterFlowTheme.of(context).btnText),
                  automaticallyImplyLeading: true,
                  leading: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: Color(0x40000000),
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        color: FlutterFlowTheme.of(context).btnText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ),
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Material(
                      color: Colors.transparent,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                'https://www.connectio.com.au/nutri/error.png',
                              ),
                            ),
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
                          child: Visibility(
                            visible: valueOrDefault<bool>(
                              detailsLookupRecord.openFoodFacts.hasImageUrl()
                                  ? true
                                  : false,
                              false,
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
                                        placeholderBuilder:
                                            OctoPlaceholder.blurHash(
                                          detailsLookupRecord.blurHash,
                                        ),
                                        image: NetworkImage(
                                          detailsLookupRecord
                                              .openFoodFacts.imageUrl,
                                        ),
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      allowRotation: false,
                                      tag: detailsLookupRecord
                                          .openFoodFacts.imageUrl,
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: detailsLookupRecord.openFoodFacts.imageUrl,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  child: OctoImage(
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      detailsLookupRecord.blurHash,
                                    ),
                                    image: NetworkImage(
                                      detailsLookupRecord
                                          .openFoodFacts.imageUrl,
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  centerTitle: false,
                  elevation: 6.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (valueOrDefault<bool>(
                          _model.loadedDocRef?.id != null &&
                                  _model.loadedDocRef?.id != ''
                              ? true
                              : false,
                          false,
                        ))
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 4,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.00, 0.00),
                                                child: AutoSizeText(
                                                  detailsLookupRecord.name,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (valueOrDefault<bool>(
                                              detailsLookupRecord.size !=
                                                          null &&
                                                      detailsLookupRecord
                                                              .size !=
                                                          ''
                                                  ? true
                                                  : false,
                                              false,
                                            ))
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Container(
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            detailsLookupRecord
                                                                .size,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      detailsLookupRecord
                                              .openFoodFacts.nutriments
                                              .hasEnergy()
                                          ? true
                                          : false,
                                      false,
                                    ))
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.nutritionBoxModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: NutritionBoxWidget(
                                                    source:
                                                        'Open Food Facts - per 100g',
                                                    energy: detailsLookupRecord
                                                        .openFoodFacts
                                                        .nutriments
                                                        .energyKcal,
                                                    energyUnits:
                                                        detailsLookupRecord
                                                            .openFoodFacts
                                                            .nutriments
                                                            .energyKcalUnit,
                                                    energyPerServing:
                                                        detailsLookupRecord
                                                            .openFoodFacts
                                                            .nutriments
                                                            .energyKcal100g,
                                                    protein: detailsLookupRecord
                                                        .openFoodFacts
                                                        .nutriments
                                                        .proteins,
                                                    proteinUnits:
                                                        detailsLookupRecord
                                                            .openFoodFacts
                                                            .nutriments
                                                            .proteinsUnit,
                                                    proteinPerServing:
                                                        detailsLookupRecord
                                                            .openFoodFacts
                                                            .nutriments
                                                            .proteins100g,
                                                    carbs: detailsLookupRecord
                                                        .openFoodFacts
                                                        .nutriments
                                                        .carbohydrates,
                                                    carbUnits:
                                                        detailsLookupRecord
                                                            .openFoodFacts
                                                            .nutriments
                                                            .carbohydratesUnit,
                                                    carbsPerServing:
                                                        detailsLookupRecord
                                                            .openFoodFacts
                                                            .nutriments
                                                            .carbohydrates100g,
                                                    fats: detailsLookupRecord
                                                        .openFoodFacts
                                                        .nutriments
                                                        .fat,
                                                    fatUnits:
                                                        detailsLookupRecord
                                                            .openFoodFacts
                                                            .nutriments
                                                            .fatUnit,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      detailsLookupRecord.nutritionPanel !=
                                                  null &&
                                              detailsLookupRecord
                                                      .nutritionPanel !=
                                                  ''
                                          ? false
                                          : true,
                                      true,
                                    ))
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final selectedMedia =
                                                        await selectMedia(
                                                      multiImage: false,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isDataUploading =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Uploading file...',
                                                          showLoading: true,
                                                        );
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload data');
                                                        return;
                                                      }
                                                    }

                                                    _model.buildshipAPIGoogleVision =
                                                        await BuildshipGoogleVisionCall
                                                            .call(
                                                      url: _model
                                                          .uploadedFileUrl,
                                                      input: detailsLookupRecord
                                                          .code,
                                                    );
                                                    if ((_model
                                                            .buildshipAPIGoogleVision
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Nutritional Panel Added Successfully',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Lato',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );

                                                      await widget.docRef!.update(
                                                          createLookupRecordData(
                                                        nutritionPanel: _model
                                                            .uploadedFileUrl,
                                                      ));
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Nutritional Panel Text Detection Unsuccessful',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Lato',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text:
                                                      'Capture Nutritional Table',
                                                  icon: Icon(
                                                    Icons.add_a_photo_sharp,
                                                    size: 20.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      detailsLookupRecord.nutritionPanel !=
                                                  null &&
                                              detailsLookupRecord
                                                      .nutritionPanel !=
                                                  ''
                                          ? true
                                          : false,
                                      false,
                                    ))
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: wrapWithModel(
                                                  model: _model
                                                      .nutritionPanelGoogleVisionModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      NutritionPanelGoogleVisionWidget(
                                                    source:
                                                        'Nutritional Infomation',
                                                    markdown: detailsLookupRecord
                                                        .googleVisionResponse,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      detailsLookupRecord.trivia != null &&
                                              detailsLookupRecord.trivia != ''
                                          ? true
                                          : false,
                                      false,
                                    ))
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 0.0),
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.bounceOut,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 8.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons.info_outlined,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        detailsLookupRecord
                                                            .trivia,
                                                        maxLines: 4,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .btnText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ].addToStart(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          isWeb ||
                                  revenue_cat.activeEntitlementIds
                                      .contains('premium')
                              ? false
                              : true,
                          true,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.00, -1.00),
                            child: FlutterFlowAdBanner(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              showsTestAd: false,
                              iOSAdUnitID:
                                  'ca-app-pub-3945304154369399/8928009543',
                              androidAdUnitID:
                                  'ca-app-pub-3945304154369399/4626582701',
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
