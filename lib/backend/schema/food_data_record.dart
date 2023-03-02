import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'food_data_record.g.dart';

abstract class FoodDataRecord
    implements Built<FoodDataRecord, FoodDataRecordBuilder> {
  static Serializer<FoodDataRecord> get serializer =>
      _$foodDataRecordSerializer;

  @BuiltValueField(wireName: 'Source')
  String? get source;

  String? get publicFoodKey;

  int? get classification;

  String? get foodName;

  String? get foodDetail1;

  String? get foodDetail2;

  String? get foodDetail3;

  String? get foodDetail4;

  String? get foodDetail5;

  String? get foodDetail6;

  String? get foodNameFull;

  double? get totalsugarsg;

  double? get addedsugarsg;

  double? get freesugarsg;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FoodDataRecordBuilder builder) => builder
    ..source = ''
    ..publicFoodKey = ''
    ..classification = 0
    ..foodName = ''
    ..foodDetail1 = ''
    ..foodDetail2 = ''
    ..foodDetail3 = ''
    ..foodDetail4 = ''
    ..foodDetail5 = ''
    ..foodDetail6 = ''
    ..foodNameFull = ''
    ..totalsugarsg = 0.0
    ..addedsugarsg = 0.0
    ..freesugarsg = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodData');

  static Stream<FoodDataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FoodDataRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FoodDataRecord._();
  factory FoodDataRecord([void Function(FoodDataRecordBuilder) updates]) =
      _$FoodDataRecord;

  static FoodDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFoodDataRecordData({
  String? source,
  String? publicFoodKey,
  int? classification,
  String? foodName,
  String? foodDetail1,
  String? foodDetail2,
  String? foodDetail3,
  String? foodDetail4,
  String? foodDetail5,
  String? foodDetail6,
  String? foodNameFull,
  double? totalsugarsg,
  double? addedsugarsg,
  double? freesugarsg,
}) {
  final firestoreData = serializers.toFirestore(
    FoodDataRecord.serializer,
    FoodDataRecord(
      (f) => f
        ..source = source
        ..publicFoodKey = publicFoodKey
        ..classification = classification
        ..foodName = foodName
        ..foodDetail1 = foodDetail1
        ..foodDetail2 = foodDetail2
        ..foodDetail3 = foodDetail3
        ..foodDetail4 = foodDetail4
        ..foodDetail5 = foodDetail5
        ..foodDetail6 = foodDetail6
        ..foodNameFull = foodNameFull
        ..totalsugarsg = totalsugarsg
        ..addedsugarsg = addedsugarsg
        ..freesugarsg = freesugarsg,
    ),
  );

  return firestoreData;
}
