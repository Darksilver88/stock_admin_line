// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefix_tracking_code_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PrefixTrackingCodeRecord> _$prefixTrackingCodeRecordSerializer =
    new _$PrefixTrackingCodeRecordSerializer();

class _$PrefixTrackingCodeRecordSerializer
    implements StructuredSerializer<PrefixTrackingCodeRecord> {
  @override
  final Iterable<Type> types = const [
    PrefixTrackingCodeRecord,
    _$PrefixTrackingCodeRecord
  ];
  @override
  final String wireName = 'PrefixTrackingCodeRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PrefixTrackingCodeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.prefixName;
    if (value != null) {
      result
        ..add('prefixName')
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
  PrefixTrackingCodeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrefixTrackingCodeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'prefixName':
          result.prefixName = serializers.deserialize(value,
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

class _$PrefixTrackingCodeRecord extends PrefixTrackingCodeRecord {
  @override
  final String? prefixName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PrefixTrackingCodeRecord(
          [void Function(PrefixTrackingCodeRecordBuilder)? updates]) =>
      (new PrefixTrackingCodeRecordBuilder()..update(updates))._build();

  _$PrefixTrackingCodeRecord._({this.prefixName, this.ffRef}) : super._();

  @override
  PrefixTrackingCodeRecord rebuild(
          void Function(PrefixTrackingCodeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrefixTrackingCodeRecordBuilder toBuilder() =>
      new PrefixTrackingCodeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrefixTrackingCodeRecord &&
        prefixName == other.prefixName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, prefixName.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PrefixTrackingCodeRecord')
          ..add('prefixName', prefixName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PrefixTrackingCodeRecordBuilder
    implements
        Builder<PrefixTrackingCodeRecord, PrefixTrackingCodeRecordBuilder> {
  _$PrefixTrackingCodeRecord? _$v;

  String? _prefixName;
  String? get prefixName => _$this._prefixName;
  set prefixName(String? prefixName) => _$this._prefixName = prefixName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PrefixTrackingCodeRecordBuilder() {
    PrefixTrackingCodeRecord._initializeBuilder(this);
  }

  PrefixTrackingCodeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prefixName = $v.prefixName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrefixTrackingCodeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrefixTrackingCodeRecord;
  }

  @override
  void update(void Function(PrefixTrackingCodeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PrefixTrackingCodeRecord build() => _build();

  _$PrefixTrackingCodeRecord _build() {
    final _$result = _$v ??
        new _$PrefixTrackingCodeRecord._(prefixName: prefixName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
