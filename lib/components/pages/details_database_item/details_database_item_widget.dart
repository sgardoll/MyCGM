import '/backend/backend.dart';
import '/components/create_blurhash_widget.dart';
import '/components/create_image_on_empty_copy_widget.dart';
import '/components/create_markdown_on_empty_widget.dart';
import '/components/item_database/item_database_widget.dart';
import '/components/nutri_circles_widget.dart';
import '/components/nutrition_panel_google_vision_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_database_item_model.dart';
export 'details_database_item_model.dart';

class DetailsDatabaseItemWidget extends StatefulWidget {
  const DetailsDatabaseItemWidget({
    Key? key,
    this.docRef,
    this.imageUrl,
  }) : super(key: key);

  final DocumentReference? docRef;
  final String? imageUrl;

  @override
  _DetailsDatabaseItemWidgetState createState() =>
      _DetailsDatabaseItemWidgetState();
}

class _DetailsDatabaseItemWidgetState extends State<DetailsDatabaseItemWidget> {
  late DetailsDatabaseItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsDatabaseItemModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DetailsDatabaseItem'});
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

    return StreamBuilder<FoodDatabaseRecord>(
      stream: FoodDatabaseRecord.getDocument(widget.docRef!),
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
        final detailsDatabaseItemFoodDatabaseRecord = snapshot.data!;
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
                  pinned: true,
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
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
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
                          child: wrapWithModel(
                            model: _model.itemDatabaseModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: Hero(
                              tag: 'foodDatabase',
                              transitionOnUserGestures: true,
                              child: Material(
                                color: Colors.transparent,
                                child: ItemDatabaseWidget(
                                  imageUrl: widget.imageUrl,
                                  blurHash:
                                      detailsDatabaseItemFoodDatabaseRecord
                                          .blurHash,
                                  isDetailsPage: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  centerTitle: false,
                  toolbarHeight: 56.0,
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
                                                  -1.0, 0.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  detailsDatabaseItemFoodDatabaseRecord
                                                      .foodName,
                                                  'Loading',
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.nutriCirclesModel,
                                          updateCallback: () => setState(() {}),
                                          child: NutriCirclesWidget(
                                            energy: detailsDatabaseItemFoodDatabaseRecord
                                                .energyWithDietaryFibreEquatedKJ,
                                            energyUnits: 'kJ',
                                            protein:
                                                detailsDatabaseItemFoodDatabaseRecord
                                                    .proteinG,
                                            proteinUnits: 'g',
                                            carbs: detailsDatabaseItemFoodDatabaseRecord
                                                .availableCarbohydrateWithSugarAlcoholsG,
                                            carbsUnits: 'g',
                                            fats:
                                                detailsDatabaseItemFoodDatabaseRecord
                                                    .fatTotalG,
                                            fatUnits: 'g',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: valueOrDefault<bool>(
                                                  detailsDatabaseItemFoodDatabaseRecord
                                                                  .markdownTable !=
                                                              null &&
                                                          detailsDatabaseItemFoodDatabaseRecord
                                                                  .markdownTable !=
                                                              ''
                                                      ? true
                                                      : false,
                                                  false,
                                                ),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .nutritionPanelGoogleVisionModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      NutritionPanelGoogleVisionWidget(
                                                    source:
                                                        'Nutritional Breakdown - per 100g / ml',
                                                    markdown:
                                                        detailsDatabaseItemFoodDatabaseRecord
                                                            .markdownTable,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        'Source: Food Standards Australia New Zealand (FSANZ)',
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    detailsDatabaseItemFoodDatabaseRecord
                                                    .markdownTable ==
                                                null ||
                                            detailsDatabaseItemFoodDatabaseRecord
                                                    .markdownTable ==
                                                ''
                                        ? true
                                        : false,
                                    false,
                                  ))
                                    wrapWithModel(
                                      model: _model.createMarkdownOnEmptyModel,
                                      updateCallback: () => setState(() {}),
                                      child: CreateMarkdownOnEmptyWidget(
                                        docRef: widget.docRef!,
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    detailsDatabaseItemFoodDatabaseRecord
                                                    .blurHash ==
                                                null ||
                                            detailsDatabaseItemFoodDatabaseRecord
                                                    .blurHash ==
                                                ''
                                        ? true
                                        : false,
                                    false,
                                  ))
                                    wrapWithModel(
                                      model: _model.createBlurhashModel,
                                      updateCallback: () => setState(() {}),
                                      child: CreateBlurhashWidget(
                                        docRef: widget.docRef!,
                                        imageUrl:
                                            detailsDatabaseItemFoodDatabaseRecord
                                                .imageUrl,
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    detailsDatabaseItemFoodDatabaseRecord
                                                    .imageUrl ==
                                                null ||
                                            detailsDatabaseItemFoodDatabaseRecord
                                                    .imageUrl ==
                                                ''
                                        ? true
                                        : false,
                                    false,
                                  ))
                                    wrapWithModel(
                                      model: _model.createImageOnEmptyCopyModel,
                                      updateCallback: () => setState(() {}),
                                      child: CreateImageOnEmptyCopyWidget(
                                        docRef: widget.docRef!,
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
                            alignment: AlignmentDirectional(0.0, -1.0),
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
