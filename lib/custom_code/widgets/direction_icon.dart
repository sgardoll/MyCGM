// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class DirectionIcon extends StatefulWidget {
  final dynamic? direction;
  final double? width;
  final double? height;
  final Color? color;

  const DirectionIcon({
    Key? key,
    this.direction,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  _DirectionIconState createState() => _DirectionIconState();
}

class _DirectionIconState extends State<DirectionIcon> {
  IconData? getIconFromDirection(dynamic? direction) {
    switch (direction) {
      case 'Flat':
        return null;
      case 'FortyFiveDown':
        return Icons.trending_down;
      case 'FortyFiveUp':
        return Icons.trending_up;
      case 'SingleDown':
        return Icons.expand_more;
      case 'DoubleDown':
        return Icons.keyboard_double_arrow_down;
      case 'SingleUp':
        return Icons.expand_less;
      case 'DoubleUp':
        return Icons.keyboard_double_arrow_up;
      default:
        return Icons
            .timeline; // If the input string doesn't match any known direction, return a help icon
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData? iconData = getIconFromDirection(widget.direction);
    if (iconData == null) {
      return SizedBox.shrink();
    } else {
      return Icon(
        iconData,
        color: widget.color ?? Colors.black,
        size: 24.0,
      );
    }
  }
}
