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
                                                            createDate
                                                                .hashCode),
                                                        createBy.hashCode),
                                                    status.hashCode),
                                                code.hashCode),
                                            receiveName.hashCode),
                                        trackingCode.hashCode),
                                    roomNo.hashCode),
                                memberRef.hashCode),
                            updateDate.hashCode),
                        updateBy.hashCode),
                    readStatus.hashCode),
                ocrDetail.hashCode),
            qrCode.hashCode),
        ffRef.hashCode));
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
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
