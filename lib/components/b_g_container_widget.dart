import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BGContainerWidget extends StatefulWidget {
  const BGContainerWidget({Key? key}) : super(key: key);

  @override
  _BGContainerWidgetState createState() => _BGContainerWidgetState();
}

class _BGContainerWidgetState extends State<BGContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
        ],
      ),
    );
  }
}
