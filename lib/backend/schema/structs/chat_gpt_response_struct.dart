// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatGptResponseStruct extends FFFirebaseStruct {
  ChatGptResponseStruct({
    String? brand,
    String? size,
    String? trivia,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brand = brand,
        _size = size,
        _trivia = trivia,
        _name = name,
        super(firestoreUtilData);

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;
  bool hasBrand() => _brand != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;
  bool hasSize() => _size != null;

  // "trivia" field.
  String? _trivia;
  String get trivia => _trivia ?? '';
  set trivia(String? val) => _trivia = val;
  bool hasTrivia() => _trivia != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static ChatGptResponseStruct fromMap(Map<String, dynamic> data) =>
      ChatGptResponseStruct(
        brand: data['brand'] as String?,
        size: data['size'] as String?,
        trivia: data['trivia'] as String?,
        name: data['name'] as String?,
      );

  static ChatGptResponseStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatGptResponseStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'brand': _brand,
        'size': _size,
        'trivia': _trivia,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'trivia': serializeParam(
          _trivia,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatGptResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatGptResponseStruct(
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        trivia: deserializeParam(
          data['trivia'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatGptResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatGptResponseStruct &&
        brand == other.brand &&
        size == other.size &&
        trivia == other.trivia &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([brand, size, trivia, name]);
}

ChatGptResponseStruct createChatGptResponseStruct({
  String? brand,
  String? size,
  String? trivia,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatGptResponseStruct(
      brand: brand,
      size: size,
      trivia: trivia,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatGptResponseStruct? updateChatGptResponseStruct(
  ChatGptResponseStruct? chatGptResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatGptResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatGptResponseStructData(
  Map<String, dynamic> firestoreData,
  ChatGptResponseStruct? chatGptResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatGptResponse == null) {
    return;
  }
  if (chatGptResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatGptResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatGptResponseData =
      getChatGptResponseFirestoreData(chatGptResponse, forFieldValue);
  final nestedData =
      chatGptResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatGptResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatGptResponseFirestoreData(
  ChatGptResponseStruct? chatGptResponse, [
  bool forFieldValue = false,
]) {
  if (chatGptResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatGptResponse.toMap());

  // Add any Firestore field values
  chatGptResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatGptResponseListFirestoreData(
  List<ChatGptResponseStruct>? chatGptResponses,
) =>
    chatGptResponses
        ?.map((e) => getChatGptResponseFirestoreData(e, true))
        .toList() ??
    [];
