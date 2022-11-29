// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_items_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChartItemsRecord> _$chartItemsRecordSerializer =
    new _$ChartItemsRecordSerializer();

class _$ChartItemsRecordSerializer
    implements StructuredSerializer<ChartItemsRecord> {
  @override
  final Iterable<Type> types = const [ChartItemsRecord, _$ChartItemsRecord];
  @override
  final String wireName = 'ChartItemsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChartItemsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.highMmol;
    if (value != null) {
      result
        ..add('highMmol')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.lowMmol;
    if (value != null) {
      result
        ..add('lowMmol')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ChartItemsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChartItemsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'highMmol':
          result.highMmol.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'lowMmol':
          result.lowMmol.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ChartItemsRecord extends ChartItemsRecord {
  @override
  final BuiltList<double>? highMmol;
  @override
  final BuiltList<double>? lowMmol;
  @override
  final int? count;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChartItemsRecord(
          [void Function(ChartItemsRecordBuilder)? updates]) =>
      (new ChartItemsRecordBuilder()..update(updates))._build();

  _$ChartItemsRecord._({this.highMmol, this.lowMmol, this.count, this.ffRef})
      : super._();

  @override
  ChartItemsRecord rebuild(void Function(ChartItemsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChartItemsRecordBuilder toBuilder() =>
      new ChartItemsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChartItemsRecord &&
        highMmol == other.highMmol &&
        lowMmol == other.lowMmol &&
        count == other.count &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, highMmol.hashCode), lowMmol.hashCode), count.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChartItemsRecord')
          ..add('highMmol', highMmol)
          ..add('lowMmol', lowMmol)
          ..add('count', count)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChartItemsRecordBuilder
    implements Builder<ChartItemsRecord, ChartItemsRecordBuilder> {
  _$ChartItemsRecord? _$v;

  ListBuilder<double>? _highMmol;
  ListBuilder<double> get highMmol =>
      _$this._highMmol ??= new ListBuilder<double>();
  set highMmol(ListBuilder<double>? highMmol) => _$this._highMmol = highMmol;

  ListBuilder<double>? _lowMmol;
  ListBuilder<double> get lowMmol =>
      _$this._lowMmol ??= new ListBuilder<double>();
  set lowMmol(ListBuilder<double>? lowMmol) => _$this._lowMmol = lowMmol;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChartItemsRecordBuilder() {
    ChartItemsRecord._initializeBuilder(this);
  }

  ChartItemsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _highMmol = $v.highMmol?.toBuilder();
      _lowMmol = $v.lowMmol?.toBuilder();
      _count = $v.count;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChartItemsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChartItemsRecord;
  }

  @override
  void update(void Function(ChartItemsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChartItemsRecord build() => _build();

  _$ChartItemsRecord _build() {
    _$ChartItemsRecord _$result;
    try {
      _$result = _$v ??
          new _$ChartItemsRecord._(
              highMmol: _highMmol?.build(),
              lowMmol: _lowMmol?.build(),
              count: count,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'highMmol';
        _highMmol?.build();
        _$failedField = 'lowMmol';
        _lowMmol?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChartItemsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
