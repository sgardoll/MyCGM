// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultsStruct extends FFFirebaseStruct {
  SearchResultsStruct({
    DocumentReference? databaseRef,
    DocumentReference? lookupRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _databaseRef = databaseRef,
        _lookupRef = lookupRef,
        super(firestoreUtilData);

  // "databaseRef" field.
  DocumentReference? _databaseRef;
  DocumentReference? get databaseRef => _databaseRef;
  set databaseRef(DocumentReference? val) => _databaseRef = val;
  bool hasDatabaseRef() => _databaseRef != null;

  // "lookupRef" field.
  DocumentReference? _lookupRef;
  DocumentReference? get lookupRef => _lookupRef;
  set lookupRef(DocumentReference? val) => _lookupRef = val;
  bool hasLookupRef() => _lookupRef != null;

  static SearchResultsStruct fromMap(Map<String, dynamic> data) =>
      SearchResultsStruct(
        databaseRef: data['databaseRef'] as DocumentReference?,
        lookupRef: data['lookupRef'] as DocumentReference?,
      );

  static SearchResultsStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'databaseRef': _databaseRef,
        'lookupRef': _lookupRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'databaseRef': serializeParam(
          _databaseRef,
          ParamType.DocumentReference,
        ),
        'lookupRef': serializeParam(
          _lookupRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SearchResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchResultsStruct(
        databaseRef: deserializeParam(
          data['databaseRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['foodDatabase'],
        ),
        lookupRef: deserializeParam(
          data['lookupRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['lookup'],
        ),
      );

  static SearchResultsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SearchResultsStruct(
        databaseRef: convertAlgoliaParam(
          data['databaseRef'],
          ParamType.DocumentReference,
          false,
        ),
        lookupRef: convertAlgoliaParam(
          data['lookupRef'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SearchResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultsStruct &&
        databaseRef == other.databaseRef &&
        lookupRef == other.lookupRef;
  }

  @override
  int get hashCode => const ListEquality().hash([databaseRef, lookupRef]);
}

SearchResultsStruct createSearchResultsStruct({
  DocumentReference? databaseRef,
  DocumentReference? lookupRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchResultsStruct(
      databaseRef: databaseRef,
      lookupRef: lookupRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchResultsStruct? updateSearchResultsStruct(
  SearchResultsStruct? searchResults, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchResults
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchResultsStructData(
  Map<String, dynamic> firestoreData,
  SearchResultsStruct? searchResults,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchResults == null) {
    return;
  }
  if (searchResults.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchResults.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchResultsData =
      getSearchResultsFirestoreData(searchResults, forFieldValue);
  final nestedData =
      searchResultsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = searchResults.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchResultsFirestoreData(
  SearchResultsStruct? searchResults, [
  bool forFieldValue = false,
]) {
  if (searchResults == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchResults.toMap());

  // Add any Firestore field values
  searchResults.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchResultsListFirestoreData(
  List<SearchResultsStruct>? searchResultss,
) =>
    searchResultss
        ?.map((e) => getSearchResultsFirestoreData(e, true))
        .toList() ??
    [];
