import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/item/item_widget.dart';
import '/components/item_database/item_database_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().searchOn = false;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              collapsedHeight: 110.0,
              pinned: false,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Container(
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Hero(
                    tag: 'logo',
                    transitionOnUserGestures: true,
                    child: Image.asset(
                      'assets/images/8aLogo.jpg',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: 110.0,
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
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    indicatorWeight: 3.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    tabs: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.fastfood_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Tab(
                                            text: 'Food Database',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.barcode,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Tab(
                                            text: 'Scanned',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          Tab(
                                            text: '',
                                          ),
                                        ],
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => PagedListView<
                                            DocumentSnapshot<Object?>?,
                                            FoodDatabaseRecord>.separated(
                                          pagingController:
                                              _model.setListViewController1(
                                            FoodDatabaseRecord.collection
                                                .orderBy('foodName'),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            0,
                                          ),
                                          reverse: false,
                                          scrollDirection: Axis.vertical,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  FoodDatabaseRecord>(
                                            // Customize what your widget looks like when it's loading the first page.
                                            firstPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                            // Customize what your widget looks like when it's loading another page.
                                            newPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),

                                            itemBuilder:
                                                (context, _, listViewIndex) {
                                              final listViewFoodDatabaseRecord =
                                                  _model
                                                      .listViewPagingController1!
                                                      .itemList![listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'DetailsDatabaseItem',
                                                      queryParameters: {
                                                        'docRef':
                                                            serializeParam(
                                                          listViewFoodDatabaseRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'imageUrl':
                                                            serializeParam(
                                                          listViewFoodDatabaseRecord
                                                              .imageUrl,
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
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .itemDatabaseModels1
                                                        .getModel(
                                                      listViewFoodDatabaseRecord
                                                          .reference.id,
                                                      listViewIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: Hero(
                                                      tag: 'foodDatabase',
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child:
                                                            ItemDatabaseWidget(
                                                          key: Key(
                                                            'Key290_${listViewFoodDatabaseRecord.reference.id}',
                                                          ),
                                                          imageUrl:
                                                              listViewFoodDatabaseRecord
                                                                  .imageUrl,
                                                          title:
                                                              (String input) {
                                                            return input.indexOf(
                                                                        ',') ==
                                                                    -1
                                                                ? input
                                                                : input.substring(
                                                                    0,
                                                                    input.indexOf(
                                                                        ','));
                                                          }(listViewFoodDatabaseRecord
                                                                  .foodName),
                                                          subtitle:
                                                              (String input) {
                                                            return input
                                                                    .contains(
                                                                        ',')
                                                                ? input
                                                                    .substring(
                                                                        input.indexOf(',') +
                                                                            1)
                                                                    .trimLeft()
                                                                : '';
                                                          }(listViewFoodDatabaseRecord
                                                                  .foodName),
                                                          blurHash:
                                                              listViewFoodDatabaseRecord
                                                                  .blurHash,
                                                          isDetailsPage: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) =>
                                            StreamBuilder<List<LookupRecord>>(
                                          stream: queryLookupRecord(
                                            queryBuilder: (lookupRecord) =>
                                                lookupRecord
                                                    .where(
                                                      'userId',
                                                      isEqualTo: currentUserUid,
                                                    )
                                                    .orderBy('timestamp',
                                                        descending: true),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<LookupRecord>
                                                stackLookupRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final stackLookupRecord =
                                                stackLookupRecordList.isNotEmpty
                                                    ? stackLookupRecordList
                                                        .first
                                                    : null;
                                            return Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    border: Border.all(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                stackLookupRecord !=
                                                                        null
                                                                    ? true
                                                                    : false,
                                                                false,
                                                              ))
                                                                Flexible(
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child:
                                                                        AnimatedContainer(
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              100),
                                                                      curve: Curves
                                                                          .easeInOut,
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                            FlutterFlowTheme.of(context).tertiary
                                                                          ],
                                                                          stops: [
                                                                            0.5,
                                                                            1.0
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1.0),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              'Most Recently Scanned',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                4.0,
                                                                                16.0,
                                                                                16.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'Details',
                                                                                  queryParameters: {
                                                                                    'code': serializeParam(
                                                                                      stackLookupRecord?.code,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'imageUrl': serializeParam(
                                                                                      stackLookupRecord?.openFoodFacts?.imageUrl,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    kTransitionInfoKey: TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.rightToLeft,
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              onLongPress: () async {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      currentUserUid,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );

                                                                                await currentUserReference!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'dailyFood': FieldValue.arrayUnion([
                                                                                        getDayPeriodFirestoreData(
                                                                                          updateDayPeriodStruct(
                                                                                            DayPeriodStruct(
                                                                                              timestamp: getCurrentTimestamp,
                                                                                              foodRef: FoodRefStruct(
                                                                                                foodLookupRef: stackLookupRecord?.reference,
                                                                                              ),
                                                                                              timeOfDay: FoodPeriod.Breakfast,
                                                                                            ),
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          true,
                                                                                        )
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              child: wrapWithModel(
                                                                                model: _model.itemModel1,
                                                                                updateCallback: () => setState(() {}),
                                                                                updateOnChange: true,
                                                                                child: ItemWidget(
                                                                                  imageUrl: OpenFoodFactsApiStruct.maybeFromMap(stackLookupRecord?.openFoodFacts?.toMap())?.imageUrl,
                                                                                  title: stackLookupRecord?.name,
                                                                                  subtitle: stackLookupRecord?.brand,
                                                                                  size: valueOrDefault<String>(
                                                                                    stackLookupRecord?.size,
                                                                                    '-',
                                                                                  ),
                                                                                  blurHash: valueOrDefault<String>(
                                                                                    stackLookupRecord?.blurHash,
                                                                                    'L9SF;Lay~qof%Mj[M{ay_3j[D%fQ',
                                                                                  ),
                                                                                  isDetailsPage: false,
                                                                                  docRef: stackLookupRecord!.reference,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      80.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: PagedListView<
                                                                  DocumentSnapshot<
                                                                      Object?>?,
                                                                  LookupRecord>.separated(
                                                                pagingController:
                                                                    _model
                                                                        .setListViewController2(
                                                                  LookupRecord
                                                                      .collection
                                                                      .where(
                                                                        'name',
                                                                        isNotEqualTo:
                                                                            "No Search Results",
                                                                      )
                                                                      .orderBy(
                                                                          'name'),
                                                                ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                reverse: false,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            8.0),
                                                                builderDelegate:
                                                                    PagedChildBuilderDelegate<
                                                                        LookupRecord>(
                                                                  // Customize what your widget looks like when it's loading the first page.
                                                                  firstPageProgressIndicatorBuilder:
                                                                      (_) =>
                                                                          Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  // Customize what your widget looks like when it's loading another page.
                                                                  newPageProgressIndicatorBuilder:
                                                                      (_) =>
                                                                          Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  itemBuilder:
                                                                      (context,
                                                                          _,
                                                                          listViewIndex) {
                                                                    final listViewLookupRecord = _model
                                                                        .listViewPagingController2!
                                                                        .itemList![listViewIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'Details',
                                                                            queryParameters:
                                                                                {
                                                                              'code': serializeParam(
                                                                                listViewLookupRecord.code,
                                                                                ParamType.String,
                                                                              ),
                                                                              'imageUrl': serializeParam(
                                                                                listViewLookupRecord.openFoodFacts.imageUrl,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.rightToLeft,
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        onLongPress:
                                                                            () async {
                                                                          if (listViewLookupRecord.userId ==
                                                                              currentUserUid) {
                                                                            HapticFeedback.heavyImpact();
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Delete item?'),
                                                                                      content: Text('Do you want to delete this item?'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                          child: Text('Cancel'),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                          child: Text('Yes'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              await currentUserReference!.delete();
                                                                            } else {
                                                                              context.safePop();
                                                                            }
                                                                          }
                                                                        },
                                                                        child:
                                                                            wrapWithModel(
                                                                          model: _model
                                                                              .itemModels2
                                                                              .getModel(
                                                                            listViewLookupRecord.reference.id,
                                                                            listViewIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              ItemWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keyhsj_${listViewLookupRecord.reference.id}',
                                                                            ),
                                                                            imageUrl:
                                                                                listViewLookupRecord.openFoodFacts.imageUrl,
                                                                            title:
                                                                                listViewLookupRecord.name,
                                                                            subtitle:
                                                                                listViewLookupRecord.brand,
                                                                            size:
                                                                                listViewLookupRecord.size,
                                                                            blurHash:
                                                                                listViewLookupRecord.blurHash,
                                                                            isDetailsPage:
                                                                                false,
                                                                            docRef:
                                                                                listViewLookupRecord.reference,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textController',
                                                          Duration(
                                                              milliseconds:
                                                                  1000),
                                                          () async {
                                                            safeSetState(() =>
                                                                _model.algoliaSearchResults =
                                                                    null);
                                                            await FoodDatabaseRecord
                                                                    .search(
                                                              term: _model
                                                                  .textController
                                                                  .text,
                                                            )
                                                                .then((r) =>
                                                                    _model.algoliaSearchResults =
                                                                        r)
                                                                .onError((_,
                                                                        __) =>
                                                                    _model.algoliaSearchResults =
                                                                        [])
                                                                .whenComplete(() =>
                                                                    setState(
                                                                        () {}));
                                                          },
                                                        ),
                                                        autofocus: true,
                                                        textInputAction:
                                                            TextInputAction
                                                                .search,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintText: 'Search',
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 3.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 3.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 3.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 3.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          prefixIcon: Icon(
                                                            Icons.search,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 16.0,
                                                          ),
                                                          suffixIcon: _model
                                                                  .textController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textController
                                                                        ?.clear();
                                                                    safeSetState(() =>
                                                                        _model.algoliaSearchResults =
                                                                            null);
                                                                    await FoodDatabaseRecord
                                                                            .search(
                                                                      term: _model
                                                                          .textController
                                                                          .text,
                                                                    )
                                                                        .then((r) =>
                                                                            _model.algoliaSearchResults =
                                                                                r)
                                                                        .onError((_,
                                                                                __) =>
                                                                            _model.algoliaSearchResults =
                                                                                [])
                                                                        .whenComplete(() =>
                                                                            setState(() {}));

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        maxLength: 30,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (_model
                                                              .algoliaSearchResults ==
                                                          null) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final search = _model
                                                              .algoliaSearchResults
                                                              ?.toList() ??
                                                          [];
                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          0,
                                                          8.0,
                                                          0,
                                                          0,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            search.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            searchIndex) {
                                                          final searchItem =
                                                              search[
                                                                  searchIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'DetailsDatabaseItem',
                                                                  queryParameters:
                                                                      {
                                                                    'docRef':
                                                                        serializeParam(
                                                                      searchItem
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'imageUrl':
                                                                        serializeParam(
                                                                      searchItem
                                                                          .imageUrl,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .rightToLeft,
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .itemDatabaseModels2
                                                                    .getModel(
                                                                  searchItem
                                                                      .reference
                                                                      .id,
                                                                  searchIndex,
                                                                ),
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    ItemDatabaseWidget(
                                                                  key: Key(
                                                                    'Keyz3t_${searchItem.reference.id}',
                                                                  ),
                                                                  imageUrl:
                                                                      searchItem
                                                                          .imageUrl,
                                                                  title: (String
                                                                      input) {
                                                                    return input.indexOf(',') ==
                                                                            -1
                                                                        ? input
                                                                        : input.substring(
                                                                            0,
                                                                            input.indexOf(','));
                                                                  }(searchItem
                                                                      .foodName),
                                                                  subtitle: (String
                                                                      input) {
                                                                    return input.contains(
                                                                            ',')
                                                                        ? input
                                                                            .substring(input.indexOf(',') +
                                                                                1)
                                                                            .trimLeft()
                                                                        : '';
                                                                  }(searchItem
                                                                      .foodName),
                                                                  blurHash:
                                                                      searchItem
                                                                          .blurHash,
                                                                  isDetailsPage:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: wrapWithModel(
                                      model: _model.navBar1Model,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: NavBar1Widget(
                                        activePage: 'Home',
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
