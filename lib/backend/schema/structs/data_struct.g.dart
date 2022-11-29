// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataStruct> _$dataStructSerializer = new _$DataStructSerializer();

class _$DataStructSerializer implements StructuredSerializer<DataStruct> {
  @override
  final Iterable<Type> types = const [DataStruct, _$DataStruct];
  @override
  final String wireName = 'DataStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, DataStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
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
    value = object.mmol;
    if (value != null) {
      result
        ..add('mmol')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    return result;
  }

  @override
  DataStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
        case 'mmol':
          result.mmol.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$DataStruct extends DataStruct {
  @override
  final BuiltList<int>? date;
  @override
  final BuiltList<String>? dateString;
  @override
  final BuiltList<double>? mmol;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DataStruct([void Function(DataStructBuilder)? updates]) =>
      (new DataStructBuilder()..update(updates))._build();

  _$DataStruct._(
      {this.date, this.dateString, this.mmol, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DataStruct', 'firestoreUtilData');
  }

  @override
  DataStruct rebuild(void Function(DataStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataStructBuilder toBuilder() => new DataStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataStruct &&
        date == other.date &&
        dateString == other.dateString &&
        mmol == other.mmol &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, date.hashCode), dateString.hashCode), mmol.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DataStruct')
          ..add('date', date)
          ..add('dateString', dateString)
          ..add('mmol', mmol)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DataStructBuilder implements Builder<DataStruct, DataStructBuilder> {
  _$DataStruct? _$v;

  ListBuilder<int>? _date;
  ListBuilder<int> get date => _$this._date ??= new ListBuilder<int>();
  set date(ListBuilder<int>? date) => _$this._date = date;

  ListBuilder<String>? _dateString;
  ListBuilder<String> get dateString =>
      _$this._dateString ??= new ListBuilder<String>();
  set dateString(ListBuilder<String>? dateString) =>
      _$this._dateString = dateString;

  ListBuilder<double>? _mmol;
  ListBuilder<double> get mmol => _$this._mmol ??= new ListBuilder<double>();
  set mmol(ListBuilder<double>? mmol) => _$this._mmol = mmol;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DataStructBuilder() {
    DataStruct._initializeBuilder(this);
  }

  DataStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date?.toBuilder();
      _dateString = $v.dateString?.toBuilder();
      _mmol = $v.mmol?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataStruct;
  }

  @override
  void update(void Function(DataStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataStruct build() => _build();

  _$DataStruct _build() {
    _$DataStruct _$result;
    try {
      _$result = _$v ??
          new _$DataStruct._(
              date: _date?.build(),
              dateString: _dateString?.build(),
              mmol: _mmol?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'DataStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'date';
        _date?.build();
        _$failedField = 'dateString';
        _dateString?.build();
        _$failedField = 'mmol';
        _mmol?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DataStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
