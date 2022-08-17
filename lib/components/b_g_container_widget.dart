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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height * 1,
      ),
      decoration: BoxDecoration(),
    );
  }
}
