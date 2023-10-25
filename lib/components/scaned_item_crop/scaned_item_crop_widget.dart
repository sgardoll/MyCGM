import '/backend/backend.dart';
import '/components/scaned_item_details/scaned_item_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scaned_item_crop_model.dart';
export 'scaned_item_crop_model.dart';

class ScanedItemCropWidget extends StatefulWidget {
  const ScanedItemCropWidget({
    Key? key,
    this.docRef,
    required this.input,
  }) : super(key: key);

  final DocumentReference? docRef;
  final String? input;

  @override
  _ScanedItemCropWidgetState createState() => _ScanedItemCropWidgetState();
}

class _ScanedItemCropWidgetState extends State<ScanedItemCropWidget> {
  late ScanedItemCropModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanedItemCropModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final selectedMedia = await selectMedia(
        multiImage: false,
      );
      if (selectedMedia != null &&
          selectedMedia
              .every((m) => validateFileFormat(m.storagePath, context))) {
        setState(() => _model.isDataUploading = true);
        var selectedUploadedFiles = <FFUploadedFile>[];

        try {
          showUploadMessage(
            context,
            'Uploading file...',
            showLoading: true,
          );
          selectedUploadedFiles = selectedMedia
              .map((m) => FFUploadedFile(
                    name: m.storagePath.split('/').last,
                    bytes: m.bytes,
                    height: m.dimensions?.height,
                    width: m.dimensions?.width,
                    blurHash: m.blurHash,
                  ))
              .toList();
        } finally {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          _model.isDataUploading = false;
        }
        if (selectedUploadedFiles.length == selectedMedia.length) {
          setState(() {
            _model.uploadedLocalFile = selectedUploadedFiles.first;
          });
          showUploadMessage(context, 'Success!');
        } else {
          setState(() {});
          showUploadMessage(context, 'Failed to upload data');
          return;
        }
      }

      _model.cropImage = await actions.cropImage(
        context,
        _model.uploadedLocalFile,
      );
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: ScanedItemDetailsWidget(
              croppedImage: _model.cropImage,
              docRef: widget.docRef,
              input: widget.input!,
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
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
              ),
            ),
          );
        },
      ),
    );
  }
}
