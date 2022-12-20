// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodDataRecord> _$foodDataRecordSerializer =
    new _$FoodDataRecordSerializer();

class _$FoodDataRecordSerializer
    implements StructuredSerializer<FoodDataRecord> {
  @override
  final Iterable<Type> types = const [FoodDataRecord, _$FoodDataRecord];
  @override
  final String wireName = 'FoodDataRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FoodDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.publicFoodKey;
    if (value != null) {
      result
        ..add('PublicFoodKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.classification;
    if (value != null) {
      result
        ..add('Classification')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodName;
    if (value != null) {
      result
        ..add('FoodName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalsugarsg;
    if (value != null) {
      result
        ..add('Totalsugarsg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.addedsugarsg;
    if (value != null) {
      result
        ..add('Addedsugarsg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.freesugarsg;
    if (value != null) {
      result
        ..add('Freesugarsg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.foodDetail1;
    if (value != null) {
      result
        ..add('FoodDetail1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodDetail2;
    if (value != null) {
      result
        ..add('FoodDetail2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodDetail3;
    if (value != null) {
      result
        ..add('FoodDetail3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodDetail4;
    if (value != null) {
      result
        ..add('FoodDetail4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodDetail5;
    if (value != null) {
      result
        ..add('FoodDetail5')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodDetail6;
    if (value != null) {
      result
        ..add('FoodDetail6')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodNameFull;
    if (value != null) {
      result
        ..add('FoodNameFull')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FoodDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'PublicFoodKey':
          result.publicFoodKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Classification':
          result.classification = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'FoodName':
          result.foodName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Totalsugarsg':
          result.totalsugarsg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Addedsugarsg':
          result.addedsugarsg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Freesugarsg':
          result.freesugarsg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'FoodDetail1':
          result.foodDetail1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FoodDetail2':
          result.foodDetail2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FoodDetail3':
          result.foodDetail3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FoodDetail4':
          result.foodDetail4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FoodDetail5':
          result.foodDetail5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FoodDetail6':
          result.foodDetail6 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FoodNameFull':
          result.foodNameFull = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodDataRecord extends FoodDataRecord {
  @override
  final String? publicFoodKey;
  @override
  final int? classification;
  @override
  final String? foodName;
  @override
  final double? totalsugarsg;
  @override
  final double? addedsugarsg;
  @override
  final double? freesugarsg;
  @override
  final String? foodDetail1;
  @override
  final String? foodDetail2;
  @override
  final String? foodDetail3;
  @override
  final String? foodDetail4;
  @override
  final String? foodDetail5;
  @override
  final String? foodDetail6;
  @override
  final String? foodNameFull;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FoodDataRecord([void Function(FoodDataRecordBuilder)? updates]) =>
      (new FoodDataRecordBuilder()..update(updates))._build();

  _$FoodDataRecord._(
      {this.publicFoodKey,
      this.classification,
      this.foodName,
      this.totalsugarsg,
      this.addedsugarsg,
      this.freesugarsg,
      this.foodDetail1,
      this.foodDetail2,
      this.foodDetail3,
      this.foodDetail4,
      this.foodDetail5,
      this.foodDetail6,
      this.foodNameFull,
      this.ffRef})
      : super._();

  @override
  FoodDataRecord rebuild(void Function(FoodDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDataRecordBuilder toBuilder() =>
      new FoodDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDataRecord &&
        publicFoodKey == other.publicFoodKey &&
        classification == other.classification &&
        foodName == other.foodName &&
        totalsugarsg == other.totalsugarsg &&
        addedsugarsg == other.addedsugarsg &&
        freesugarsg == other.freesugarsg &&
        foodDetail1 == other.foodDetail1 &&
        foodDetail2 == other.foodDetail2 &&
        foodDetail3 == other.foodDetail3 &&
        foodDetail4 == other.foodDetail4 &&
        foodDetail5 == other.foodDetail5 &&
        foodDetail6 == other.foodDetail6 &&
        foodNameFull == other.foodNameFull &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            0,
                                                            publicFoodKey
                                                                .hashCode),
                                                        classification
                                                            .hashCode),
                                                    foodName.hashCode),
                                                totalsugarsg.hashCode),
                                            addedsugarsg.hashCode),
                                        freesugarsg.hashCode),
                                    foodDetail1.hashCode),
                                foodDetail2.hashCode),
                            foodDetail3.hashCode),
                        foodDetail4.hashCode),
                    foodDetail5.hashCode),
                foodDetail6.hashCode),
            foodNameFull.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FoodDataRecord')
          ..add('publicFoodKey', publicFoodKey)
          ..add('classification', classification)
          ..add('foodName', foodName)
          ..add('totalsugarsg', totalsugarsg)
          ..add('addedsugarsg', addedsugarsg)
          ..add('freesugarsg', freesugarsg)
          ..add('foodDetail1', foodDetail1)
          ..add('foodDetail2', foodDetail2)
          ..add('foodDetail3', foodDetail3)
          ..add('foodDetail4', foodDetail4)
          ..add('foodDetail5', foodDetail5)
          ..add('foodDetail6', foodDetail6)
          ..add('foodNameFull', foodNameFull)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FoodDataRecordBuilder
    implements Builder<FoodDataRecord, FoodDataRecordBuilder> {
  _$FoodDataRecord? _$v;

  String? _publicFoodKey;
  String? get publicFoodKey => _$this._publicFoodKey;
  set publicFoodKey(String? publicFoodKey) =>
      _$this._publicFoodKey = publicFoodKey;

  int? _classification;
  int? get classification => _$this._classification;
  set classification(int? classification) =>
      _$this._classification = classification;

  String? _foodName;
  String? get foodName => _$this._foodName;
  set foodName(String? foodName) => _$this._foodName = foodName;

  double? _totalsugarsg;
  double? get totalsugarsg => _$this._totalsugarsg;
  set totalsugarsg(double? totalsugarsg) => _$this._totalsugarsg = totalsugarsg;

  double? _addedsugarsg;
  double? get addedsugarsg => _$this._addedsugarsg;
  set addedsugarsg(double? addedsugarsg) => _$this._addedsugarsg = addedsugarsg;

  double? _freesugarsg;
  double? get freesugarsg => _$this._freesugarsg;
  set freesugarsg(double? freesugarsg) => _$this._freesugarsg = freesugarsg;

  String? _foodDetail1;
  String? get foodDetail1 => _$this._foodDetail1;
  set foodDetail1(String? foodDetail1) => _$this._foodDetail1 = foodDetail1;

  String? _foodDetail2;
  String? get foodDetail2 => _$this._foodDetail2;
  set foodDetail2(String? foodDetail2) => _$this._foodDetail2 = foodDetail2;

  String? _foodDetail3;
  String? get foodDetail3 => _$this._foodDetail3;
  set foodDetail3(String? foodDetail3) => _$this._foodDetail3 = foodDetail3;

  String? _foodDetail4;
  String? get foodDetail4 => _$this._foodDetail4;
  set foodDetail4(String? foodDetail4) => _$this._foodDetail4 = foodDetail4;

  String? _foodDetail5;
  String? get foodDetail5 => _$this._foodDetail5;
  set foodDetail5(String? foodDetail5) => _$this._foodDetail5 = foodDetail5;

  String? _foodDetail6;
  String? get foodDetail6 => _$this._foodDetail6;
  set foodDetail6(String? foodDetail6) => _$this._foodDetail6 = foodDetail6;

  String? _foodNameFull;
  String? get foodNameFull => _$this._foodNameFull;
  set foodNameFull(String? foodNameFull) => _$this._foodNameFull = foodNameFull;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FoodDataRecordBuilder() {
    FoodDataRecord._initializeBuilder(this);
  }

  FoodDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _publicFoodKey = $v.publicFoodKey;
      _classification = $v.classification;
      _foodName = $v.foodName;
      _totalsugarsg = $v.totalsugarsg;
      _addedsugarsg = $v.addedsugarsg;
      _freesugarsg = $v.freesugarsg;
      _foodDetail1 = $v.foodDetail1;
      _foodDetail2 = $v.foodDetail2;
      _foodDetail3 = $v.foodDetail3;
      _foodDetail4 = $v.foodDetail4;
      _foodDetail5 = $v.foodDetail5;
      _foodDetail6 = $v.foodDetail6;
      _foodNameFull = $v.foodNameFull;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoodDataRecord;
  }

  @override
  void update(void Function(FoodDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FoodDataRecord build() => _build();

  _$FoodDataRecord _build() {
    final _$result = _$v ??
        new _$FoodDataRecord._(
            publicFoodKey: publicFoodKey,
            classification: classification,
            foodName: foodName,
            totalsugarsg: totalsugarsg,
            addedsugarsg: addedsugarsg,
            freesugarsg: freesugarsg,
            foodDetail1: foodDetail1,
            foodDetail2: foodDetail2,
            foodDetail3: foodDetail3,
            foodDetail4: foodDetail4,
            foodDetail5: foodDetail5,
            foodDetail6: foodDetail6,
            foodNameFull: foodNameFull,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
