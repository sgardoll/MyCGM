// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChartDataRecord> _$chartDataRecordSerializer =
    new _$ChartDataRecordSerializer();

class _$ChartDataRecordSerializer
    implements StructuredSerializer<ChartDataRecord> {
  @override
  final Iterable<Type> types = const [ChartDataRecord, _$ChartDataRecord];
  @override
  final String wireName = 'ChartDataRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChartDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sgv;
    if (value != null) {
      result
        ..add('sgv')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.dateString;
    if (value != null) {
      result
        ..add('dateString')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.direction;
    if (value != null) {
      result
        ..add('direction')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.device;
    if (value != null) {
      result
        ..add('device')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.lastApiGet;
    if (value != null) {
      result
        ..add('lastApiGet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ChartDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChartDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sgv':
          result.sgv.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'date':
          result.date.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'dateString':
          result.dateString.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'direction':
          result.direction.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'device':
          result.device.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'lastApiGet':
          result.lastApiGet = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ChartDataRecord extends ChartDataRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final BuiltList<int>? sgv;
  @override
  final BuiltList<int>? date;
  @override
  final BuiltList<String>? dateString;
  @override
  final BuiltList<String>? direction;
  @override
  final BuiltList<String>? device;
  @override
  final DateTime? lastApiGet;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChartDataRecord([void Function(ChartDataRecordBuilder)? updates]) =>
      (new ChartDataRecordBuilder()..update(updates))._build();

  _$ChartDataRecord._(
      {this.userRef,
      this.sgv,
      this.date,
      this.dateString,
      this.direction,
      this.device,
      this.lastApiGet,
      this.ffRef})
      : super._();

  @override
  ChartDataRecord rebuild(void Function(ChartDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChartDataRecordBuilder toBuilder() =>
      new ChartDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChartDataRecord &&
        userRef == other.userRef &&
        sgv == other.sgv &&
        date == other.date &&
        dateString == other.dateString &&
        direction == other.direction &&
        device == other.device &&
        lastApiGet == other.lastApiGet &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, sgv.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, dateString.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jc(_$hash, lastApiGet.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChartDataRecord')
          ..add('userRef', userRef)
          ..add('sgv', sgv)
          ..add('date', date)
          ..add('dateString', dateString)
          ..add('direction', direction)
          ..add('device', device)
          ..add('lastApiGet', lastApiGet)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChartDataRecordBuilder
    implements Builder<ChartDataRecord, ChartDataRecordBuilder> {
  _$ChartDataRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  ListBuilder<int>? _sgv;
  ListBuilder<int> get sgv => _$this._sgv ??= new ListBuilder<int>();
  set sgv(ListBuilder<int>? sgv) => _$this._sgv = sgv;

  ListBuilder<int>? _date;
  ListBuilder<int> get date => _$this._date ??= new ListBuilder<int>();
  set date(ListBuilder<int>? date) => _$this._date = date;

  ListBuilder<String>? _dateString;
  ListBuilder<String> get dateString =>
      _$this._dateString ??= new ListBuilder<String>();
  set dateString(ListBuilder<String>? dateString) =>
      _$this._dateString = dateString;

  ListBuilder<String>? _direction;
  ListBuilder<String> get direction =>
      _$this._direction ??= new ListBuilder<String>();
  set direction(ListBuilder<String>? direction) =>
      _$this._direction = direction;

  ListBuilder<String>? _device;
  ListBuilder<String> get device =>
      _$this._device ??= new ListBuilder<String>();
  set device(ListBuilder<String>? device) => _$this._device = device;

  DateTime? _lastApiGet;
  DateTime? get lastApiGet => _$this._lastApiGet;
  set lastApiGet(DateTime? lastApiGet) => _$this._lastApiGet = lastApiGet;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChartDataRecordBuilder() {
    ChartDataRecord._initializeBuilder(this);
  }

  ChartDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _sgv = $v.sgv?.toBuilder();
      _date = $v.date?.toBuilder();
      _dateString = $v.dateString?.toBuilder();
      _direction = $v.direction?.toBuilder();
      _device = $v.device?.toBuilder();
      _lastApiGet = $v.lastApiGet;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChartDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChartDataRecord;
  }

  @override
  void update(void Function(ChartDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChartDataRecord build() => _build();

  _$ChartDataRecord _build() {
    _$ChartDataRecord _$result;
    try {
      _$result = _$v ??
          new _$ChartDataRecord._(
              userRef: userRef,
              sgv: _sgv?.build(),
              date: _date?.build(),
              dateString: _dateString?.build(),
              direction: _direction?.build(),
              device: _device?.build(),
              lastApiGet: lastApiGet,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sgv';
        _sgv?.build();
        _$failedField = 'date';
        _date?.build();
        _$failedField = 'dateString';
        _dateString?.build();
        _$failedField = 'direction';
        _direction?.build();
        _$failedField = 'device';
        _device?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChartDataRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
