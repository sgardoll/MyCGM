// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayPeriodStruct extends FFFirebaseStruct {
  DayPeriodStruct({
    DateTime? timestamp,
    FoodRefStruct? foodRef,
    FoodPeriod? timeOfDay,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timestamp = timestamp,
        _foodRef = foodRef,
        _timeOfDay = timeOfDay,
        super(firestoreUtilData);

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "foodRef" field.
  FoodRefStruct? _foodRef;
  FoodRefStruct get foodRef => _foodRef ?? FoodRefStruct();
  set foodRef(FoodRefStruct? val) => _foodRef = val;
  void updateFoodRef(Function(FoodRefStruct) updateFn) =>
      updateFn(_foodRef ??= FoodRefStruct());
  bool hasFoodRef() => _foodRef != null;

  // "timeOfDay" field.
  FoodPeriod? _timeOfDay;
  FoodPeriod? get timeOfDay => _timeOfDay;
  set timeOfDay(FoodPeriod? val) => _timeOfDay = val;
  bool hasTimeOfDay() => _timeOfDay != null;

  static DayPeriodStruct fromMap(Map<String, dynamic> data) => DayPeriodStruct(
        timestamp: data['timestamp'] as DateTime?,
        foodRef: FoodRefStruct.maybeFromMap(data['foodRef']),
        timeOfDay: deserializeEnum<FoodPeriod>(data['timeOfDay']),
      );

  static DayPeriodStruct? maybeFromMap(dynamic data) => data is Map
      ? DayPeriodStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
        'foodRef': _foodRef?.toMap(),
        'timeOfDay': _timeOfDay?.toString(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'foodRef': serializeParam(
          _foodRef,
          ParamType.DataStruct,
        ),
        'timeOfDay': serializeParam(
          _timeOfDay,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static DayPeriodStruct fromSerializableMap(Map<String, dynamic> data) =>
      DayPeriodStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        foodRef: deserializeStructParam(
          data['foodRef'],
          ParamType.DataStruct,
          false,
          structBuilder: FoodRefStruct.fromSerializableMap,
        ),
        timeOfDay: deserializeParam<FoodPeriod>(
          data['timeOfDay'],
          ParamType.Enum,
          false,
        ),
      );

  static DayPeriodStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DayPeriodStruct(
        timestamp: convertAlgoliaParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        foodRef: convertAlgoliaParam(
          data['foodRef'],
          ParamType.DataStruct,
          false,
          structBuilder: FoodRefStruct.fromAlgoliaData,
        ),
        timeOfDay: convertAlgoliaParam<FoodPeriod>(
          data['timeOfDay'],
          ParamType.Enum,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DayPeriodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DayPeriodStruct &&
        timestamp == other.timestamp &&
        foodRef == other.foodRef &&
        timeOfDay == other.timeOfDay;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([timestamp, foodRef, timeOfDay]);
}

DayPeriodStruct createDayPeriodStruct({
  DateTime? timestamp,
  FoodRefStruct? foodRef,
  FoodPeriod? timeOfDay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DayPeriodStruct(
      timestamp: timestamp,
      foodRef: foodRef ?? (clearUnsetFields ? FoodRefStruct() : null),
      timeOfDay: timeOfDay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DayPeriodStruct? updateDayPeriodStruct(
  DayPeriodStruct? dayPeriod, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dayPeriod
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDayPeriodStructData(
  Map<String, dynamic> firestoreData,
  DayPeriodStruct? dayPeriod,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dayPeriod == null) {
    return;
  }
  if (dayPeriod.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dayPeriod.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dayPeriodData = getDayPeriodFirestoreData(dayPeriod, forFieldValue);
  final nestedData = dayPeriodData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dayPeriod.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDayPeriodFirestoreData(
  DayPeriodStruct? dayPeriod, [
  bool forFieldValue = false,
]) {
  if (dayPeriod == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dayPeriod.toMap());

  // Handle nested data for "foodRef" field.
  addFoodRefStructData(
    firestoreData,
    dayPeriod.hasFoodRef() ? dayPeriod.foodRef : null,
    'foodRef',
    forFieldValue,
  );

  // Add any Firestore field values
  dayPeriod.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDayPeriodListFirestoreData(
  List<DayPeriodStruct>? dayPeriods,
) =>
    dayPeriods?.map((e) => getDayPeriodFirestoreData(e, true)).toList() ?? [];
