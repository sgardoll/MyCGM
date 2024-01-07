import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "nutritionPanel" field.
  String? _nutritionPanel;
  String get nutritionPanel => _nutritionPanel ?? '';
  bool hasNutritionPanel() => _nutritionPanel != null;

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

  // "googleVisionResponse" field.
  String? _googleVisionResponse;
  String get googleVisionResponse => _googleVisionResponse ?? '';
  bool hasGoogleVisionResponse() => _googleVisionResponse != null;

  // "openFoodFacts" field.
  NutrimentsStruct? _openFoodFacts;
  NutrimentsStruct get openFoodFacts => _openFoodFacts ?? NutrimentsStruct();
  bool hasOpenFoodFacts() => _openFoodFacts != null;

  // "blurHash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  bool hasBlurHash() => _blurHash != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _nutritionPanel = snapshotData['nutritionPanel'] as String?;
    _code = snapshotData['code'] as String?;
    _name = snapshotData['name'] as String?;
    _brand = snapshotData['brand'] as String?;
    _trivia = snapshotData['trivia'] as String?;
    _size = snapshotData['size'] as String?;
    _timestamp = castToType<int>(snapshotData['timestamp']);
    _googleVisionResponse = snapshotData['googleVisionResponse'] as String?;
    _openFoodFacts =
        NutrimentsStruct.maybeFromMap(snapshotData['openFoodFacts']);
    _blurHash = snapshotData['blurHash'] as String?;
    _userId = snapshotData['userId'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
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

  static LookupRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      LookupRecord.getDocumentFromData(
        {
          'userRef': convertAlgoliaParam(
            snapshot.data['userRef'],
            ParamType.DocumentReference,
            false,
          ),
          'nutritionPanel': snapshot.data['nutritionPanel'],
          'code': snapshot.data['code'],
          'name': snapshot.data['name'],
          'brand': snapshot.data['brand'],
          'trivia': snapshot.data['trivia'],
          'size': snapshot.data['size'],
          'timestamp': convertAlgoliaParam(
            snapshot.data['timestamp'],
            ParamType.int,
            false,
          ),
          'googleVisionResponse': snapshot.data['googleVisionResponse'],
          'openFoodFacts': NutrimentsStruct.fromAlgoliaData(
                  snapshot.data['openFoodFacts'] ?? {})
              .toMap(),
          'blurHash': snapshot.data['blurHash'],
          'userId': snapshot.data['userId'],
          'imageUrl': snapshot.data['imageUrl'],
        },
        LookupRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<LookupRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'lookup',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  String? nutritionPanel,
  String? code,
  String? name,
  String? brand,
  String? trivia,
  String? size,
  int? timestamp,
  String? googleVisionResponse,
  NutrimentsStruct? openFoodFacts,
  String? blurHash,
  String? userId,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'nutritionPanel': nutritionPanel,
      'code': code,
      'name': name,
      'brand': brand,
      'trivia': trivia,
      'size': size,
      'timestamp': timestamp,
      'googleVisionResponse': googleVisionResponse,
      'openFoodFacts': NutrimentsStruct().toMap(),
      'blurHash': blurHash,
      'userId': userId,
      'imageUrl': imageUrl,
    }.withoutNulls,
  );

  // Handle nested data for "openFoodFacts" field.
  addNutrimentsStructData(firestoreData, openFoodFacts, 'openFoodFacts');

  return firestoreData;
}

class LookupRecordDocumentEquality implements Equality<LookupRecord> {
  const LookupRecordDocumentEquality();

  @override
  bool equals(LookupRecord? e1, LookupRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.nutritionPanel == e2?.nutritionPanel &&
        e1?.code == e2?.code &&
        e1?.name == e2?.name &&
        e1?.brand == e2?.brand &&
        e1?.trivia == e2?.trivia &&
        e1?.size == e2?.size &&
        e1?.timestamp == e2?.timestamp &&
        e1?.googleVisionResponse == e2?.googleVisionResponse &&
        e1?.openFoodFacts == e2?.openFoodFacts &&
        e1?.blurHash == e2?.blurHash &&
        e1?.userId == e2?.userId &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(LookupRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.nutritionPanel,
        e?.code,
        e?.name,
        e?.brand,
        e?.trivia,
        e?.size,
        e?.timestamp,
        e?.googleVisionResponse,
        e?.openFoodFacts,
        e?.blurHash,
        e?.userId,
        e?.imageUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is LookupRecord;
}
