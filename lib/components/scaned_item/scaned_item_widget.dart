import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/scaned_item_details/scaned_item_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scaned_item_model.dart';
export 'scaned_item_model.dart';

class ScanedItemWidget extends StatefulWidget {
  const ScanedItemWidget({
    Key? key,
    required this.input,
  }) : super(key: key);

  final String? input;

  @override
  _ScanedItemWidgetState createState() => _ScanedItemWidgetState();
}

class _ScanedItemWidgetState extends State<ScanedItemWidget> {
  late ScanedItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanedItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.doesBarcodeExist = await queryLookupRecordOnce(
        queryBuilder: (lookupRecord) => lookupRecord.where(
          'input',
          isEqualTo: widget.input,
        ),
      );
      if (_model.doesBarcodeExist!.length >= 1 ? true : false) {
        Navigator.pop(context);
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ScanedItemDetailsWidget(
                docRef: _model.doesBarcodeExist?.first?.reference,
                input: widget.input!,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      } else {
        _model.buildshipAPi = await BuildshipGroup.barcodeScanCall.call(
          input: widget.input,
        );
        Navigator.pop(context);

        var lookupRecordReference = LookupRecord.collection.doc();
        await lookupRecordReference.set(createLookupRecordData(
          input: widget.input,
          timestamp: getCurrentTimestamp,
          userRef: currentUserReference,
          details: createDetailsStruct(
            brand: BuildshipGroup.barcodeScanCall
                .brand(
                  (_model.buildshipAPi?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            size: BuildshipGroup.barcodeScanCall
                .size(
                  (_model.buildshipAPi?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            trivia: BuildshipGroup.barcodeScanCall
                .trivia(
                  (_model.buildshipAPi?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            name: BuildshipGroup.barcodeScanCall
                .name(
                  (_model.buildshipAPi?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            weight: BuildshipGroup.barcodeScanCall
                .weight(
                  (_model.buildshipAPi?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            nutritionBreakdown: BuildshipGroup.barcodeScanCall
                .nutrition(
                  (_model.buildshipAPi?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            clearUnsetFields: false,
            create: true,
          ),
        ));
        _model.newItem = LookupRecord.getDocumentFromData(
            createLookupRecordData(
              input: widget.input,
              timestamp: getCurrentTimestamp,
              userRef: currentUserReference,
              details: createDetailsStruct(
                brand: BuildshipGroup.barcodeScanCall
                    .brand(
                      (_model.buildshipAPi?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                size: BuildshipGroup.barcodeScanCall
                    .size(
                      (_model.buildshipAPi?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                trivia: BuildshipGroup.barcodeScanCall
                    .trivia(
                      (_model.buildshipAPi?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                name: BuildshipGroup.barcodeScanCall
                    .name(
                      (_model.buildshipAPi?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                weight: BuildshipGroup.barcodeScanCall
                    .weight(
                      (_model.buildshipAPi?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                nutritionBreakdown: BuildshipGroup.barcodeScanCall
                    .nutrition(
                      (_model.buildshipAPi?.jsonBody ?? ''),
                    )
                    .toString()
                    .toString(),
                clearUnsetFields: false,
                create: true,
              ),
            ),
            lookupRecordReference);
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: ScanedItemDetailsWidget(
                docRef: _model.newItem?.reference,
                input: widget.input!,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Material(
          color: Colors.transparent,
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.elasticOut,
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(-4.0, -2.0),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.0,
                  child: Divider(
                    thickness: 3.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Text(
                              'Scanned:',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            widget.input!,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/3face8da2a6c3dcd27cb4a1aaa32c926_w200.gif',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            'Locating Item...',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context).labelLarge,
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: '',
                            icon: Icon(
                              Icons.chevron_left_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                              _model.barcodeScanAgain =
                                  await FlutterBarcodeScanner.scanBarcode(
                                '#C62828', // scanning line color
                                'Cancel', // cancel button text
                                true, // whether to show the flash icon
                                ScanMode.BARCODE,
                              );

                              if (functions
                                          .barcodeScanInt(
                                              _model.barcodeScanAgain!)
                                          .toString() !=
                                      null &&
                                  functions
                                          .barcodeScanInt(
                                              _model.barcodeScanAgain!)
                                          .toString() !=
                                      '') {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ScanedItemWidget(
                                        input: _model.barcodeScanAgain!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }

                              setState(() {});
                            },
                            text: 'Scan More',
                            icon: FaIcon(
                              FontAwesomeIcons.barcode,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 4.0)),
            ),
          ),
        ),
      ),
    );
  }
}
