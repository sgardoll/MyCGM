// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
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
  final double? height;
  final Color color;
  final Color backgroundColor;
  final Color buttonBackgroundColor;
  int index = 0;

  @override
  _CurvedNavigationBarWidgetState createState() =>
      _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.index =
          _selectedIndex; // Update the index of the CurvedNavigationBar widget
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: widget.color,
      backgroundColor: widget.backgroundColor,
      buttonBackgroundColor: widget.buttonBackgroundColor,
      index: widget.index,
      items: [
        IconButton(
          icon: Icon(Icons.settings, size: 30),
          onPressed: () {
            Navigator.pushNamed(context, 'Settings');
          },
        ),
        Icon(Icons.refresh, size: 30),
        //Icon(Icons.add_circle_rounded, size: 60),
        // Add an onTap callback to the add_circle_rounded icon
        IconButton(
          icon: Icon(Icons.add_circle_rounded, size: 60),
          onPressed: () {
            Navigator.pushNamed(context, 'Main');
          },
        ),
      ],
      onTap: _onItemTapped,
      letIndexChange: (index) => true,
    );
  }
}
