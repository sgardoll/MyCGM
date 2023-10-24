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

  // "input" field.
  String? _input;
  String get input => _input ?? '';
  bool hasInput() => _input != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "openFoodFactsAPI" field.
  OpenFoodFactsApiStruct? _openFoodFactsAPI;
  OpenFoodFactsApiStruct get openFoodFactsAPI =>
      _openFoodFactsAPI ?? OpenFoodFactsApiStruct();
  bool hasOpenFoodFactsAPI() => _openFoodFactsAPI != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "nutritionPanel" field.
  String? _nutritionPanel;
  String get nutritionPanel => _nutritionPanel ?? '';
  bool hasNutritionPanel() => _nutritionPanel != null;

  // "searchList" field.
  String? _searchList;
  String get searchList => _searchList ?? '';
  bool hasSearchList() => _searchList != null;

  // "googleVisionAPIResponse" field.
  String? _googleVisionAPIResponse;
  String get googleVisionAPIResponse => _googleVisionAPIResponse ?? '';
  bool hasGoogleVisionAPIResponse() => _googleVisionAPIResponse != null;

  // "details" field.
  DetailsStruct? _details;
  DetailsStruct get details => _details ?? DetailsStruct();
  bool hasDetails() => _details != null;

  void _initializeFields() {
    _input = snapshotData['input'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _openFoodFactsAPI =
        OpenFoodFactsApiStruct.maybeFromMap(snapshotData['openFoodFactsAPI']);
    _logo = snapshotData['logo'] as String?;
    _nutritionPanel = snapshotData['nutritionPanel'] as String?;
    _searchList = snapshotData['searchList'] as String?;
    _googleVisionAPIResponse =
        snapshotData['googleVisionAPIResponse'] as String?;
    _details = DetailsStruct.maybeFromMap(snapshotData['details']);
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
  String? input,
  DateTime? timestamp,
  DocumentReference? userRef,
  OpenFoodFactsApiStruct? openFoodFactsAPI,
  String? logo,
  String? nutritionPanel,
  String? searchList,
  String? googleVisionAPIResponse,
  DetailsStruct? details,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'input': input,
      'timestamp': timestamp,
      'userRef': userRef,
      'openFoodFactsAPI': OpenFoodFactsApiStruct().toMap(),
      'logo': logo,
      'nutritionPanel': nutritionPanel,
      'searchList': searchList,
      'googleVisionAPIResponse': googleVisionAPIResponse,
      'details': DetailsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "openFoodFactsAPI" field.
  addOpenFoodFactsApiStructData(
      firestoreData, openFoodFactsAPI, 'openFoodFactsAPI');

  // Handle nested data for "details" field.
  addDetailsStructData(firestoreData, details, 'details');

  return firestoreData;
}

class LookupRecordDocumentEquality implements Equality<LookupRecord> {
  const LookupRecordDocumentEquality();

  @override
  bool equals(LookupRecord? e1, LookupRecord? e2) {
    return e1?.input == e2?.input &&
        e1?.timestamp == e2?.timestamp &&
        e1?.userRef == e2?.userRef &&
        e1?.openFoodFactsAPI == e2?.openFoodFactsAPI &&
        e1?.logo == e2?.logo &&
        e1?.nutritionPanel == e2?.nutritionPanel &&
        e1?.searchList == e2?.searchList &&
        e1?.googleVisionAPIResponse == e2?.googleVisionAPIResponse &&
        e1?.details == e2?.details;
  }

  @override
  int hash(LookupRecord? e) => const ListEquality().hash([
        e?.input,
        e?.timestamp,
        e?.userRef,
        e?.openFoodFactsAPI,
        e?.logo,
        e?.nutritionPanel,
        e?.searchList,
        e?.googleVisionAPIResponse,
        e?.details
      ]);

  @override
  bool isValidKey(Object? o) => o is LookupRecord;
}
