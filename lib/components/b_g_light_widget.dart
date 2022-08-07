import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
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
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetBloodGlucoseCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
          );
        }
        final bGImageGetBloodGlucoseResponse = snapshot.data!;
        return CachedNetworkImage(
          imageUrl: valueOrDefault<String>(
            functions.setBgBySgvLight(valueOrDefault<int>(
              GetBloodGlucoseCall.sgv(
                bGImageGetBloodGlucoseResponse.jsonBody,
              ),
              100,
            )),
            'https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png',
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          fit: BoxFit.fill,
        ).animated([animationsMap['imageOnPageLoadAnimation']!]);
      },
    );
  }
}
