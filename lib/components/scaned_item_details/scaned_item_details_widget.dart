import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/nutrition_panel_google_vision_widget.dart';
import '/components/scaned_item/scaned_item_widget.dart';
import '/components/scaned_item_crop/scaned_item_crop_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scaned_item_details_model.dart';
export 'scaned_item_details_model.dart';

class ScanedItemDetailsWidget extends StatefulWidget {
  const ScanedItemDetailsWidget({
    Key? key,
    this.docRef,
    required this.input,
  }) : super(key: key);

  final DocumentReference? docRef;
  final String? input;

  @override
  _ScanedItemDetailsWidgetState createState() =>
      _ScanedItemDetailsWidgetState();
}

class _ScanedItemDetailsWidgetState extends State<ScanedItemDetailsWidget> {
  late ScanedItemDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanedItemDetailsModel());
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
      child: StreamBuilder<LookupRecord>(
        stream: LookupRecord.getDocument(widget.docRef!),
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
          final blurLookupRecord = snapshot.data!;
          return BackdropFilter(
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
                child: SingleChildScrollView(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            blurLookupRecord.name,
                                            'Loading...',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (valueOrDefault<bool>(
                                blurLookupRecord.hasSize() ? true : false,
                                false,
                              ))
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: const CircleBorder(),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.bounceOut,
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 4.0, 0.0),
                                      child: AutoSizeText(
                                        valueOrDefault<String>(
                                          blurLookupRecord.size,
                                          '-',
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        blurLookupRecord.hasTrivia() ? true : false,
                        false,
                      ))
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceOut,
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.info_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            blurLookupRecord.trivia,
                                            '-',
                                          ),
                                          maxLines: 3,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .btnText,
                                                fontWeight: FontWeight.normal,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [],
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        blurLookupRecord.nutritionPanel != null &&
                                blurLookupRecord.nutritionPanel != ''
                            ? true
                            : false,
                        false,
                      ))
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: wrapWithModel(
                                    model:
                                        _model.nutritionPanelGoogleVisionModel,
                                    updateCallback: () => setState(() {}),
                                    child: NutritionPanelGoogleVisionWidget(
                                      source: 'Nutritional Panel On-Pack',
                                      markdown:
                                          blurLookupRecord.googleVisionResponse,
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
                              16.0, 8.0, 16.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ScanedItemCropWidget(
                                            docRef: widget.docRef,
                                            input: widget.input!,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.croppedImage = value));

                                    {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var selectedMedia = <SelectedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = _model
                                                .croppedImage!.bytes!.isNotEmpty
                                            ? [_model.croppedImage!]
                                            : <FFUploadedFile>[];
                                        selectedMedia =
                                            selectedFilesFromUploadedFiles(
                                          selectedUploadedFiles,
                                        );
                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }

                                    _model.buildshipAPIGoogleVision =
                                        await BuildshipGoogleVisionCall.call(
                                      url: _model.uploadedFileUrl,
                                      input: widget.input,
                                    );
                                    if ((_model.buildshipAPIGoogleVision
                                            ?.succeeded ??
                                        true)) {
                                      await widget.docRef!
                                          .update(createLookupRecordData(
                                        nutritionPanel: _model.uploadedFileUrl,
                                      ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Nutritional Panel Text Detection Unsuccessful',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Nutritional Panel',
                                  icon: Icon(
                                    Icons.add_a_photo_sharp,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
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
                              Expanded(
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
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
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
                    ].addToStart(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
