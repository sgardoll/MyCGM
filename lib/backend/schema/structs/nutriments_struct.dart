// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutrimentsStruct extends FFFirebaseStruct {
  NutrimentsStruct({
    OpenFoodFactsApiStruct? nutriments,
    String? imageUrl,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nutriments = nutriments,
        _imageUrl = imageUrl,
        _name = name,
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static NutrimentsStruct fromMap(Map<String, dynamic> data) =>
      NutrimentsStruct(
        nutriments: OpenFoodFactsApiStruct.maybeFromMap(data['nutriments']),
        imageUrl: data['imageUrl'] as String?,
        name: data['name'] as String?,
      );

  static NutrimentsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NutrimentsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'nutriments': _nutriments?.toMap(),
        'imageUrl': _imageUrl,
        'name': _name,
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
        'name': serializeParam(
          _name,
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
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  static NutrimentsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NutrimentsStruct(
        nutriments: convertAlgoliaParam(
          data['nutriments'],
          ParamType.DataStruct,
          false,
          structBuilder: OpenFoodFactsApiStruct.fromAlgoliaData,
        ),
        imageUrl: convertAlgoliaParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NutrimentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutrimentsStruct &&
        nutriments == other.nutriments &&
        imageUrl == other.imageUrl &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([nutriments, imageUrl, name]);
}

NutrimentsStruct createNutrimentsStruct({
  OpenFoodFactsApiStruct? nutriments,
  String? imageUrl,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NutrimentsStruct(
      nutriments:
          nutriments ?? (clearUnsetFields ? OpenFoodFactsApiStruct() : null),
      imageUrl: imageUrl,
      name: name,
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
