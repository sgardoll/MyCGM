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

import 'package:flutter_qr_bar_scanner/flutter_qr_bar_scanner.dart';

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
  final GlobalKey qrKey = GlobalKey();

  void _qrCodeCallback(String qrCode) {
    // Handle the scanned QR Code
    print('Scanned QR Code: $qrCode');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: QRBarScannerCamera(
        key: qrKey,
        qrCodeCallback: _qrCodeCallback,
        fit: BoxFit.cover,
      ),
    );
  }
}
