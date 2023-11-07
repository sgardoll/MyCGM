import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
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
  }) async {
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
  }) async {
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

/// Start Buildship Group Code

class BuildshipGroup {
  static String baseUrl = 'https://4tgke4.buildship.run';
  static Map<String, String> headers = {};
  static DetectTextGETCall detectTextGETCall = DetectTextGETCall();
  static BarcodeScanCall barcodeScanCall = BarcodeScanCall();
}

class DetectTextGETCall {
  Future<ApiCallResponse> call({
    String? url = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: '/detect_text GET',
      apiUrl: '${BuildshipGroup.baseUrl}/detect_text',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'url': url,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BarcodeScanCall {
  Future<ApiCallResponse> call({
    String? input = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Barcode Scan',
      apiUrl: '${BuildshipGroup.baseUrl}/barcode_scan',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': input,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Buildship Group Code

class GetBloodGlucoseCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? nightscout = '',
    String? token = '',
    String? count = '30',
  }) async {
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
  }) async {
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
  }) async {
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

class OpenFoodFactsCall {
  static Future<ApiCallResponse> call({
    String? barcode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OpenFoodFacts',
      apiUrl: 'https://world.openfoodfacts.org/api/v0/product/${barcode}.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic productkeywords(dynamic response) => getJsonField(
        response,
        r'''$.product._keywords''',
        true,
      );
  static dynamic productabbreviatedproductname(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.abbreviated_product_name''',
      );
  static dynamic productbrands(dynamic response) => getJsonField(
        response,
        r'''$.product.brands''',
      );
  static dynamic productimagefrontsmallurl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_front_small_url''',
      );
  static dynamic productimagefrontthumburl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_front_thumb_url''',
      );
  static dynamic productimagefronturl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_front_url''',
      );
  static dynamic productimageingredientssmallurl(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.image_ingredients_small_url''',
      );
  static dynamic productimageingredientsthumburl(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.image_ingredients_thumb_url''',
      );
  static dynamic productimageingredientsurl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_ingredients_url''',
      );
  static dynamic productimagenutritionsmallurl(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.image_nutrition_small_url''',
      );
  static dynamic productimagenutritionthumburl(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.image_nutrition_thumb_url''',
      );
  static dynamic productimagenutritionurl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_nutrition_url''',
      );
  static dynamic productimagepackagingsmallurl(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.image_packaging_small_url''',
      );
  static dynamic productimagepackagingthumburl(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.image_packaging_thumb_url''',
      );
  static dynamic productimagepackagingurl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_packaging_url''',
      );
  static dynamic productimagesmallurl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_small_url''',
      );
  static dynamic productimagethumburl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_thumb_url''',
      );
  static dynamic productimageurl(dynamic response) => getJsonField(
        response,
        r'''$.product.image_url''',
      );
  static dynamic productimages(dynamic response) => getJsonField(
        response,
        r'''$.product.images''',
      );
  static dynamic productnonutritiondataimported(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.no_nutrition_data_imported''',
      );
  static dynamic productnutriments(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments''',
      );
  static dynamic productnutrimentscarbohydrates(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.carbohydrates''',
      );
  static dynamic productnutrimentscarbohydrates100g(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.carbohydrates_100g''',
      );
  static dynamic productnutrimentscarbohydratesserving(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.carbohydrates_serving''',
      );
  static dynamic productnutrimentscarbohydratesunit(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.carbohydrates_unit''',
      );
  static dynamic productnutrimentscarbohydratesvalue(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.carbohydrates_value''',
      );
  static dynamic productnutrimentsenergy(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.energy''',
      );
  static dynamic productnutrimentsenergy100g(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.energy_100g''',
      );
  static dynamic productnutrimentsenergyserving(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.energy_serving''',
      );
  static dynamic productnutrimentsenergyunit(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.energy_unit''',
      );
  static dynamic productnutrimentsenergyvalue(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.energy_value''',
      );
  static dynamic productnutrimentsfat(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fat''',
      );
  static dynamic productnutrimentsfat100g(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fat_100g''',
      );
  static dynamic productnutrimentsfatserving(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fat_serving''',
      );
  static dynamic productnutrimentsfatunit(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fat_unit''',
      );
  static dynamic productnutrimentsfatvalue(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fat_value''',
      );
  static dynamic productnutrimentsfiber(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fiber''',
      );
  static dynamic productnutrimentsfiber100g(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fiber_100g''',
      );
  static dynamic productnutrimentsfiberserving(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.fiber_serving''',
      );
  static dynamic productnutrimentsfiberunit(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fiber_unit''',
      );
  static dynamic productnutrimentsfibervalue(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.fiber_value''',
      );
  static dynamic productnutrimentsproteins(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.proteins''',
      );
  static dynamic productnutrimentsproteins100g(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.proteins_100g''',
      );
  static dynamic productnutrimentsproteinsserving(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.proteins_serving''',
      );
  static dynamic productnutrimentsproteinsunit(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.proteins_unit''',
      );
  static dynamic productnutrimentsproteinsvalue(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.proteins_value''',
      );
  static dynamic productnutrimentssugars(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.sugars''',
      );
  static dynamic productnutrimentssugars100g(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.sugars_100g''',
      );
  static dynamic productnutrimentssugarsserving(dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments.sugars_serving''',
      );
  static dynamic productnutrimentssugarsunit(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.sugars_unit''',
      );
  static dynamic productnutrimentssugarsvalue(dynamic response) => getJsonField(
        response,
        r'''$.product.nutriments.sugars_value''',
      );
  static dynamic productnutrimentsestimatedcarbohydrates100g(
          dynamic response) =>
      getJsonField(
        response,
        r'''$.product.nutriments_estimated.carbohydrates_100g''',
      );
  static dynamic productproductnameen(dynamic response) => getJsonField(
        response,
        r'''$.product.product_name_en''',
      );
  static dynamic productquantity(dynamic response) => getJsonField(
        response,
        r'''$.product.quantity''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic servingsize(dynamic response) => getJsonField(
        response,
        r'''$.product.serving_size''',
      );
}

class BuildshipGoogleVisionCall {
  static Future<ApiCallResponse> call({
    String? url = '',
    String? input = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuildshipGoogleVision',
      apiUrl: 'https://4tgke4.buildship.run/detect_text',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'url': url,
        'input': input,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nutritionInfo(dynamic response) => getJsonField(
        response,
        r'''$.nutrition_information''',
      );
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
