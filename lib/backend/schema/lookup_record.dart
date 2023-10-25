import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LookupRecord extends FirestoreRecord {
  LookupRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "nutritionPanel" field.
  String? _nutritionPanel;
  String get nutritionPanel => _nutritionPanel ?? '';
  bool hasNutritionPanel() => _nutritionPanel != null;

  // "googleVisionAPIResponse" field.
  String? _googleVisionAPIResponse;
  String get googleVisionAPIResponse => _googleVisionAPIResponse ?? '';
  bool hasGoogleVisionAPIResponse() => _googleVisionAPIResponse != null;

  // "openFoodFacts" field.
  OpenFoodFactsApiStruct? _openFoodFacts;
  OpenFoodFactsApiStruct get openFoodFacts =>
      _openFoodFacts ?? OpenFoodFactsApiStruct();
  bool hasOpenFoodFacts() => _openFoodFacts != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "trivia" field.
  String? _trivia;
  String get trivia => _trivia ?? '';
  bool hasTrivia() => _trivia != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  // "timestamp" field.
  int? _timestamp;
  int get timestamp => _timestamp ?? 0;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _logo = snapshotData['logo'] as String?;
    _nutritionPanel = snapshotData['nutritionPanel'] as String?;
    _googleVisionAPIResponse =
        snapshotData['googleVisionAPIResponse'] as String?;
    _openFoodFacts =
        OpenFoodFactsApiStruct.maybeFromMap(snapshotData['openFoodFacts']);
    _code = snapshotData['code'] as String?;
    _name = snapshotData['name'] as String?;
    _brand = snapshotData['brand'] as String?;
    _trivia = snapshotData['trivia'] as String?;
    _size = snapshotData['size'] as String?;
    _timestamp = castToType<int>(snapshotData['timestamp']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lookup');

  static Stream<LookupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LookupRecord.fromSnapshot(s));

  static Future<LookupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LookupRecord.fromSnapshot(s));

  static LookupRecord fromSnapshot(DocumentSnapshot snapshot) => LookupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LookupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LookupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LookupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LookupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLookupRecordData({
  DocumentReference? userRef,
  String? logo,
  String? nutritionPanel,
  String? googleVisionAPIResponse,
  OpenFoodFactsApiStruct? openFoodFacts,
  String? code,
  String? name,
  String? brand,
  String? trivia,
  String? size,
  int? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'logo': logo,
      'nutritionPanel': nutritionPanel,
      'googleVisionAPIResponse': googleVisionAPIResponse,
      'openFoodFacts': OpenFoodFactsApiStruct().toMap(),
      'code': code,
      'name': name,
      'brand': brand,
      'trivia': trivia,
      'size': size,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  // Handle nested data for "openFoodFacts" field.
  addOpenFoodFactsApiStructData(firestoreData, openFoodFacts, 'openFoodFacts');

  return firestoreData;
}

class LookupRecordDocumentEquality implements Equality<LookupRecord> {
  const LookupRecordDocumentEquality();

  @override
  bool equals(LookupRecord? e1, LookupRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.logo == e2?.logo &&
        e1?.nutritionPanel == e2?.nutritionPanel &&
        e1?.googleVisionAPIResponse == e2?.googleVisionAPIResponse &&
        e1?.openFoodFacts == e2?.openFoodFacts &&
        e1?.code == e2?.code &&
        e1?.name == e2?.name &&
        e1?.brand == e2?.brand &&
        e1?.trivia == e2?.trivia &&
        e1?.size == e2?.size &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(LookupRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.logo,
        e?.nutritionPanel,
        e?.googleVisionAPIResponse,
        e?.openFoodFacts,
        e?.code,
        e?.name,
        e?.brand,
        e?.trivia,
        e?.size,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is LookupRecord;
}
