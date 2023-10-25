import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
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
      Navigator.pop(context, _model.cropImage);
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
