// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:markdown_widget/markdown_widget.dart';

class MarkdownRender extends StatefulWidget {
  const MarkdownRender({
    Key? key,
    this.width,
    this.height,
    this.markdown,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? markdown;

  @override
  _MarkdownRenderState createState() => _MarkdownRenderState();
}

class _MarkdownRenderState extends State<MarkdownRender> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: widget.width,
      height: widget.height,
      child: MarkdownWidget(
        data: widget.markdown ?? '',
        config:
            isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig,
      ),
    );
  }
}
