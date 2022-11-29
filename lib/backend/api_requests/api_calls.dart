import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetBloodGlucoseCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiKey = '',
    String? nightscout = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBloodGlucose',
      apiUrl:
          'https://${nightscout}.herokuapp.com/api/v1/entries/sgv?count=30&',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'api-secret': '${apiKey}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      cache: true,
    );
  }

  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$[:].date''',
        true,
      );
  static dynamic sgv(dynamic response) => getJsonField(
        response,
        r'''$[:].sgv''',
        true,
      );
  static dynamic delta(dynamic response) => getJsonField(
        response,
        r'''$[:].delta''',
        true,
      );
  static dynamic dateString(dynamic response) => getJsonField(
        response,
        r'''$[:].dateString''',
        true,
      );
}

class PostNovorapidCall {
  static Future<ApiCallResponse> call({
    String? enteredBy = 'MyCGM_Novo',
    String? insulin = '1.0',
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
        "units": "${insulin}"
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
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: true,
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
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: true,
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
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: true,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
