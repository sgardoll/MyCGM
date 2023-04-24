import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chart_data_record.g.dart';

abstract class ChartDataRecord
    implements Built<ChartDataRecord, ChartDataRecordBuilder> {
  static Serializer<ChartDataRecord> get serializer =>
      _$chartDataRecordSerializer;

  DocumentReference? get userRef;

  BuiltList<int>? get sgv;

  BuiltList<int>? get date;

  BuiltList<String>? get dateString;

  BuiltList<String>? get direction;

  BuiltList<String>? get device;

  DateTime? get lastApiGet;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChartDataRecordBuilder builder) => builder
    ..sgv = ListBuilder()
    ..date = ListBuilder()
    ..dateString = ListBuilder()
    ..direction = ListBuilder()
    ..device = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chartData');

  static Stream<ChartDataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChartDataRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChartDataRecord._();
  factory ChartDataRecord([void Function(ChartDataRecordBuilder) updates]) =
      _$ChartDataRecord;

  static ChartDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChartDataRecordData({
  DocumentReference? userRef,
  DateTime? lastApiGet,
}) {
  final firestoreData = serializers.toFirestore(
    ChartDataRecord.serializer,
    ChartDataRecord(
      (c) => c
        ..userRef = userRef
        ..sgv = null
        ..date = null
        ..dateString = null
        ..direction = null
        ..device = null
        ..lastApiGet = lastApiGet,
    ),
  );

  return firestoreData;
}
