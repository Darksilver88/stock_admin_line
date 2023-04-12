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
    value = object.prefixName;
    if (value != null) {
      result
        ..add('prefixName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lineID;
    if (value != null) {
      result
        ..add('lineID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isVerify;
    if (value != null) {
      result
        ..add('isVerify')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
        case 'prefixName':
          result.prefixName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lineID':
          result.lineID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isVerify':
          result.isVerify = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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
  final String? prefixName;
  @override
  final String? lineID;
  @override
  final bool? isVerify;
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
      this.prefixName,
      this.lineID,
      this.isVerify,
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
        prefixName == other.prefixName &&
        lineID == other.lineID &&
        isVerify == other.isVerify &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, userRole.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, roomNo.hashCode);
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, prefixName.hashCode);
    _$hash = $jc(_$hash, lineID.hashCode);
    _$hash = $jc(_$hash, isVerify.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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
          ..add('prefixName', prefixName)
          ..add('lineID', lineID)
          ..add('isVerify', isVerify)
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

  String? _prefixName;
  String? get prefixName => _$this._prefixName;
  set prefixName(String? prefixName) => _$this._prefixName = prefixName;

  String? _lineID;
  String? get lineID => _$this._lineID;
  set lineID(String? lineID) => _$this._lineID = lineID;

  bool? _isVerify;
  bool? get isVerify => _$this._isVerify;
  set isVerify(bool? isVerify) => _$this._isVerify = isVerify;

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
      _prefixName = $v.prefixName;
      _lineID = $v.lineID;
      _isVerify = $v.isVerify;
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
            prefixName: prefixName,
            lineID: lineID,
            isVerify: isVerify,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
