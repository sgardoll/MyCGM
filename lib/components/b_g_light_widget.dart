import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BGLightWidget extends StatefulWidget {
  const BGLightWidget({Key? key}) : super(key: key);

  @override
  _BGLightWidgetState createState() => _BGLightWidgetState();
}

class _BGLightWidgetState extends State<BGLightWidget> {
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
