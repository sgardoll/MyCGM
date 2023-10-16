// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrandfetchAPIStruct extends FFFirebaseStruct {
  BrandfetchAPIStruct({
    String? brandId,
    String? domain,
    String? icon,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brandId = brandId,
        _domain = domain,
        _icon = icon,
        _name = name,
        super(firestoreUtilData);

  // "brandId" field.
  String? _brandId;
  String get brandId => _brandId ?? '';
  set brandId(String? val) => _brandId = val;
  bool hasBrandId() => _brandId != null;

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  set domain(String? val) => _domain = val;
  bool hasDomain() => _domain != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;
  bool hasIcon() => _icon != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static BrandfetchAPIStruct fromMap(Map<String, dynamic> data) =>
      BrandfetchAPIStruct(
        brandId: data['brandId'] as String?,
        domain: data['domain'] as String?,
        icon: data['icon'] as String?,
        name: data['name'] as String?,
      );

  static BrandfetchAPIStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BrandfetchAPIStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'brandId': _brandId,
        'domain': _domain,
        'icon': _icon,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brandId': serializeParam(
          _brandId,
          ParamType.String,
        ),
        'domain': serializeParam(
          _domain,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static BrandfetchAPIStruct fromSerializableMap(Map<String, dynamic> data) =>
      BrandfetchAPIStruct(
        brandId: deserializeParam(
          data['brandId'],
          ParamType.String,
          false,
        ),
        domain: deserializeParam(
          data['domain'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BrandfetchAPIStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BrandfetchAPIStruct &&
        brandId == other.brandId &&
        domain == other.domain &&
        icon == other.icon &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([brandId, domain, icon, name]);
}

BrandfetchAPIStruct createBrandfetchAPIStruct({
  String? brandId,
  String? domain,
  String? icon,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BrandfetchAPIStruct(
      brandId: brandId,
      domain: domain,
      icon: icon,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BrandfetchAPIStruct? updateBrandfetchAPIStruct(
  BrandfetchAPIStruct? brandfetchAPI, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    brandfetchAPI
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBrandfetchAPIStructData(
  Map<String, dynamic> firestoreData,
  BrandfetchAPIStruct? brandfetchAPI,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (brandfetchAPI == null) {
    return;
  }
  if (brandfetchAPI.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && brandfetchAPI.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final brandfetchAPIData =
      getBrandfetchAPIFirestoreData(brandfetchAPI, forFieldValue);
  final nestedData =
      brandfetchAPIData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = brandfetchAPI.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBrandfetchAPIFirestoreData(
  BrandfetchAPIStruct? brandfetchAPI, [
  bool forFieldValue = false,
]) {
  if (brandfetchAPI == null) {
    return {};
  }
  final firestoreData = mapToFirestore(brandfetchAPI.toMap());

  // Add any Firestore field values
  brandfetchAPI.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBrandfetchAPIListFirestoreData(
  List<BrandfetchAPIStruct>? brandfetchAPIs,
) =>
    brandfetchAPIs
        ?.map((e) => getBrandfetchAPIFirestoreData(e, true))
        .toList() ??
    [];
