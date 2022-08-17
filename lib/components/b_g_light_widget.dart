import '../flutter_flow/flutter_flow_animations.dart';
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

class _BGLightWidgetState extends State<BGLightWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: FFAppState().background,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      fit: BoxFit.fill,
    ).animated([animationsMap['imageOnPageLoadAnimation']!]);
  }
}
