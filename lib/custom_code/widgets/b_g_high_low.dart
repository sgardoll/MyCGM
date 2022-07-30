// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class BGHighLow extends StatefulWidget {
  const BGHighLow({
    Key? key,
    this.width,
    this.height,
    required this.sgvToMmol,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double sgvToMmol;

  @override
  _BGHighLowState createState() => _BGHighLowState();
}

class _BGHighLowState extends State<BGHighLow> {
  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (sgvToMmol > 9.4) {
        return Colors.orange.shade500;
      }
      if (sgvToMmol < 3.8) {
        return Colors.red;
      } else {
        return Colors.pink;
      }
    }

    return Container(color: getColor());
  }
}
