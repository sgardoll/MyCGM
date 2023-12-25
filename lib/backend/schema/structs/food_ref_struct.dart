// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodRefStruct extends FFFirebaseStruct {
  FoodRefStruct({
    DocumentReference? foodLookupRef,
    DocumentReference? foodDatabaseRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _foodLookupRef = foodLookupRef,
        _foodDatabaseRef = foodDatabaseRef,
        super(firestoreUtilData);

  // "foodLookupRef" field.
  DocumentReference? _foodLookupRef;
  DocumentReference? get foodLookupRef => _foodLookupRef;
  set foodLookupRef(DocumentReference? val) => _foodLookupRef = val;
  bool hasFoodLookupRef() => _foodLookupRef != null;

  // "foodDatabaseRef" field.
  DocumentReference? _foodDatabaseRef;
  DocumentReference? get foodDatabaseRef => _foodDatabaseRef;
  set foodDatabaseRef(DocumentReference? val) => _foodDatabaseRef = val;
  bool hasFoodDatabaseRef() => _foodDatabaseRef != null;

  static FoodRefStruct fromMap(Map<String, dynamic> data) => FoodRefStruct(
        foodLookupRef: data['foodLookupRef'] as DocumentReference?,
        foodDatabaseRef: data['foodDatabaseRef'] as DocumentReference?,
      );

  static FoodRefStruct? maybeFromMap(dynamic data) =>
      data is Map ? FoodRefStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'foodLookupRef': _foodLookupRef,
        'foodDatabaseRef': _foodDatabaseRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'foodLookupRef': serializeParam(
          _foodLookupRef,
          ParamType.DocumentReference,
        ),
        'foodDatabaseRef': serializeParam(
          _foodDatabaseRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static FoodRefStruct fromSerializableMap(Map<String, dynamic> data) =>
      FoodRefStruct(
        foodLookupRef: deserializeParam(
          data['foodLookupRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['lookup'],
        ),
        foodDatabaseRef: deserializeParam(
          data['foodDatabaseRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['foodDatabase'],
        ),
      );

  static FoodRefStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FoodRefStruct(
        foodLookupRef: convertAlgoliaParam(
          data['foodLookupRef'],
          ParamType.DocumentReference,
          false,
        ),
        foodDatabaseRef: convertAlgoliaParam(
          data['foodDatabaseRef'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FoodRefStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FoodRefStruct &&
        foodLookupRef == other.foodLookupRef &&
        foodDatabaseRef == other.foodDatabaseRef;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([foodLookupRef, foodDatabaseRef]);
}

FoodRefStruct createFoodRefStruct({
  DocumentReference? foodLookupRef,
  DocumentReference? foodDatabaseRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FoodRefStruct(
      foodLookupRef: foodLookupRef,
      foodDatabaseRef: foodDatabaseRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FoodRefStruct? updateFoodRefStruct(
  FoodRefStruct? foodRef, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    foodRef
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFoodRefStructData(
  Map<String, dynamic> firestoreData,
  FoodRefStruct? foodRef,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (foodRef == null) {
    return;
  }
  if (foodRef.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && foodRef.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final foodRefData = getFoodRefFirestoreData(foodRef, forFieldValue);
  final nestedData = foodRefData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = foodRef.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFoodRefFirestoreData(
  FoodRefStruct? foodRef, [
  bool forFieldValue = false,
]) {
  if (foodRef == null) {
    return {};
  }
  final firestoreData = mapToFirestore(foodRef.toMap());

  // Add any Firestore field values
  foodRef.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFoodRefListFirestoreData(
  List<FoodRefStruct>? foodRefs,
) =>
    foodRefs?.map((e) => getFoodRefFirestoreData(e, true)).toList() ?? [];
