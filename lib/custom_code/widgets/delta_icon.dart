// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class DeltaIcon extends StatelessWidget {
  const DeltaIcon({
    Key? key,
    this.width,
    this.height,
    this.latestDelta,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? latestDelta;

  @override
  Widget build(BuildContext context) {
    if (latestDelta == null) {
      const x = Icon(
        Icons.trending_flat,
        color: Color(0x9AFFFFFF),
        size: 24,
      );
      return x;
    }
    if (latestDelta! >= 0.5) {
      const x = Icon(
        Icons.trending_up,
        color: Color(0x9AFFFFFF),
        size: 24,
      );
      return x;
    }
    if (latestDelta! <= -0.5) {
      const x = Icon(
        Icons.trending_down,
        color: Color(0x9AFFFFFF),
        size: 24,
      );
      return x;
    } else {
      const x = Icon(
        Icons.trending_flat,
        color: Color(0x9AFFFFFF),
        size: 24,
      );
      return x;
    }
  }
}
