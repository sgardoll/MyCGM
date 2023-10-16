import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Nightscout Group Code

class NightscoutGroup {
  static String baseUrl = 'https://[nightscout]/api/v1/';
  static Map<String, String> headers = {};
  static GetTreatmentsCall getTreatmentsCall = GetTreatmentsCall();
}

class GetTreatmentsCall {
  Future<ApiCallResponse> call({
    String? count = '',
    String? token = '',
    String? nightscout = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTreatments',
      apiUrl:
          '${NightscoutGroup.baseUrl}treatments?count=${count}&token=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic enteredBy(dynamic response) => getJsonField(
        response,
        r'''$[:].enteredBy''',
        true,
      );
  dynamic insulin(dynamic response) => getJsonField(
        response,
        r'''$[:].insulin''',
        true,
      );
  dynamic insulinInjections(dynamic response) => getJsonField(
        response,
        r'''$[:].insulinInjections''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      );
}

/// End Nightscout Group Code

/// Start OpenAI Group Code

class OpenAIGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ChatCompletionsCall chatCompletionsCall = ChatCompletionsCall();
}

class ChatCompletionsCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? content = '',
    dynamic? jsonJson,
  }) {
    final json = _serializeJson(jsonJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-4",
  "messages": [
    {
      "role": "user",
      "content": "${content}: `${json}`"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Completions',
      apiUrl: '${OpenAIGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End OpenAI Group Code

class GetBloodGlucoseCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? nightscout = '',
    String? token = '',
    String? count = '30',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBloodGlucose',
      apiUrl: 'https://${nightscout}/api/v1/entries/sgv?count=${count}&',
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
  static dynamic singleDateInt(dynamic response) => getJsonField(
        response,
        r'''$[0].date''',
      );
  static dynamic device(dynamic response) => getJsonField(
        response,
        r'''$[:].device''',
        true,
      );
  static dynamic direction(dynamic response) => getJsonField(
        response,
        r'''$[:].direction''',
        true,
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
    final ffApiRequestBody = '''
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
      body: ffApiRequestBody,
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
    final ffApiRequestBody = '''
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
      body: ffApiRequestBody,
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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
