import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({
    Key? key,
    this.latestMmol,
  }) : super(key: key);

  final double? latestMmol;

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  String? catagoryFiltersValue;
  TextEditingController? aPISecretController;
  TextEditingController? nightscoutController;
  TextEditingController? tokenController;
  bool bioUpdate = false;
  bool? checkboxValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    aPISecretController = TextEditingController(
        text: valueOrDefault(currentUserDocument?.apiKey, ''));
    nightscoutController = TextEditingController(
        text: valueOrDefault(currentUserDocument?.nightscout, ''));
    tokenController = TextEditingController(
        text: valueOrDefault(currentUserDocument?.token, ''));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    aPISecretController?.dispose();
    nightscoutController?.dispose();
    tokenController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Settings',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: responsiveVisibility(
            context: context,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  title: Text(
                    'Settings',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0,
                )
              : null,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    () {
                      if (widget.latestMmol! < 3.9) {
                        return FlutterFlowTheme.of(context).tertiaryColor;
                      } else if (widget.latestMmol! > 9.4) {
                        return FlutterFlowTheme.of(context).secondaryColor;
                      } else {
                        return FlutterFlowTheme.of(context).primaryColor;
                      }
                    }(),
                    FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              'Nightscout  Site',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                              child: Text(
                                'https://',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .richBlackFOGRA29,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: AuthUserStreamWidget(
                                child: TextFormField(
                                  controller: nightscoutController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'nightscoutController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .richBlackFOGRA29,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .richBlackFOGRA29,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    suffixIcon:
                                        nightscoutController!.text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  nightscoutController?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22,
                                                ),
                                              )
                                            : null,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              'API Secret',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AuthUserStreamWidget(
                                child: TextFormField(
                                  controller: aPISecretController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'aPISecretController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .richBlackFOGRA29,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .richBlackFOGRA29,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    suffixIcon:
                                        aPISecretController!.text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  aPISecretController?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22,
                                                ),
                                              )
                                            : null,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              'Token',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AuthUserStreamWidget(
                                child: TextFormField(
                                  controller: tokenController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'tokenController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .richBlackFOGRA29,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .richBlackFOGRA29,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    suffixIcon: tokenController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              tokenController?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF757575),
                                              size: 22,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Units',
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: AuthUserStreamWidget(
                                child: FlutterFlowRadioButton(
                                  options: ['mmol/L', 'mg/dL'].toList(),
                                  onChanged: (val) => setState(
                                      () => catagoryFiltersValue = val),
                                  optionHeight: 36,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  selectedTextStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  inactiveRadioButtonColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (isAndroid)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          shape: CircleBorder(),
                                        ),
                                        unselectedWidgetColor:
                                            Color(0xFFF5F5F5),
                                      ),
                                      child: Checkbox(
                                        value: checkboxValue ??=
                                            FFAppState().useBio,
                                        onChanged: (newValue) async {
                                          setState(
                                              () => checkboxValue = newValue!);
                                          if (newValue!) {
                                            var _shouldSetState = false;
                                            final _localAuth =
                                                LocalAuthentication();
                                            bool _isBiometricSupported =
                                                await _localAuth
                                                    .isDeviceSupported();

                                            if (_isBiometricSupported) {
                                              bioUpdate =
                                                  await _localAuth.authenticate(
                                                      localizedReason:
                                                          'Please authenticate with biometrics');
                                              setState(() {});
                                            }

                                            _shouldSetState = true;
                                            if (bioUpdate!) {
                                              setState(() {
                                                FFAppState().useBio = true;
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Biometric login unsuccessful',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          } else {
                                            setState(() {
                                              FFAppState()
                                                  .deleteRememberedPass();
                                              FFAppState().rememberedPass = '';

                                              FFAppState()
                                                  .deleteRememberedUser();
                                              FFAppState().rememberedUser = '';
                                            });
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Text(
                                      'Use Biometric Login?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final usersUpdateData = createUsersRecordData(
                                    token: tokenController!.text,
                                    units: catagoryFiltersValue,
                                    nightscout: nightscoutController!.text,
                                    apiKey: aPISecretController!.text,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Settings Updated',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );

                                  context.pushNamed('redirect');
                                },
                                text: 'Save Changes',
                                icon: Icon(
                                  Icons.save_rounded,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 50,
                                  color: FlutterFlowTheme.of(context)
                                      .richBlackFOGRA29,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().deleteRememberedPass();
                                    FFAppState().rememberedPass = '';

                                    FFAppState().deleteRememberedUser();
                                    FFAppState().rememberedUser = '';

                                    FFAppState().deleteUseBio();
                                    FFAppState().useBio = false;
                                  });
                                  GoRouter.of(context).prepareAuthEvent();
                                  await signOut();

                                  context.goNamedAuth('loginPage', mounted);
                                },
                                text: 'Logout',
                                icon: Icon(
                                  Icons.logout,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 50,
                                  color: FlutterFlowTheme.of(context)
                                      .richBlackFOGRA29,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Text(
                                'Food composition publications are licensed by Food Standards Australia New Zealand (FSANZ) under a licence based on a Creative Commons Attribution-ShareAlike 3.0 Australia licence. ',
                                style: TextStyle(
                                  color: Color(0xBC000000),
                                  fontSize: 12,
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
            ),
          ),
        ));
  }
}
