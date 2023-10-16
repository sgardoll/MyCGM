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

  // "chatGptResponse" field.
  ChatGptResponseStruct? _chatGptResponse;
  ChatGptResponseStruct get chatGptResponse =>
      _chatGptResponse ?? ChatGptResponseStruct();
  bool hasChatGptResponse() => _chatGptResponse != null;

  // "openFoodFactsAPI" field.
  OpenFoodFactsApiStruct? _openFoodFactsAPI;
  OpenFoodFactsApiStruct get openFoodFactsAPI =>
      _openFoodFactsAPI ?? OpenFoodFactsApiStruct();
  bool hasOpenFoodFactsAPI() => _openFoodFactsAPI != null;

  // "nutInfoImage" field.
  List<String>? _nutInfoImage;
  List<String> get nutInfoImage => _nutInfoImage ?? const [];
  bool hasNutInfoImage() => _nutInfoImage != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _input = snapshotData['input'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _chatGptResponse =
        ChatGptResponseStruct.maybeFromMap(snapshotData['chatGptResponse']);
    _openFoodFactsAPI =
        OpenFoodFactsApiStruct.maybeFromMap(snapshotData['openFoodFactsAPI']);
    _nutInfoImage = getDataList(snapshotData['nutInfoImage']);
    _logo = snapshotData['logo'] as String?;
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
  ChatGptResponseStruct? chatGptResponse,
  OpenFoodFactsApiStruct? openFoodFactsAPI,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'input': input,
      'timestamp': timestamp,
      'userRef': userRef,
      'chatGptResponse': ChatGptResponseStruct().toMap(),
      'openFoodFactsAPI': OpenFoodFactsApiStruct().toMap(),
      'logo': logo,
    }.withoutNulls,
  );

  // Handle nested data for "chatGptResponse" field.
  addChatGptResponseStructData(
      firestoreData, chatGptResponse, 'chatGptResponse');

  // Handle nested data for "openFoodFactsAPI" field.
  addOpenFoodFactsApiStructData(
      firestoreData, openFoodFactsAPI, 'openFoodFactsAPI');

  return firestoreData;
}

class LookupRecordDocumentEquality implements Equality<LookupRecord> {
  const LookupRecordDocumentEquality();

  @override
  bool equals(LookupRecord? e1, LookupRecord? e2) {
    const listEquality = ListEquality();
    return e1?.input == e2?.input &&
        e1?.timestamp == e2?.timestamp &&
        e1?.userRef == e2?.userRef &&
        e1?.chatGptResponse == e2?.chatGptResponse &&
        e1?.openFoodFactsAPI == e2?.openFoodFactsAPI &&
        listEquality.equals(e1?.nutInfoImage, e2?.nutInfoImage) &&
        e1?.logo == e2?.logo;
  }

  @override
  int hash(LookupRecord? e) => const ListEquality().hash([
        e?.input,
        e?.timestamp,
        e?.userRef,
        e?.chatGptResponse,
        e?.openFoodFactsAPI,
        e?.nutInfoImage,
        e?.logo
      ]);

  @override
  bool isValidKey(Object? o) => o is LookupRecord;
}
