// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StockListRecord> _$stockListRecordSerializer =
    new _$StockListRecordSerializer();

class _$StockListRecordSerializer
    implements StructuredSerializer<StockListRecord> {
  @override
  final Iterable<Type> types = const [StockListRecord, _$StockListRecord];
  @override
  final String wireName = 'StockListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StockListRecord object,
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
    value = object.createBy;
    if (value != null) {
      result
        ..add('create_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiveName;
    if (value != null) {
      result
        ..add('receiveName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.trackingCode;
    if (value != null) {
      result
        ..add('trackingCode')
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
    value = object.memberRef;
    if (value != null) {
      result
        ..add('memberRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.updateDate;
    if (value != null) {
      result
        ..add('update_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updateBy;
    if (value != null) {
      result
        ..add('update_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.readStatus;
    if (value != null) {
      result
        ..add('readStatus')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ocrDetail;
    if (value != null) {
      result
        ..add('ocrDetail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qrCode;
    if (value != null) {
      result
        ..add('qrCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.remark;
    if (value != null) {
      result
        ..add('remark')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dummyName;
    if (value != null) {
      result
        ..add('dummyName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dummyPhoto;
    if (value != null) {
      result
        ..add('dummyPhoto')
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
  StockListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StockListRecordBuilder();

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
        case 'create_by':
          result.createBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiveName':
          result.receiveName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'trackingCode':
          result.trackingCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'roomNo':
          result.roomNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'memberRef':
          result.memberRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'update_date':
          result.updateDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'update_by':
          result.updateBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'readStatus':
          result.readStatus = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ocrDetail':
          result.ocrDetail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qrCode':
          result.qrCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'remark':
          result.remark = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dummyName':
          result.dummyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dummyPhoto':
          result.dummyPhoto = serializers.deserialize(value,
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

class _$StockListRecord extends StockListRecord {
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final int? status;
  @override
  final String? code;
  @override
  final String? receiveName;
  @override
  final String? trackingCode;
  @override
  final String? roomNo;
  @override
  final DocumentReference<Object?>? memberRef;
  @override
  final DateTime? updateDate;
  @override
  final DocumentReference<Object?>? updateBy;
  @override
  final int? readStatus;
  @override
  final String? ocrDetail;
  @override
  final String? qrCode;
  @override
  final String? remark;
  @override
  final String? dummyName;
  @override
  final String? dummyPhoto;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StockListRecord([void Function(StockListRecordBuilder)? updates]) =>
      (new StockListRecordBuilder()..update(updates))._build();

  _$StockListRecord._(
      {this.createDate,
      this.createBy,
      this.status,
      this.code,
      this.receiveName,
      this.trackingCode,
      this.roomNo,
      this.memberRef,
      this.updateDate,
      this.updateBy,
      this.readStatus,
      this.ocrDetail,
      this.qrCode,
      this.remark,
      this.dummyName,
      this.dummyPhoto,
      this.ffRef})
      : super._();

  @override
  StockListRecord rebuild(void Function(StockListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockListRecordBuilder toBuilder() =>
      new StockListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockListRecord &&
        createDate == other.createDate &&
        createBy == other.createBy &&
        status == other.status &&
        code == other.code &&
        receiveName == other.receiveName &&
        trackingCode == other.trackingCode &&
        roomNo == other.roomNo &&
        memberRef == other.memberRef &&
        updateDate == other.updateDate &&
        updateBy == other.updateBy &&
        readStatus == other.readStatus &&
        ocrDetail == other.ocrDetail &&
        qrCode == other.qrCode &&
        remark == other.remark &&
        dummyName == other.dummyName &&
        dummyPhoto == other.dummyPhoto &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, receiveName.hashCode);
    _$hash = $jc(_$hash, trackingCode.hashCode);
    _$hash = $jc(_$hash, roomNo.hashCode);
    _$hash = $jc(_$hash, memberRef.hashCode);
    _$hash = $jc(_$hash, updateDate.hashCode);
    _$hash = $jc(_$hash, updateBy.hashCode);
    _$hash = $jc(_$hash, readStatus.hashCode);
    _$hash = $jc(_$hash, ocrDetail.hashCode);
    _$hash = $jc(_$hash, qrCode.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, dummyName.hashCode);
    _$hash = $jc(_$hash, dummyPhoto.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockListRecord')
          ..add('createDate', createDate)
          ..add('createBy', createBy)
          ..add('status', status)
          ..add('code', code)
          ..add('receiveName', receiveName)
          ..add('trackingCode', trackingCode)
          ..add('roomNo', roomNo)
          ..add('memberRef', memberRef)
          ..add('updateDate', updateDate)
          ..add('updateBy', updateBy)
          ..add('readStatus', readStatus)
          ..add('ocrDetail', ocrDetail)
          ..add('qrCode', qrCode)
          ..add('remark', remark)
          ..add('dummyName', dummyName)
          ..add('dummyPhoto', dummyPhoto)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StockListRecordBuilder
    implements Builder<StockListRecord, StockListRecordBuilder> {
  _$StockListRecord? _$v;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  DocumentReference<Object?>? _createBy;
  DocumentReference<Object?>? get createBy => _$this._createBy;
  set createBy(DocumentReference<Object?>? createBy) =>
      _$this._createBy = createBy;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _receiveName;
  String? get receiveName => _$this._receiveName;
  set receiveName(String? receiveName) => _$this._receiveName = receiveName;

  String? _trackingCode;
  String? get trackingCode => _$this._trackingCode;
  set trackingCode(String? trackingCode) => _$this._trackingCode = trackingCode;

  String? _roomNo;
  String? get roomNo => _$this._roomNo;
  set roomNo(String? roomNo) => _$this._roomNo = roomNo;

  DocumentReference<Object?>? _memberRef;
  DocumentReference<Object?>? get memberRef => _$this._memberRef;
  set memberRef(DocumentReference<Object?>? memberRef) =>
      _$this._memberRef = memberRef;

  DateTime? _updateDate;
  DateTime? get updateDate => _$this._updateDate;
  set updateDate(DateTime? updateDate) => _$this._updateDate = updateDate;

  DocumentReference<Object?>? _updateBy;
  DocumentReference<Object?>? get updateBy => _$this._updateBy;
  set updateBy(DocumentReference<Object?>? updateBy) =>
      _$this._updateBy = updateBy;

  int? _readStatus;
  int? get readStatus => _$this._readStatus;
  set readStatus(int? readStatus) => _$this._readStatus = readStatus;

  String? _ocrDetail;
  String? get ocrDetail => _$this._ocrDetail;
  set ocrDetail(String? ocrDetail) => _$this._ocrDetail = ocrDetail;

  String? _qrCode;
  String? get qrCode => _$this._qrCode;
  set qrCode(String? qrCode) => _$this._qrCode = qrCode;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  String? _dummyName;
  String? get dummyName => _$this._dummyName;
  set dummyName(String? dummyName) => _$this._dummyName = dummyName;

  String? _dummyPhoto;
  String? get dummyPhoto => _$this._dummyPhoto;
  set dummyPhoto(String? dummyPhoto) => _$this._dummyPhoto = dummyPhoto;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StockListRecordBuilder() {
    StockListRecord._initializeBuilder(this);
  }

  StockListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDate = $v.createDate;
      _createBy = $v.createBy;
      _status = $v.status;
      _code = $v.code;
      _receiveName = $v.receiveName;
      _trackingCode = $v.trackingCode;
      _roomNo = $v.roomNo;
      _memberRef = $v.memberRef;
      _updateDate = $v.updateDate;
      _updateBy = $v.updateBy;
      _readStatus = $v.readStatus;
      _ocrDetail = $v.ocrDetail;
      _qrCode = $v.qrCode;
      _remark = $v.remark;
      _dummyName = $v.dummyName;
      _dummyPhoto = $v.dummyPhoto;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StockListRecord;
  }

  @override
  void update(void Function(StockListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockListRecord build() => _build();

  _$StockListRecord _build() {
    final _$result = _$v ??
        new _$StockListRecord._(
            createDate: createDate,
            createBy: createBy,
            status: status,
            code: code,
            receiveName: receiveName,
            trackingCode: trackingCode,
            roomNo: roomNo,
            memberRef: memberRef,
            updateDate: updateDate,
            updateBy: updateBy,
            readStatus: readStatus,
            ocrDetail: ocrDetail,
            qrCode: qrCode,
            remark: remark,
            dummyName: dummyName,
            dummyPhoto: dummyPhoto,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
