import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodDatabaseRecord extends FirestoreRecord {
  FoodDatabaseRecord._(
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

  // "energyWithDietaryFibreEquatedKJ" field.
  double? _energyWithDietaryFibreEquatedKJ;
  double get energyWithDietaryFibreEquatedKJ =>
      _energyWithDietaryFibreEquatedKJ ?? 0.0;
  bool hasEnergyWithDietaryFibreEquatedKJ() =>
      _energyWithDietaryFibreEquatedKJ != null;

  // "energyWithoutDietaryFibreEquatedKJ" field.
  double? _energyWithoutDietaryFibreEquatedKJ;
  double get energyWithoutDietaryFibreEquatedKJ =>
      _energyWithoutDietaryFibreEquatedKJ ?? 0.0;
  bool hasEnergyWithoutDietaryFibreEquatedKJ() =>
      _energyWithoutDietaryFibreEquatedKJ != null;

  // "moistureWaterG" field.
  double? _moistureWaterG;
  double get moistureWaterG => _moistureWaterG ?? 0.0;
  bool hasMoistureWaterG() => _moistureWaterG != null;

  // "proteinG" field.
  double? _proteinG;
  double get proteinG => _proteinG ?? 0.0;
  bool hasProteinG() => _proteinG != null;

  // "nitrogenG" field.
  double? _nitrogenG;
  double get nitrogenG => _nitrogenG ?? 0.0;
  bool hasNitrogenG() => _nitrogenG != null;

  // "fatTotalG" field.
  double? _fatTotalG;
  double get fatTotalG => _fatTotalG ?? 0.0;
  bool hasFatTotalG() => _fatTotalG != null;

  // "ashG" field.
  double? _ashG;
  double get ashG => _ashG ?? 0.0;
  bool hasAshG() => _ashG != null;

  // "totalDietaryFibreG" field.
  double? _totalDietaryFibreG;
  double get totalDietaryFibreG => _totalDietaryFibreG ?? 0.0;
  bool hasTotalDietaryFibreG() => _totalDietaryFibreG != null;

  // "alcoholG" field.
  double? _alcoholG;
  double get alcoholG => _alcoholG ?? 0.0;
  bool hasAlcoholG() => _alcoholG != null;

  // "fructoseG" field.
  double? _fructoseG;
  double get fructoseG => _fructoseG ?? 0.0;
  bool hasFructoseG() => _fructoseG != null;

  // "glycemicIndex" field.
  double? _glycemicIndex;
  double get glycemicIndex => _glycemicIndex ?? 0.0;
  bool hasGlycemicIndex() => _glycemicIndex != null;

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
    _energyWithDietaryFibreEquatedKJ =
        castToType<double>(snapshotData['energyWithDietaryFibreEquatedKJ']);
    _energyWithoutDietaryFibreEquatedKJ =
        castToType<double>(snapshotData['energyWithoutDietaryFibreEquatedKJ']);
    _moistureWaterG = castToType<double>(snapshotData['moistureWaterG']);
    _proteinG = castToType<double>(snapshotData['proteinG']);
    _nitrogenG = castToType<double>(snapshotData['nitrogenG']);
    _fatTotalG = castToType<double>(snapshotData['fatTotalG']);
    _ashG = castToType<double>(snapshotData['ashG']);
    _totalDietaryFibreG =
        castToType<double>(snapshotData['totalDietaryFibreG']);
    _alcoholG = castToType<double>(snapshotData['alcoholG']);
    _fructoseG = castToType<double>(snapshotData['fructoseG']);
    _glycemicIndex = castToType<double>(snapshotData['glycemicIndex']);
    _totalsugarsg = castToType<double>(snapshotData['totalsugarsg']);
    _addedsugarsg = castToType<double>(snapshotData['addedsugarsg']);
    _freesugarsg = castToType<double>(snapshotData['freesugarsg']);
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodDatabase');

  static Stream<FoodDatabaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodDatabaseRecord.fromSnapshot(s));

  static Future<FoodDatabaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodDatabaseRecord.fromSnapshot(s));

  static FoodDatabaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodDatabaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodDatabaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodDatabaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodDatabaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodDatabaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodDatabaseRecordData({
  String? source,
  String? publicFoodKey,
  int? classification,
  String? foodName,
  double? energyWithDietaryFibreEquatedKJ,
  double? energyWithoutDietaryFibreEquatedKJ,
  double? moistureWaterG,
  double? proteinG,
  double? nitrogenG,
  double? fatTotalG,
  double? ashG,
  double? totalDietaryFibreG,
  double? alcoholG,
  double? fructoseG,
  double? glycemicIndex,
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
      'energyWithDietaryFibreEquatedKJ': energyWithDietaryFibreEquatedKJ,
      'energyWithoutDietaryFibreEquatedKJ': energyWithoutDietaryFibreEquatedKJ,
      'moistureWaterG': moistureWaterG,
      'proteinG': proteinG,
      'nitrogenG': nitrogenG,
      'fatTotalG': fatTotalG,
      'ashG': ashG,
      'totalDietaryFibreG': totalDietaryFibreG,
      'alcoholG': alcoholG,
      'fructoseG': fructoseG,
      'glycemicIndex': glycemicIndex,
      'totalsugarsg': totalsugarsg,
      'addedsugarsg': addedsugarsg,
      'freesugarsg': freesugarsg,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodDatabaseRecordDocumentEquality
    implements Equality<FoodDatabaseRecord> {
  const FoodDatabaseRecordDocumentEquality();

  @override
  bool equals(FoodDatabaseRecord? e1, FoodDatabaseRecord? e2) {
    return e1?.source == e2?.source &&
        e1?.publicFoodKey == e2?.publicFoodKey &&
        e1?.classification == e2?.classification &&
        e1?.foodName == e2?.foodName &&
        e1?.energyWithDietaryFibreEquatedKJ ==
            e2?.energyWithDietaryFibreEquatedKJ &&
        e1?.energyWithoutDietaryFibreEquatedKJ ==
            e2?.energyWithoutDietaryFibreEquatedKJ &&
        e1?.moistureWaterG == e2?.moistureWaterG &&
        e1?.proteinG == e2?.proteinG &&
        e1?.nitrogenG == e2?.nitrogenG &&
        e1?.fatTotalG == e2?.fatTotalG &&
        e1?.ashG == e2?.ashG &&
        e1?.totalDietaryFibreG == e2?.totalDietaryFibreG &&
        e1?.alcoholG == e2?.alcoholG &&
        e1?.fructoseG == e2?.fructoseG &&
        e1?.glycemicIndex == e2?.glycemicIndex &&
        e1?.totalsugarsg == e2?.totalsugarsg &&
        e1?.addedsugarsg == e2?.addedsugarsg &&
        e1?.freesugarsg == e2?.freesugarsg &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(FoodDatabaseRecord? e) => const ListEquality().hash([
        e?.source,
        e?.publicFoodKey,
        e?.classification,
        e?.foodName,
        e?.energyWithDietaryFibreEquatedKJ,
        e?.energyWithoutDietaryFibreEquatedKJ,
        e?.moistureWaterG,
        e?.proteinG,
        e?.nitrogenG,
        e?.fatTotalG,
        e?.ashG,
        e?.totalDietaryFibreG,
        e?.alcoholG,
        e?.fructoseG,
        e?.glycemicIndex,
        e?.totalsugarsg,
        e?.addedsugarsg,
        e?.freesugarsg,
        e?.icon
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodDatabaseRecord;
}
