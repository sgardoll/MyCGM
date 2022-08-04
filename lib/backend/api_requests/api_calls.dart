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

class PostNovorapidCall {
  static Future<ApiCallResponse> call({
    String? enteredBy = 'MyCGM',
    int? insulin = 0,
    String? insulinInjections =
        '[{\\\"insulin\\\":\\\"Novorapid\\\",\\\"units\\\":0.0}]',
  }) {
    final body = '''
{
  "enteredBy": "${enteredBy}",
  "insulin": "${insulin}",
  "insulinInjections": "[{\"insulin\":\"Novorapid\",\"units\":${insulin}.0}]"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostNovorapid',
      apiUrl:
          'https://stucgm.herokuapp.com/api/v1/treatments?token=mycgm-4eed72c0613bed6d',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'api-secret': 'Thisisnotadrill',
      },
      params: {
        'enteredBy': enteredBy,
        'insulin': insulin,
        'insulinInjections': insulinInjections,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class PostOptisulinCall {
  static Future<ApiCallResponse> call({
    String? enteredBy = 'MyCGM',
    int? insulin = 1,
  }) {
    final body = '''
{
  "enteredBy": "${enteredBy}",
  "insulin": "${insulin}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostOptisulin',
      apiUrl:
          'https://stucgm.herokuapp.com/api/v1/treatments?token=mycgm-4eed72c0613bed6d',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'api-secret': 'Thisisnotadrill',
      },
      params: {
        'enteredBy': enteredBy,
        'insulin': insulin,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
