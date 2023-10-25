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

import 'dart:convert';
import 'package:json_table/json_table.dart'; // Make sure to add this import for the json_table package

class JsonTable extends StatefulWidget {
  const JsonTable({
    Key? key,
    this.width,
    this.height,
    this.json,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic json;

  @override
  _JsonTableState createState() => _JsonTableState();
}

class _JsonTableState extends State<JsonTable> {
  @override
  Widget build(BuildContext context) {
    var jsonDecoded = jsonDecode(widget.json);

    // Columns for the table
    var columns = [
      JsonTableColumn("name", label: "Name"),
      JsonTableColumn("age", label: "Age"),
      JsonTableColumn("DOB", label: "Date of Birth"),
      JsonTableColumn("email", label: "E-mail", defaultValue: "NA"),
    ];

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: JsonTable(
        jsonDecoded,
        columns: columns,
        tableHeaderBuilder: (String header) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5), color: Colors.grey[300]),
            child: Text(
              header,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: Colors.black87),
            ),
          );
        },
        tableCellBuilder: (value) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5, color: Colors.grey.withOpacity(0.5))),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 14.0, color: Colors.grey[900]),
            ),
          );
        },
      ),
    );
  }
}
