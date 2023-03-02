// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedNavigationBarWidget extends StatefulWidget {
  CurvedNavigationBarWidget({
    Key? key,
    this.width,
    this.height,
    required this.color,
    required this.backgroundColor,
    required this.buttonBackgroundColor,
    required this.index,
  }) : super(key: key);

  final double? width;
  double? height;
  final Color color;
  final Color backgroundColor;
  final Color buttonBackgroundColor;
  int index = 0;

  @override
  _CurvedNavigationBarWidgetState createState() =>
      _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  int index = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     widget.index = _selectedIndex;
  // }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 60,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
      buttonBackgroundColor: widget.buttonBackgroundColor,
      index: widget.index,
      items: <Widget>[
        Icon(Icons.settings, size: 30, color: widget.buttonBackgroundColor),
        Icon(Icons.home, size: 30, color: widget.backgroundColor),
        Icon(Icons.refresh, size: 30, color: widget.buttonBackgroundColor),
      ],
      onTap: (index) {
        setState(() {
          widget.index = index;
          // navigate to the same index as defined in lib/flutter_flow/nav/nav.dart
          //   switch (index) {
          //     case 0:
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => (),
          //         ),
          //       );
          //       break;
          //     case 1:
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => (),
          //         ),
          //       );
          //       break;
          //     case 2:
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => (),
          //         ),
          //       );
          //       break;
          //   }
        });
      },
      letIndexChange: (index) => true,
    );
  }
}
