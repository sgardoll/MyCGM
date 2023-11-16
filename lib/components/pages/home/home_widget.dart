import '/backend/backend.dart';
import '/components/item_database/item_database_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  var hasContainerTriggered = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: AutoSizeText(
            'NutriScan',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lato',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          actions: [
            Stack(
              alignment: AlignmentDirectional(1.0, 0.0),
              children: [
                Container(
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 1000),
                          () async {
                            safeSetState(
                                () => _model.algoliaSearchResults = null);
                            await FoodDatabaseRecord.search(
                              term: _model.textController.text,
                            )
                                .then((r) => _model.algoliaSearchResults = r)
                                .onError(
                                    (_, __) => _model.algoliaSearchResults = [])
                                .whenComplete(() => setState(() {}));
                          },
                        ),
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        maxLength: 30,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        cursorColor: FlutterFlowTheme.of(context).secondaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                    hasBeenTriggered: hasContainerTriggered),
                Builder(
                  builder: (context) {
                    if (_model.searchOn) {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            if (_model.searchOn) {
                              setState(() {
                                _model.textController?.clear();
                              });
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation'] !=
                                  null) {
                                await animationsMap[
                                        'containerOnActionTriggerAnimation']!
                                    .controller
                                    .reverse();
                              }
                              setState(() {
                                _model.searchOn = false;
                              });
                            } else {
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation'] !=
                                  null) {
                                setState(() => hasContainerTriggered = true);
                                SchedulerBinding.instance.addPostFrameCallback(
                                    (_) async => await animationsMap[
                                            'containerOnActionTriggerAnimation']!
                                        .controller
                                        .forward(from: 0.0));
                              }
                              setState(() {
                                _model.searchOn = true;
                              });
                            }
                          },
                        ),
                      );
                    } else {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            if (_model.searchOn) {
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation'] !=
                                  null) {
                                await animationsMap[
                                        'containerOnActionTriggerAnimation']!
                                    .controller
                                    .reverse();
                              }
                              setState(() {
                                _model.searchOn = false;
                              });
                            } else {
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation'] !=
                                  null) {
                                setState(() => hasContainerTriggered = true);
                                SchedulerBinding.instance.addPostFrameCallback(
                                    (_) async => await animationsMap[
                                            'containerOnActionTriggerAnimation']!
                                        .controller
                                        .forward(from: 0.0));
                              }
                              setState(() {
                                _model.searchOn = true;
                              });
                            }
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
          centerTitle: false,
          elevation: 6.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (valueOrDefault<bool>(
                isWeb || revenue_cat.activeEntitlementIds.contains('premium')
                    ? false
                    : true,
                true,
              ))
                Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: FlutterFlowAdBanner(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    showsTestAd: false,
                    iOSAdUnitID: 'ca-app-pub-3945304154369399/8928009543',
                    androidAdUnitID: 'ca-app-pub-3945304154369399/4626582701',
                  ),
                ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                          child: Builder(
                            builder: (context) {
                              if (_model.searchOn) {
                                return Builder(
                                  builder: (context) {
                                    if (_model.algoliaSearchResults == null) {
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
                                    final searchResults =
                                        _model.algoliaSearchResults?.toList() ??
                                            [];
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        8.0,
                                        0,
                                        100.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: searchResults.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder:
                                          (context, searchResultsIndex) {
                                        final searchResultsItem =
                                            searchResults[searchResultsIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'DetailsDatabaseItem',
                                              queryParameters: {
                                                'docRef': serializeParam(
                                                  searchResultsItem.reference,
                                                  ParamType.DocumentReference,
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
                                          child: ItemDatabaseWidget(
                                            key: Key(
                                                'Keyp5f_${searchResultsIndex}_of_${searchResults.length}'),
                                            imageUrl: valueOrDefault<String>(
                                              searchResultsItem.imageUrl,
                                              'https://www.connectio.com.au/nutri/error.png',
                                            ),
                                            title: (String input) {
                                              return input.indexOf(',') == -1
                                                  ? input
                                                  : input.substring(
                                                      0, input.indexOf(','));
                                            }(searchResultsItem.foodName),
                                            subtitle: (String input) {
                                              return input.contains(',')
                                                  ? input
                                                      .substring(
                                                          input.indexOf(',') +
                                                              1)
                                                      .trimLeft()
                                                  : '';
                                            }(searchResultsItem.foodName),
                                            size: '-',
                                            blurHash: valueOrDefault<String>(
                                              searchResultsItem.blurHash,
                                              'U9SF;Lof~qt7-;j[M{ay~qj[D%fQM{WBxuof',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
                                return PagedListView<DocumentSnapshot<Object?>?,
                                    FoodDatabaseRecord>.separated(
                                  pagingController:
                                      _model.setListViewController2(
                                    FoodDatabaseRecord.collection
                                        .orderBy('foodName'),
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    8.0,
                                    0,
                                    100.0,
                                  ),
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  builderDelegate: PagedChildBuilderDelegate<
                                      FoodDatabaseRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewFoodDatabaseRecord = _model
                                          .listViewPagingController2!
                                          .itemList![listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'DetailsDatabaseItem',
                                            queryParameters: {
                                              'docRef': serializeParam(
                                                listViewFoodDatabaseRecord
                                                    .reference,
                                                ParamType.DocumentReference,
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
                                        child: ItemDatabaseWidget(
                                          key: Key(
                                              'Keyz3t_${listViewIndex}_of_${_model.listViewPagingController2!.itemList!.length}'),
                                          imageUrl: listViewFoodDatabaseRecord
                                              .imageUrl,
                                          title: (String input) {
                                            return input.indexOf(',') == -1
                                                ? input
                                                : input.substring(
                                                    0, input.indexOf(','));
                                          }(listViewFoodDatabaseRecord
                                              .foodName),
                                          subtitle: (String input) {
                                            return input.contains(',')
                                                ? input
                                                    .substring(
                                                        input.indexOf(',') + 1)
                                                    .trimLeft()
                                                : '';
                                          }(listViewFoodDatabaseRecord
                                              .foodName),
                                          size: '-',
                                          blurHash: valueOrDefault<String>(
                                            listViewFoodDatabaseRecord.blurHash,
                                            'U9SF;Lof~qt7-;j[M{ay~qj[D%fQM{WBxuof',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
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
        ),
      ),
    );
  }
}
