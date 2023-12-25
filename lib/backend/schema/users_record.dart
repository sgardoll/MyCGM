import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "nightscout" field.
  String? _nightscout;
  String get nightscout => _nightscout ?? '';
  bool hasNightscout() => _nightscout != null;

  // "api_key" field.
  String? _apiKey;
  String get apiKey => _apiKey ?? '';
  bool hasApiKey() => _apiKey != null;

  // "units" field.
  String? _units;
  String get units => _units ?? '';
  bool hasUnits() => _units != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "high_value" field.
  double? _highValue;
  double get highValue => _highValue ?? 0.0;
  bool hasHighValue() => _highValue != null;

  // "low_value" field.
  double? _lowValue;
  double get lowValue => _lowValue ?? 0.0;
  bool hasLowValue() => _lowValue != null;

  // "carbRatio" field.
  double? _carbRatio;
  double get carbRatio => _carbRatio ?? 0.0;
  bool hasCarbRatio() => _carbRatio != null;

  // "hasCgmFeatures" field.
  bool? _hasCgmFeatures;
  bool get hasCgmFeatures => _hasCgmFeatures ?? false;
  bool hasHasCgmFeatures() => _hasCgmFeatures != null;

  // "dailyFood" field.
  List<DayPeriodStruct>? _dailyFood;
  List<DayPeriodStruct> get dailyFood => _dailyFood ?? const [];
  bool hasDailyFood() => _dailyFood != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nightscout = snapshotData['nightscout'] as String?;
    _apiKey = snapshotData['api_key'] as String?;
    _units = snapshotData['units'] as String?;
    _token = snapshotData['token'] as String?;
    _highValue = castToType<double>(snapshotData['high_value']);
    _lowValue = castToType<double>(snapshotData['low_value']);
    _carbRatio = castToType<double>(snapshotData['carbRatio']);
    _hasCgmFeatures = snapshotData['hasCgmFeatures'] as bool?;
    _dailyFood = getStructList(
      snapshotData['dailyFood'],
      DayPeriodStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nightscout,
  String? apiKey,
  String? units,
  String? token,
  double? highValue,
  double? lowValue,
  double? carbRatio,
  bool? hasCgmFeatures,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'nightscout': nightscout,
      'api_key': apiKey,
      'units': units,
      'token': token,
      'high_value': highValue,
      'low_value': lowValue,
      'carbRatio': carbRatio,
      'hasCgmFeatures': hasCgmFeatures,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nightscout == e2?.nightscout &&
        e1?.apiKey == e2?.apiKey &&
        e1?.units == e2?.units &&
        e1?.token == e2?.token &&
        e1?.highValue == e2?.highValue &&
        e1?.lowValue == e2?.lowValue &&
        e1?.carbRatio == e2?.carbRatio &&
        e1?.hasCgmFeatures == e2?.hasCgmFeatures &&
        listEquality.equals(e1?.dailyFood, e2?.dailyFood);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.nightscout,
        e?.apiKey,
        e?.units,
        e?.token,
        e?.highValue,
        e?.lowValue,
        e?.carbRatio,
        e?.hasCgmFeatures,
        e?.dailyFood
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
