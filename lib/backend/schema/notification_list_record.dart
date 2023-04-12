import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notification_list_record.g.dart';

abstract class NotificationListRecord
    implements Built<NotificationListRecord, NotificationListRecordBuilder> {
  static Serializer<NotificationListRecord> get serializer =>
      _$notificationListRecordSerializer;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  @BuiltValueField(wireName: 'create_by')
  DocumentReference? get createBy;

  int? get status;

  String? get title;

  String? get detail;

  String? get topic;

  BuiltList<String>? get docID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotificationListRecordBuilder builder) =>
      builder
        ..status = 0
        ..title = ''
        ..detail = ''
        ..topic = ''
        ..docID = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification_list');

  static Stream<NotificationListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotificationListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotificationListRecord._();
  factory NotificationListRecord(
          [void Function(NotificationListRecordBuilder) updates]) =
      _$NotificationListRecord;

  static NotificationListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotificationListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? title,
  String? detail,
  String? topic,
}) {
  final firestoreData = serializers.toFirestore(
    NotificationListRecord.serializer,
    NotificationListRecord(
      (n) => n
        ..createDate = createDate
        ..createBy = createBy
        ..status = status
        ..title = title
        ..detail = detail
        ..topic = topic
        ..docID = null,
    ),
  );

  return firestoreData;
}
