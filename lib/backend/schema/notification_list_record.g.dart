// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationListRecord> _$notificationListRecordSerializer =
    new _$NotificationListRecordSerializer();

class _$NotificationListRecordSerializer
    implements StructuredSerializer<NotificationListRecord> {
  @override
  final Iterable<Type> types = const [
    NotificationListRecord,
    _$NotificationListRecord
  ];
  @override
  final String wireName = 'NotificationListRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationListRecord object,
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.topic;
    if (value != null) {
      result
        ..add('topic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docID;
    if (value != null) {
      result
        ..add('docID')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  NotificationListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationListRecordBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'topic':
          result.topic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'docID':
          result.docID.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$NotificationListRecord extends NotificationListRecord {
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final int? status;
  @override
  final String? title;
  @override
  final String? detail;
  @override
  final String? topic;
  @override
  final BuiltList<String>? docID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotificationListRecord(
          [void Function(NotificationListRecordBuilder)? updates]) =>
      (new NotificationListRecordBuilder()..update(updates))._build();

  _$NotificationListRecord._(
      {this.createDate,
      this.createBy,
      this.status,
      this.title,
      this.detail,
      this.topic,
      this.docID,
      this.ffRef})
      : super._();

  @override
  NotificationListRecord rebuild(
          void Function(NotificationListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationListRecordBuilder toBuilder() =>
      new NotificationListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationListRecord &&
        createDate == other.createDate &&
        createBy == other.createBy &&
        status == other.status &&
        title == other.title &&
        detail == other.detail &&
        topic == other.topic &&
        docID == other.docID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, topic.hashCode);
    _$hash = $jc(_$hash, docID.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationListRecord')
          ..add('createDate', createDate)
          ..add('createBy', createBy)
          ..add('status', status)
          ..add('title', title)
          ..add('detail', detail)
          ..add('topic', topic)
          ..add('docID', docID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotificationListRecordBuilder
    implements Builder<NotificationListRecord, NotificationListRecordBuilder> {
  _$NotificationListRecord? _$v;

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

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(String? detail) => _$this._detail = detail;

  String? _topic;
  String? get topic => _$this._topic;
  set topic(String? topic) => _$this._topic = topic;

  ListBuilder<String>? _docID;
  ListBuilder<String> get docID => _$this._docID ??= new ListBuilder<String>();
  set docID(ListBuilder<String>? docID) => _$this._docID = docID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotificationListRecordBuilder() {
    NotificationListRecord._initializeBuilder(this);
  }

  NotificationListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDate = $v.createDate;
      _createBy = $v.createBy;
      _status = $v.status;
      _title = $v.title;
      _detail = $v.detail;
      _topic = $v.topic;
      _docID = $v.docID?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationListRecord;
  }

  @override
  void update(void Function(NotificationListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationListRecord build() => _build();

  _$NotificationListRecord _build() {
    _$NotificationListRecord _$result;
    try {
      _$result = _$v ??
          new _$NotificationListRecord._(
              createDate: createDate,
              createBy: createBy,
              status: status,
              title: title,
              detail: detail,
              topic: topic,
              docID: _docID?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'docID';
        _docID?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationListRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
