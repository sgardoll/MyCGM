import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetBloodGlucoseCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBloodGlucose',
      apiUrl:
          'https://stucgm.herokuapp.com/api/v1/entries/sgv?count=1&token=mycgm-4eed72c0613bed6d',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'api-secret': 'Thisisnotadrill',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic sgv(dynamic response) => getJsonField(
        response,
        r'''$..sgv''',
      );
  static dynamic dateString(dynamic response) => getJsonField(
        response,
        r'''$..dateString''',
      );
  static dynamic delta(dynamic response) => getJsonField(
        response,
        r'''$..delta''',
      );
}
