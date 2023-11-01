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

import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownWidget extends StatefulWidget {
  const MarkdownWidget({
    Key? key,
    this.width,
    this.height,
    required this.mdcolor,
    required this.data,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String data;
  final Color mdcolor;

  @override
  _MarkdownWidgetState createState() => _MarkdownWidgetState();
}

class _MarkdownWidgetState extends State<MarkdownWidget> {
  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: widget.data,
      styleSheet: MarkdownStyleSheet(
        p: TextStyle(),
        listBullet: TextStyle(),
        code: TextStyle(
          backgroundColor: Colors.transparent,
          fontFamily: 'Lato',
          fontSize: 10,
        ),
        codeblockPadding: EdgeInsets.all(4),
        codeblockDecoration: BoxDecoration(color: widget.mdcolor),
        tableHead: TextStyle(
          fontFamily: 'Lato',
          fontSize: 10,
          fontWeight: FontWeight.bold, // Make the tableHead text bold
        ),
        tableBody: TextStyle(
          fontFamily: 'Lato',
          fontSize: 10,
        ),
      ),
    );
  }
}
