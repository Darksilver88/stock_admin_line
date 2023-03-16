// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MemberRecord> _$memberRecordSerializer =
    new _$MemberRecordSerializer();

class _$MemberRecordSerializer implements StructuredSerializer<MemberRecord> {
  @override
  final Iterable<Type> types = const [MemberRecord, _$MemberRecord];
  @override
  final String wireName = 'MemberRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MemberRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userRole;
    if (value != null) {
      result
        ..add('userRole')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fullName;
    if (value != null) {
      result
        ..add('fullName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.roomNo;
    if (value != null) {
      result
        ..add('roomNo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createBy;
    if (value != null) {
      result
        ..add('create_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  MemberRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MemberRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'userRole':
          result.userRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'roomNo':
          result.roomNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_by':
          result.createBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$MemberRecord extends MemberRecord {
  @override
  final DateTime? createDate;
  @override
  final int? status;
  @override
  final String? userRole;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? fullName;
  @override
  final String? roomNo;
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MemberRecord([void Function(MemberRecordBuilder)? updates]) =>
      (new MemberRecordBuilder()..update(updates))._build();

  _$MemberRecord._(
      {this.createDate,
      this.status,
      this.userRole,
      this.firstName,
      this.lastName,
      this.fullName,
      this.roomNo,
      this.createBy,
      this.ffRef})
      : super._();

  @override
  MemberRecord rebuild(void Function(MemberRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemberRecordBuilder toBuilder() => new MemberRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemberRecord &&
        createDate == other.createDate &&
        status == other.status &&
        userRole == other.userRole &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        fullName == other.fullName &&
        roomNo == other.roomNo &&
        createBy == other.createBy &&
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
                                $jc($jc(0, createDate.hashCode),
                                    status.hashCode),
                                userRole.hashCode),
                            firstName.hashCode),
                        lastName.hashCode),
                    fullName.hashCode),
                roomNo.hashCode),
            createBy.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MemberRecord')
          ..add('createDate', createDate)
          ..add('status', status)
          ..add('userRole', userRole)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('fullName', fullName)
          ..add('roomNo', roomNo)
          ..add('createBy', createBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MemberRecordBuilder
    implements Builder<MemberRecord, MemberRecordBuilder> {
  _$MemberRecord? _$v;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _userRole;
  String? get userRole => _$this._userRole;
  set userRole(String? userRole) => _$this._userRole = userRole;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _roomNo;
  String? get roomNo => _$this._roomNo;
  set roomNo(String? roomNo) => _$this._roomNo = roomNo;

  DocumentReference<Object?>? _createBy;
  DocumentReference<Object?>? get createBy => _$this._createBy;
  set createBy(DocumentReference<Object?>? createBy) =>
      _$this._createBy = createBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MemberRecordBuilder() {
    MemberRecord._initializeBuilder(this);
  }

  MemberRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDate = $v.createDate;
      _status = $v.status;
      _userRole = $v.userRole;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _fullName = $v.fullName;
      _roomNo = $v.roomNo;
      _createBy = $v.createBy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemberRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MemberRecord;
  }

  @override
  void update(void Function(MemberRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MemberRecord build() => _build();

  _$MemberRecord _build() {
    final _$result = _$v ??
        new _$MemberRecord._(
            createDate: createDate,
            status: status,
            userRole: userRole,
            firstName: firstName,
            lastName: lastName,
            fullName: fullName,
            roomNo: roomNo,
            createBy: createBy,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
