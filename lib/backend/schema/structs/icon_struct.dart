import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'icon_struct.g.dart';

abstract class IconStruct implements Built<IconStruct, IconStructBuilder> {
  static Serializer<IconStruct> get serializer => _$iconStructSerializer;

  BuiltList<IconStruct> get items;

  @BuiltValueField(wireName: 'Icon')
  IconStruct get icon;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(IconStructBuilder builder) => builder
    ..items = ListBuilder()
    ..icon = IconStructBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  IconStruct._();
  factory IconStruct([void Function(IconStructBuilder) updates]) = _$IconStruct;
}

IconStruct createIconStruct({
  IconStruct? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IconStruct(
      (i) => i
        ..items = null
        ..icon = icon?.toBuilder() ?? IconStructBuilder()
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

IconStruct? updateIconStruct(
  IconStruct? icon, {
  bool clearUnsetFields = true,
}) =>
    icon != null
        ? (icon.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addIconStructData(
  Map<String, dynamic> firestoreData,
  IconStruct? icon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (icon == null) {
    return;
  }
  if (icon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && icon.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final iconData = getIconFirestoreData(icon, forFieldValue);
  final nestedData = iconData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = icon.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getIconFirestoreData(
  IconStruct? icon, [
  bool forFieldValue = false,
]) {
  if (icon == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(IconStruct.serializer, icon);

  // Handle nested data for "Icon" field.
  addIconStructData(firestoreData, icon.icon, 'Icon', forFieldValue);

  // Add any Firestore field values
  icon.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIconListFirestoreData(
  List<IconStruct>? icons,
) =>
    icons?.map((i) => getIconFirestoreData(i, true)).toList() ?? [];
