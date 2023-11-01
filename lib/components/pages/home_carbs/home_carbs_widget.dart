import '/backend/backend.dart';
import '/components/item/item_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_carbs_model.dart';
export 'home_carbs_model.dart';

class HomeCarbsWidget extends StatefulWidget {
  const HomeCarbsWidget({Key? key}) : super(key: key);

  @override
  _HomeCarbsWidgetState createState() => _HomeCarbsWidgetState();
}

class _HomeCarbsWidgetState extends State<HomeCarbsWidget> {
  late HomeCarbsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCarbsModel());
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Scanned Items',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 6.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional(0.0, -1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (valueOrDefault<bool>(
                      isWeb ||
                              revenue_cat.activeEntitlementIds
                                  .contains('premium')
                          ? false
                          : true,
                      true,
                    ))
                      FlutterFlowAdBanner(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        showsTestAd: false,
                        iOSAdUnitID: 'ca-app-pub-3945304154369399/8928009543',
                        androidAdUnitID:
                            'ca-app-pub-3945304154369399/4626582701',
                      ),
                    Flexible(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: StreamBuilder<List<LookupRecord>>(
                            stream: queryLookupRecord(
                              queryBuilder: (lookupRecord) => lookupRecord
                                  .where(
                                    'name',
                                    isNotEqualTo: 'No Search Results',
                                  )
                                  .orderBy('name'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 30.0,
                                    ),
                                  ),
                                );
                              }
                              List<LookupRecord> listViewLookupRecordList =
                                  snapshot.data!;
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewLookupRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 8.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewLookupRecord =
                                      listViewLookupRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Details',
                                        queryParameters: {
                                          'docRef': serializeParam(
                                            listViewLookupRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: wrapWithModel(
                                      model: _model.itemModels.getModel(
                                        listViewLookupRecord.reference.id,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: ItemWidget(
                                        key: Key(
                                          'Keyle7_${listViewLookupRecord.reference.id}',
                                        ),
                                        imageUrl: valueOrDefault<String>(
                                          listViewLookupRecord
                                              .openFoodFacts.imageUrl,
                                          'https://www.connectio.com.au/nutri/error.png',
                                        ),
                                        title: listViewLookupRecord.name,
                                        subtitle: listViewLookupRecord.brand,
                                        size: listViewLookupRecord.size,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    wrapWithModel(
                      model: _model.navBar1Model,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: NavBar1Widget(
                        activePage: 'Carbs',
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
