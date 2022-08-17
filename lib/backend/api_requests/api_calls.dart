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
    String? enteredBy = 'MyCGM_Novo',
    String? insulin = '1',
    String? insulinInjections = 'Novo',
  }) {
    final body = '''
[
  {
    "enteredBy": "${enteredBy}",
    "insulin": "${insulin}",
    "insulinInjections": [
      {
        "insulin": "Novorapid",
        "units": "${insulin}.0"
      }
    ]
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostNovorapid',
      apiUrl:
          'https://stucgm.herokuapp.com/api/v1/treatments?token=mycgm-4eed72c0613bed6d',
      callType: ApiCallType.POST,
      headers: {
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

class PostOptiCall {
  static Future<ApiCallResponse> call({
    String? enteredBy = 'MyCGM_Novo',
    String? insulin = '1',
    String? insulinInjections = 'Opti',
  }) {
    final body = '''
[
  {
    "enteredBy": "${enteredBy}",
    "insulin": "${insulin}",
    "insulinInjections": [
      {
        "insulin": "Toujeo",
        "units": "${insulin}.0"
      }
    ]
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostOpti',
      apiUrl:
          'https://stucgm.herokuapp.com/api/v1/treatments?token=mycgm-4eed72c0613bed6d',
      callType: ApiCallType.POST,
      headers: {
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

class PostCarbsCall {
  static Future<ApiCallResponse> call({
    String? enteredBy = 'MyCGM_Carbs',
    String? eventType = 'Meal Bolus',
    String? carbs = 'null',
    String? insulinInjections = 'null',
    String? insulin = 'null',
  }) {
    final body = '''
[
  {
    "enteredBy": "${enteredBy}",
    "eventType": "${eventType}",
    "carbs": "${carbs}",
    "insulinInjections": [
      {
        "insulin": "Novorapid",
        "units": "${insulin}.0"
      }
    ]
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostCarbs',
      apiUrl:
          'https://stucgm.herokuapp.com/api/v1/treatments?token=mycgm-4eed72c0613bed6d',
      callType: ApiCallType.POST,
      headers: {
        'api-secret': 'Thisisnotadrill',
      },
      params: {
        'enteredBy': enteredBy,
        'eventType': eventType,
        'carbs': carbs,
        'insulinInjections': insulinInjections,
        'insulin': insulin,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
