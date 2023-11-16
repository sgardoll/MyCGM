import '/auth/firebase_auth/auth_util.dart';
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
import 'home_scanned_model.dart';
export 'home_scanned_model.dart';

class HomeScannedWidget extends StatefulWidget {
  const HomeScannedWidget({Key? key}) : super(key: key);

  @override
  _HomeScannedWidgetState createState() => _HomeScannedWidgetState();
}

class _HomeScannedWidgetState extends State<HomeScannedWidget> {
  late HomeScannedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScannedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homeScanned'});
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
            'Scanned',
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
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: StreamBuilder<List<LookupRecord>>(
                          stream: queryLookupRecord(
                            queryBuilder: (lookupRecord) =>
                                lookupRecord.orderBy('name'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 30.0,
                                  height: 30.0,
                                  child: SpinKitRipple(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 30.0,
                                  ),
                                ),
                              );
                            }
                            List<LookupRecord> containerLookupRecordList =
                                snapshot.data!;
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final scannedItems =
                                        containerLookupRecordList
                                            .where((e) => valueOrDefault<bool>(
                                                  e.openFoodFacts.hasName(),
                                                  false,
                                                ))
                                            .toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: scannedItems.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder:
                                          (context, scannedItemsIndex) {
                                        final scannedItemsItem =
                                            scannedItems[scannedItemsIndex];
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
                                                  scannedItemsItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'code': serializeParam(
                                                  scannedItemsItem.code,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );
                                          },
                                          onLongPress: () async {
                                            if (scannedItemsItem.userId ==
                                                currentUserUid) {
                                              HapticFeedback.heavyImpact();
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Delete item?'),
                                                            content: Text(
                                                                'Do you want to delete this item?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child:
                                                                    Text('Yes'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                await scannedItemsItem.reference
                                                    .delete();
                                              } else {
                                                context.safePop();
                                              }
                                            }
                                          },
                                          child: wrapWithModel(
                                            model: _model.itemModels.getModel(
                                              scannedItemsItem.reference.id,
                                              scannedItemsIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: ItemWidget(
                                              key: Key(
                                                'Keyle7_${scannedItemsItem.reference.id}',
                                              ),
                                              imageUrl: scannedItemsItem
                                                  .openFoodFacts.imageUrl,
                                              title: scannedItemsItem.name,
                                              subtitle: scannedItemsItem.brand,
                                              size: scannedItemsItem.brand,
                                              blurHash: valueOrDefault<String>(
                                                scannedItemsItem.blurHash,
                                                'U9SF;Lof~qt7-;j[M{ay~qj[D%fQM{WBxuof',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
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
                    Flexible(
                      child: wrapWithModel(
                        model: _model.navBar1Model,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: NavBar1Widget(
                          activePage: 'Carbs',
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
