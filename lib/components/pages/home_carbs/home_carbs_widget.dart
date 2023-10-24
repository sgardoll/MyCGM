import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/components/scaned_item_details/scaned_item_details_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pageLoadAPICall = await GetBloodGlucoseCall.call(
        apiKey: valueOrDefault(currentUserDocument?.apiKey, ''),
        nightscout: valueOrDefault(currentUserDocument?.nightscout, ''),
        token: valueOrDefault(currentUserDocument?.token, ''),
        count: '30',
      );
      if ((_model.pageLoadAPICall?.succeeded ?? true)) {
        setState(() {
          FFAppState().latestMmol = valueOrDefault<double>(
            num.parse((valueOrDefault<int>(
                          getJsonField(
                            (_model.pageLoadAPICall?.jsonBody ?? ''),
                            r'''$[0].sgv''',
                          ),
                          18,
                        ) /
                        18)
                    .toStringAsFixed(1))
                .toDouble(),
            1.0,
          );
        });
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  'Your Items',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 6.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional(0.0, -1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 16.0, 30.0, 0.0),
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            LookupRecord>(
                          pagingController: _model.setListViewController1(
                            LookupRecord.collection
                                .where(
                                  'userRef',
                                  isEqualTo: currentUserReference,
                                )
                                .orderBy('timestamp', descending: true),
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<LookupRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewLookupRecord = _model
                                  .listViewPagingController1!
                                  .itemList![listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ScanedItemDetailsWidget(
                                            docRef:
                                                listViewLookupRecord.reference,
                                            input: listViewLookupRecord.input,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    extentRatio: 0.25,
                                    children: [
                                      SlidableAction(
                                        label: 'Delete',
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        icon: Icons.delete_rounded,
                                        onPressed: (_) async {
                                          await listViewLookupRecord.reference
                                              .delete();
                                        },
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      listViewLookupRecord.details.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    subtitle: Text(
                                      listViewLookupRecord.details.brand,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    tileColor: Colors.transparent,
                                    dense: false,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 24.0, 0.0, 0.0),
                            child: AutoSizeText(
                              'Scanned By NutriScan Users',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 16.0, 30.0, 0.0),
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            LookupRecord>(
                          pagingController: _model.setListViewController2(
                            LookupRecord.collection
                                .orderBy('details.name', descending: true),
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<LookupRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewLookupRecord = _model
                                  .listViewPagingController2!
                                  .itemList![listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ScanedItemDetailsWidget(
                                            docRef:
                                                listViewLookupRecord.reference,
                                            input: listViewLookupRecord.input,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    extentRatio: 0.25,
                                    children: [
                                      SlidableAction(
                                        label: 'Delete',
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        icon: Icons.delete_rounded,
                                        onPressed: (_) async {
                                          await listViewLookupRecord.reference
                                              .delete();
                                        },
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      listViewLookupRecord.details.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    subtitle: Text(
                                      listViewLookupRecord.details.brand,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    tileColor: Colors.transparent,
                                    dense: false,
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
