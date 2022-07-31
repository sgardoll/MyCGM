// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class SetBG extends StatefulWidget {
  const SetBG({
    Key? key,
    this.width,
    this.height,
    required this.sgvToMmol,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double sgvToMmol;

  Color setBGColor() {
    if (sgvToMmol > 9.4) {
      return Colors.orange.shade300;
    }
    if (sgvToMmol < 3.8) {
      return Colors.red.shade300;
    } else {
      return Colors.pink;
    }
  }

  @override
  _SetBGState createState() => _SetBGState();
}

class _SetBGState extends State<SetBG> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
