// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class OverlappingCardsWidget extends StatefulWidget {
  const OverlappingCardsWidget({
    Key? key,
    this.width,
    this.height,
    required this.topCardContent,
    required this.middleCardContent,
    required this.bottomCardContent,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget topCardContent;
  final Widget middleCardContent;
  final Widget bottomCardContent;

  @override
  _OverlappingCardsWidgetState createState() => _OverlappingCardsWidgetState();
}

class _OverlappingCardsWidgetState extends State<OverlappingCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: PageView(
        children: [
          Column(
            children: [
              Expanded(
                child: Card(
                  child: Center(
                    child: widget.topCardContent,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Center(
                    child: widget.middleCardContent,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Center(
                    child: widget.bottomCardContent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
