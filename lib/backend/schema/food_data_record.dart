import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodDataRecord extends FirestoreRecord {
  FoodDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "publicFoodKey" field.
  String? _publicFoodKey;
  String get publicFoodKey => _publicFoodKey ?? '';
  bool hasPublicFoodKey() => _publicFoodKey != null;

  // "classification" field.
  int? _classification;
  int get classification => _classification ?? 0;
  bool hasClassification() => _classification != null;

  // "foodName" field.
  String? _foodName;
  String get foodName => _foodName ?? '';
  bool hasFoodName() => _foodName != null;

  // "foodDetail1" field.
  String? _foodDetail1;
  String get foodDetail1 => _foodDetail1 ?? '';
  bool hasFoodDetail1() => _foodDetail1 != null;

  // "foodDetail2" field.
  String? _foodDetail2;
  String get foodDetail2 => _foodDetail2 ?? '';
  bool hasFoodDetail2() => _foodDetail2 != null;

  // "foodDetail3" field.
  String? _foodDetail3;
  String get foodDetail3 => _foodDetail3 ?? '';
  bool hasFoodDetail3() => _foodDetail3 != null;

  // "foodDetail4" field.
  String? _foodDetail4;
  String get foodDetail4 => _foodDetail4 ?? '';
  bool hasFoodDetail4() => _foodDetail4 != null;

  // "foodDetail5" field.
  String? _foodDetail5;
  String get foodDetail5 => _foodDetail5 ?? '';
  bool hasFoodDetail5() => _foodDetail5 != null;

  // "foodDetail6" field.
  String? _foodDetail6;
  String get foodDetail6 => _foodDetail6 ?? '';
  bool hasFoodDetail6() => _foodDetail6 != null;

  // "foodNameFull" field.
  String? _foodNameFull;
  String get foodNameFull => _foodNameFull ?? '';
  bool hasFoodNameFull() => _foodNameFull != null;

  // "totalsugarsg" field.
  double? _totalsugarsg;
  double get totalsugarsg => _totalsugarsg ?? 0.0;
  bool hasTotalsugarsg() => _totalsugarsg != null;

  // "addedsugarsg" field.
  double? _addedsugarsg;
  double get addedsugarsg => _addedsugarsg ?? 0.0;
  bool hasAddedsugarsg() => _addedsugarsg != null;

  // "freesugarsg" field.
  double? _freesugarsg;
  double get freesugarsg => _freesugarsg ?? 0.0;
  bool hasFreesugarsg() => _freesugarsg != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _source = snapshotData['Source'] as String?;
    _publicFoodKey = snapshotData['publicFoodKey'] as String?;
    _classification = castToType<int>(snapshotData['classification']);
    _foodName = snapshotData['foodName'] as String?;
    _foodDetail1 = snapshotData['foodDetail1'] as String?;
    _foodDetail2 = snapshotData['foodDetail2'] as String?;
    _foodDetail3 = snapshotData['foodDetail3'] as String?;
    _foodDetail4 = snapshotData['foodDetail4'] as String?;
    _foodDetail5 = snapshotData['foodDetail5'] as String?;
    _foodDetail6 = snapshotData['foodDetail6'] as String?;
    _foodNameFull = snapshotData['foodNameFull'] as String?;
    _totalsugarsg = castToType<double>(snapshotData['totalsugarsg']);
    _addedsugarsg = castToType<double>(snapshotData['addedsugarsg']);
    _freesugarsg = castToType<double>(snapshotData['freesugarsg']);
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodData');

  static Stream<FoodDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodDataRecord.fromSnapshot(s));

  static Future<FoodDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodDataRecord.fromSnapshot(s));

  static FoodDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodDataRecordData({
  String? source,
  String? publicFoodKey,
  int? classification,
  String? foodName,
  String? foodDetail1,
  String? foodDetail2,
  String? foodDetail3,
  String? foodDetail4,
  String? foodDetail5,
  String? foodDetail6,
  String? foodNameFull,
  double? totalsugarsg,
  double? addedsugarsg,
  double? freesugarsg,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Source': source,
      'publicFoodKey': publicFoodKey,
      'classification': classification,
      'foodName': foodName,
      'foodDetail1': foodDetail1,
      'foodDetail2': foodDetail2,
      'foodDetail3': foodDetail3,
      'foodDetail4': foodDetail4,
      'foodDetail5': foodDetail5,
      'foodDetail6': foodDetail6,
      'foodNameFull': foodNameFull,
      'totalsugarsg': totalsugarsg,
      'addedsugarsg': addedsugarsg,
      'freesugarsg': freesugarsg,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodDataRecordDocumentEquality implements Equality<FoodDataRecord> {
  const FoodDataRecordDocumentEquality();

  @override
  bool equals(FoodDataRecord? e1, FoodDataRecord? e2) {
    return e1?.source == e2?.source &&
        e1?.publicFoodKey == e2?.publicFoodKey &&
        e1?.classification == e2?.classification &&
        e1?.foodName == e2?.foodName &&
        e1?.foodDetail1 == e2?.foodDetail1 &&
        e1?.foodDetail2 == e2?.foodDetail2 &&
        e1?.foodDetail3 == e2?.foodDetail3 &&
        e1?.foodDetail4 == e2?.foodDetail4 &&
        e1?.foodDetail5 == e2?.foodDetail5 &&
        e1?.foodDetail6 == e2?.foodDetail6 &&
        e1?.foodNameFull == e2?.foodNameFull &&
        e1?.totalsugarsg == e2?.totalsugarsg &&
        e1?.addedsugarsg == e2?.addedsugarsg &&
        e1?.freesugarsg == e2?.freesugarsg &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(FoodDataRecord? e) => const ListEquality().hash([
        e?.source,
        e?.publicFoodKey,
        e?.classification,
        e?.foodName,
        e?.foodDetail1,
        e?.foodDetail2,
        e?.foodDetail3,
        e?.foodDetail4,
        e?.foodDetail5,
        e?.foodDetail6,
        e?.foodNameFull,
        e?.totalsugarsg,
        e?.addedsugarsg,
        e?.freesugarsg,
        e?.icon
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodDataRecord;
}
