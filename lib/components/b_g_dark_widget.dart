import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BGDarkWidget extends StatefulWidget {
  const BGDarkWidget({Key? key}) : super(key: key);

  @override
  _BGDarkWidgetState createState() => _BGDarkWidgetState();
}

class _BGDarkWidgetState extends State<BGDarkWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: FFAppState().background,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      fit: BoxFit.fill,
    );
  }
}
