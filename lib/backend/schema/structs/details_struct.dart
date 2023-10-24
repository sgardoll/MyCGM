// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetailsStruct extends FFFirebaseStruct {
  DetailsStruct({
    String? brand,
    String? size,
    String? trivia,
    String? name,
    String? weight,
    String? nutritionBreakdown,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brand = brand,
        _size = size,
        _trivia = trivia,
        _name = name,
        _weight = weight,
        _nutritionBreakdown = nutritionBreakdown,
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

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  set weight(String? val) => _weight = val;
  bool hasWeight() => _weight != null;

  // "nutritionBreakdown" field.
  String? _nutritionBreakdown;
  String get nutritionBreakdown => _nutritionBreakdown ?? '';
  set nutritionBreakdown(String? val) => _nutritionBreakdown = val;
  bool hasNutritionBreakdown() => _nutritionBreakdown != null;

  static DetailsStruct fromMap(Map<String, dynamic> data) => DetailsStruct(
        brand: data['brand'] as String?,
        size: data['size'] as String?,
        trivia: data['trivia'] as String?,
        name: data['name'] as String?,
        weight: data['weight'] as String?,
        nutritionBreakdown: data['nutritionBreakdown'] as String?,
      );

  static DetailsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? DetailsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'brand': _brand,
        'size': _size,
        'trivia': _trivia,
        'name': _name,
        'weight': _weight,
        'nutritionBreakdown': _nutritionBreakdown,
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
        'weight': serializeParam(
          _weight,
          ParamType.String,
        ),
        'nutritionBreakdown': serializeParam(
          _nutritionBreakdown,
          ParamType.String,
        ),
      }.withoutNulls;

  static DetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DetailsStruct(
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
        weight: deserializeParam(
          data['weight'],
          ParamType.String,
          false,
        ),
        nutritionBreakdown: deserializeParam(
          data['nutritionBreakdown'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DetailsStruct &&
        brand == other.brand &&
        size == other.size &&
        trivia == other.trivia &&
        name == other.name &&
        weight == other.weight &&
        nutritionBreakdown == other.nutritionBreakdown;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([brand, size, trivia, name, weight, nutritionBreakdown]);
}

DetailsStruct createDetailsStruct({
  String? brand,
  String? size,
  String? trivia,
  String? name,
  String? weight,
  String? nutritionBreakdown,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DetailsStruct(
      brand: brand,
      size: size,
      trivia: trivia,
      name: name,
      weight: weight,
      nutritionBreakdown: nutritionBreakdown,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DetailsStruct? updateDetailsStruct(
  DetailsStruct? details, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    details
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDetailsStructData(
  Map<String, dynamic> firestoreData,
  DetailsStruct? details,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (details == null) {
    return;
  }
  if (details.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && details.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final detailsData = getDetailsFirestoreData(details, forFieldValue);
  final nestedData = detailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = details.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDetailsFirestoreData(
  DetailsStruct? details, [
  bool forFieldValue = false,
]) {
  if (details == null) {
    return {};
  }
  final firestoreData = mapToFirestore(details.toMap());

  // Add any Firestore field values
  details.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDetailsListFirestoreData(
  List<DetailsStruct>? detailss,
) =>
    detailss?.map((e) => getDetailsFirestoreData(e, true)).toList() ?? [];
