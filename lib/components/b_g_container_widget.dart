import '../components/b_g_dark_widget.dart';
import '../components/b_g_light_widget.dart';
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
    return Stack(
      children: [
        if (Theme.of(context).brightness == Brightness.light) BGLightWidget(),
        if (Theme.of(context).brightness == Brightness.dark) BGDarkWidget(),
      ],
    );
  }
}
