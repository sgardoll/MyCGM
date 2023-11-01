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
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().searchOn = false;
        FFAppState().hasCgmFeatures =
            valueOrDefault<bool>(currentUserDocument?.hasCgmFeatures, false);
      });
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'NutriScan',
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
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: FutureBuilder<List<FoodDatabaseRecord>>(
                          future: FFAppState().foodData(
                            uniqueQueryKey: valueOrDefault<String>(
                              currentUserReference?.id,
                              '1',
                            ),
                            requestFn: () => queryFoodDatabaseRecordOnce(
                              queryBuilder: (foodDatabaseRecord) =>
                                  foodDatabaseRecord.orderBy('foodName'),
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 25.0,
                                  ),
                                ),
                              );
                            }
                            List<FoodDatabaseRecord>
                                listViewFoodDatabaseRecordList = snapshot.data!;
                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                8.0,
                                0,
                                100.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewFoodDatabaseRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewFoodDatabaseRecord =
                                    listViewFoodDatabaseRecordList[
                                        listViewIndex];
                                return ItemWidget(
                                  key: Key(
                                      'Keypeh_${listViewIndex}_of_${listViewFoodDatabaseRecordList.length}'),
                                  imageUrl: valueOrDefault<String>(
                                    listViewFoodDatabaseRecord.icon,
                                    'https://www.connectio.com.au/nutri/error.png',
                                  ),
                                  title: (String input) {
                                    return input.indexOf(',') == -1
                                        ? input
                                        : input.substring(
                                            0, input.indexOf(','));
                                  }(listViewFoodDatabaseRecord.foodName),
                                  subtitle: (String input) {
                                    return input.contains(',')
                                        ? input
                                            .substring(input.indexOf(',') + 1)
                                            .trimLeft()
                                        : '';
                                  }(listViewFoodDatabaseRecord.foodName),
                                  size: '-',
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.navBar1Model,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: NavBar1Widget(
                                activePage: 'Home',
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
