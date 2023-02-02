import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Nightscout Group Code

class NightscoutGroup {
  static String baseUrl = 'https://[nightscout]/api/v1/';
  static Map<String, String> headers = {
    'api-secret': '[api_key]',
  };
}

/// End Nightscout Group Code

class GetBloodGlucoseCall {
  static Future<ApiCallResponse> call({
    String? apiKey = 'Thisisnotadrill',
    String? nightscout = 'stucgm',
    String? token = 'mycgm-4eed72c0613bed6d',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBloodGlucose',
      apiUrl: 'https://${nightscout}/api/v1/entries/sgv?count=30&',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'api-secret': '${apiKey}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  static dynamic singleSgv(dynamic response) => getJsonField(
        response,
        r'''$[0].sgv''',
      );
}

class PostInsulinCall {
  static Future<ApiCallResponse> call({
    String? enteredBy = 'MyCGM_Novo',
    String? insulin = '1.0',
    String? insulinInjections = 'Novo',
    String? insulinType = '',
    String? apiKey = '',
    String? nightscout = '',
    String? token = '',
  }) {
    final body = '''
[
  {
    "enteredBy": "${enteredBy}",
    "insulin": "${insulin}",
    "insulinInjections": "[{\\"insulin\\":\\"${insulinType}\\",\\"units\\":${insulin}}]"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostInsulin',
      apiUrl: 'https://${nightscout}/api/v1/treatments?token=${token}',
      callType: ApiCallType.POST,
      headers: {
        'api-secret': '${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostCarbsCall {
  static Future<ApiCallResponse> call({
    String? enteredBy = 'MyCGM_Carbs',
    String? eventType = 'Meal Bolus',
    double? carbs,
    String? nightscout = '',
    String? token = '',
    String? apiKey = '',
    String? notes = '',
  }) {
    final body = '''
[
  {
    "enteredBy": "${enteredBy}",
    "eventType": "${eventType}",
    "carbs": ${carbs},
    "notes": "${notes}"
  }
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostCarbs',
      apiUrl: 'https://${nightscout}/api/v1/treatments?token=${token}',
      callType: ApiCallType.POST,
      headers: {
        'api-secret': '${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
