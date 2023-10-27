// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/components/nav_bar1_widget.dart';
// ... (other imports)
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanBox extends StatefulWidget {
  const QrScanBox({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _QrScanBoxState createState() => _QrScanBoxState();
}

class _QrScanBoxState extends State<QrScanBox> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null && yourConditionHere(scanData.code!)) {
        // Update FFAppState
        FFAppState().update(() {
          FFAppState().barcodeScanData = scanData.code ?? ''; // Null check here
        });

        // Resume camera
        controller.resumeCamera();
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: widget.width ?? 200,
        ),
      ),
    );
  }
}

bool yourConditionHere(String scannedCode) {
  // Replace this with your actual condition
  return true;
}

void safeSetState(VoidCallback fn) {
  // Implement your safeSetState logic here
}
