import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'food_data_record.g.dart';

abstract class FoodDataRecord
    implements Built<FoodDataRecord, FoodDataRecordBuilder> {
  static Serializer<FoodDataRecord> get serializer =>
      _$foodDataRecordSerializer;

  @BuiltValueField(wireName: 'PublicFoodKey')
  String? get publicFoodKey;

  @BuiltValueField(wireName: 'Classification')
  int? get classification;

  @BuiltValueField(wireName: 'FoodName')
  String? get foodName;

  @BuiltValueField(wireName: 'Totalsugarsg')
  double? get totalsugarsg;

  @BuiltValueField(wireName: 'Addedsugarsg')
  double? get addedsugarsg;

  @BuiltValueField(wireName: 'Freesugarsg')
  double? get freesugarsg;

  @BuiltValueField(wireName: 'FoodDetail1')
  String? get foodDetail1;

  @BuiltValueField(wireName: 'FoodDetail2')
  String? get foodDetail2;

  @BuiltValueField(wireName: 'FoodDetail3')
  String? get foodDetail3;

  @BuiltValueField(wireName: 'FoodDetail4')
  String? get foodDetail4;

  @BuiltValueField(wireName: 'FoodDetail5')
  String? get foodDetail5;

  @BuiltValueField(wireName: 'FoodDetail6')
  String? get foodDetail6;

  @BuiltValueField(wireName: 'FoodNameFull')
  String? get foodNameFull;

  @BuiltValueField(wireName: 'Source')
  String? get source;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FoodDataRecordBuilder builder) => builder
    ..publicFoodKey = ''
    ..classification = 0
    ..foodName = ''
    ..totalsugarsg = 0.0
    ..addedsugarsg = 0.0
    ..freesugarsg = 0.0
    ..foodDetail1 = ''
    ..foodDetail2 = ''
    ..foodDetail3 = ''
    ..foodDetail4 = ''
    ..foodDetail5 = ''
    ..foodDetail6 = ''
    ..foodNameFull = ''
    ..source = '';

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
  String? publicFoodKey,
  int? classification,
  String? foodName,
  double? totalsugarsg,
  double? addedsugarsg,
  double? freesugarsg,
  String? foodDetail1,
  String? foodDetail2,
  String? foodDetail3,
  String? foodDetail4,
  String? foodDetail5,
  String? foodDetail6,
  String? foodNameFull,
  String? source,
}) {
  final firestoreData = serializers.toFirestore(
    FoodDataRecord.serializer,
    FoodDataRecord(
      (f) => f
        ..publicFoodKey = publicFoodKey
        ..classification = classification
        ..foodName = foodName
        ..totalsugarsg = totalsugarsg
        ..addedsugarsg = addedsugarsg
        ..freesugarsg = freesugarsg
        ..foodDetail1 = foodDetail1
        ..foodDetail2 = foodDetail2
        ..foodDetail3 = foodDetail3
        ..foodDetail4 = foodDetail4
        ..foodDetail5 = foodDetail5
        ..foodDetail6 = foodDetail6
        ..foodNameFull = foodNameFull
        ..source = source,
    ),
  );

  return firestoreData;
}
