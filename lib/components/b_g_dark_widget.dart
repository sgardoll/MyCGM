import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BGDarkWidget extends StatefulWidget {
  const BGDarkWidget({Key? key}) : super(key: key);

  @override
  _BGDarkWidgetState createState() => _BGDarkWidgetState();
}

class _BGDarkWidgetState extends State<BGDarkWidget>
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
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Theme.of(context).brightness == Brightness.dark,
      child: CachedNetworkImage(
        imageUrl: valueOrDefault<String>(
          functions.setBgBySgvDark(FFAppState().latestSGV),
          'https://connectio.com.au/MyCGM/assets/PrimaryBGDark.png',
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        fit: BoxFit.fill,
      ).animated([animationsMap['imageOnPageLoadAnimation']!]),
    );
  }
}
