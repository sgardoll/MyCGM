// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IconStruct> _$iconStructSerializer = new _$IconStructSerializer();

class _$IconStructSerializer implements StructuredSerializer<IconStruct> {
  @override
  final Iterable<Type> types = const [IconStruct, _$IconStruct];
  @override
  final String wireName = 'IconStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, IconStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(IconStruct)])),
      'Icon',
      serializers.serialize(object.icon,
          specifiedType: const FullType(IconStruct)),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];

    return result;
  }

  @override
  IconStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IconStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(IconStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'Icon':
          result.icon.replace(serializers.deserialize(value,
              specifiedType: const FullType(IconStruct))! as IconStruct);
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

class _$IconStruct extends IconStruct {
  @override
  final BuiltList<IconStruct> items;
  @override
  final IconStruct icon;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$IconStruct([void Function(IconStructBuilder)? updates]) =>
      (new IconStructBuilder()..update(updates))._build();

  _$IconStruct._(
      {required this.items,
      required this.icon,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'IconStruct', 'items');
    BuiltValueNullFieldError.checkNotNull(icon, r'IconStruct', 'icon');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'IconStruct', 'firestoreUtilData');
  }

  @override
  IconStruct rebuild(void Function(IconStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IconStructBuilder toBuilder() => new IconStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IconStruct &&
        items == other.items &&
        icon == other.icon &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, items.hashCode), icon.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IconStruct')
          ..add('items', items)
          ..add('icon', icon)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class IconStructBuilder implements Builder<IconStruct, IconStructBuilder> {
  _$IconStruct? _$v;

  ListBuilder<IconStruct>? _items;
  ListBuilder<IconStruct> get items =>
      _$this._items ??= new ListBuilder<IconStruct>();
  set items(ListBuilder<IconStruct>? items) => _$this._items = items;

  IconStructBuilder? _icon;
  IconStructBuilder get icon => _$this._icon ??= new IconStructBuilder();
  set icon(IconStructBuilder? icon) => _$this._icon = icon;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  IconStructBuilder() {
    IconStruct._initializeBuilder(this);
  }

  IconStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _icon = $v.icon.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IconStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IconStruct;
  }

  @override
  void update(void Function(IconStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IconStruct build() => _build();

  _$IconStruct _build() {
    _$IconStruct _$result;
    try {
      _$result = _$v ??
          new _$IconStruct._(
              items: items.build(),
              icon: icon.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'IconStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
        _$failedField = 'icon';
        icon.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IconStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
