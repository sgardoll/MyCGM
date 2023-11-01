// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutrimentsStruct extends FFFirebaseStruct {
  NutrimentsStruct({
    OpenFoodFactsApiStruct? nutriments,
    String? imageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nutriments = nutriments,
        _imageUrl = imageUrl,
        super(firestoreUtilData);

  // "nutriments" field.
  OpenFoodFactsApiStruct? _nutriments;
  OpenFoodFactsApiStruct get nutriments =>
      _nutriments ?? OpenFoodFactsApiStruct();
  set nutriments(OpenFoodFactsApiStruct? val) => _nutriments = val;
  void updateNutriments(Function(OpenFoodFactsApiStruct) updateFn) =>
      updateFn(_nutriments ??= OpenFoodFactsApiStruct());
  bool hasNutriments() => _nutriments != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;
  bool hasImageUrl() => _imageUrl != null;

  static NutrimentsStruct fromMap(Map<String, dynamic> data) =>
      NutrimentsStruct(
        nutriments: OpenFoodFactsApiStruct.maybeFromMap(data['nutriments']),
        imageUrl: data['imageUrl'] as String?,
      );

  static NutrimentsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NutrimentsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'nutriments': _nutriments?.toMap(),
        'imageUrl': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nutriments': serializeParam(
          _nutriments,
          ParamType.DataStruct,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static NutrimentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      NutrimentsStruct(
        nutriments: deserializeStructParam(
          data['nutriments'],
          ParamType.DataStruct,
          false,
          structBuilder: OpenFoodFactsApiStruct.fromSerializableMap,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NutrimentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutrimentsStruct &&
        nutriments == other.nutriments &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([nutriments, imageUrl]);
}

NutrimentsStruct createNutrimentsStruct({
  OpenFoodFactsApiStruct? nutriments,
  String? imageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NutrimentsStruct(
      nutriments:
          nutriments ?? (clearUnsetFields ? OpenFoodFactsApiStruct() : null),
      imageUrl: imageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NutrimentsStruct? updateNutrimentsStruct(
  NutrimentsStruct? nutrimentsStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nutrimentsStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNutrimentsStructData(
  Map<String, dynamic> firestoreData,
  NutrimentsStruct? nutrimentsStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nutrimentsStruct == null) {
    return;
  }
  if (nutrimentsStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nutrimentsStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nutrimentsStructData =
      getNutrimentsFirestoreData(nutrimentsStruct, forFieldValue);
  final nestedData =
      nutrimentsStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nutrimentsStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNutrimentsFirestoreData(
  NutrimentsStruct? nutrimentsStruct, [
  bool forFieldValue = false,
]) {
  if (nutrimentsStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nutrimentsStruct.toMap());

  // Handle nested data for "nutriments" field.
  addOpenFoodFactsApiStructData(
    firestoreData,
    nutrimentsStruct.hasNutriments() ? nutrimentsStruct.nutriments : null,
    'nutriments',
    forFieldValue,
  );

  // Add any Firestore field values
  nutrimentsStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNutrimentsListFirestoreData(
  List<NutrimentsStruct>? nutrimentsStructs,
) =>
    nutrimentsStructs
        ?.map((e) => getNutrimentsFirestoreData(e, true))
        .toList() ??
    [];
