import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).blueSapphire,
                size: 25,
              ),
            ),
          );
        }
        final chartGetBloodGlucoseResponse = snapshot.data!;
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: FlutterFlowLineChart(
            data: [
              FFLineChartData(
                xData: FFAppState().sgv.map((e) => e.toString()).toList(),
                yData: chartGetBloodGlucoseResponse.jsonBody,
                settings: LineChartBarData(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  barWidth: 2,
                  isCurved: true,
                  preventCurveOverShooting: true,
                ),
              )
            ],
            chartStylingInfo: ChartStylingInfo(
              enableTooltip: true,
              backgroundColor: Color(0x00FFFFFF),
              showBorder: false,
            ),
            axisBounds: AxisBounds(),
            xAxisLabelInfo: AxisLabelInfo(),
            yAxisLabelInfo: AxisLabelInfo(
              showLabels: true,
              labelTextStyle: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              labelInterval: 10,
            ),
          ),
        );
      },
    );
  }
}
