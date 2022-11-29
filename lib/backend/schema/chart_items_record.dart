import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chart_items_record.g.dart';

abstract class ChartItemsRecord
    implements Built<ChartItemsRecord, ChartItemsRecordBuilder> {
  static Serializer<ChartItemsRecord> get serializer =>
      _$chartItemsRecordSerializer;

  BuiltList<double>? get highMmol;

  BuiltList<double>? get lowMmol;

  int? get count;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChartItemsRecordBuilder builder) => builder
    ..highMmol = ListBuilder()
    ..lowMmol = ListBuilder()
    ..count = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chart_items');

  static Stream<ChartItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChartItemsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChartItemsRecord._();
  factory ChartItemsRecord([void Function(ChartItemsRecordBuilder) updates]) =
      _$ChartItemsRecord;

  static ChartItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChartItemsRecordData({
  int? count,
}) {
  final firestoreData = serializers.toFirestore(
    ChartItemsRecord.serializer,
    ChartItemsRecord(
      (c) => c
        ..highMmol = null
        ..lowMmol = null
        ..count = count,
    ),
  );

  return firestoreData;
}
