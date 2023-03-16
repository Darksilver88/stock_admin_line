// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_status_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StockStatusRecord> _$stockStatusRecordSerializer =
    new _$StockStatusRecordSerializer();

class _$StockStatusRecordSerializer
    implements StructuredSerializer<StockStatusRecord> {
  @override
  final Iterable<Type> types = const [StockStatusRecord, _$StockStatusRecord];
  @override
  final String wireName = 'StockStatusRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StockStatusRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nameAdmin;
    if (value != null) {
      result
        ..add('nameAdmin')
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
  StockStatusRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StockStatusRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nameAdmin':
          result.nameAdmin = serializers.deserialize(value,
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

class _$StockStatusRecord extends StockStatusRecord {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? nameAdmin;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StockStatusRecord(
          [void Function(StockStatusRecordBuilder)? updates]) =>
      (new StockStatusRecordBuilder()..update(updates))._build();

  _$StockStatusRecord._({this.id, this.name, this.nameAdmin, this.ffRef})
      : super._();

  @override
  StockStatusRecord rebuild(void Function(StockStatusRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockStatusRecordBuilder toBuilder() =>
      new StockStatusRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockStatusRecord &&
        id == other.id &&
        name == other.name &&
        nameAdmin == other.nameAdmin &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), name.hashCode), nameAdmin.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockStatusRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('nameAdmin', nameAdmin)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StockStatusRecordBuilder
    implements Builder<StockStatusRecord, StockStatusRecordBuilder> {
  _$StockStatusRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameAdmin;
  String? get nameAdmin => _$this._nameAdmin;
  set nameAdmin(String? nameAdmin) => _$this._nameAdmin = nameAdmin;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StockStatusRecordBuilder() {
    StockStatusRecord._initializeBuilder(this);
  }

  StockStatusRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _nameAdmin = $v.nameAdmin;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockStatusRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StockStatusRecord;
  }

  @override
  void update(void Function(StockStatusRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockStatusRecord build() => _build();

  _$StockStatusRecord _build() {
    final _$result = _$v ??
        new _$StockStatusRecord._(
            id: id, name: name, nameAdmin: nameAdmin, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
