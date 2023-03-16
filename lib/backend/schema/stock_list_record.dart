import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stock_list_record.g.dart';

abstract class StockListRecord
    implements Built<StockListRecord, StockListRecordBuilder> {
  static Serializer<StockListRecord> get serializer =>
      _$stockListRecordSerializer;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  @BuiltValueField(wireName: 'create_by')
  DocumentReference? get createBy;

  int? get status;

  String? get code;

  String? get receiveName;

  String? get trackingCode;

  String? get roomNo;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StockListRecordBuilder builder) => builder
    ..status = 0
    ..code = ''
    ..receiveName = ''
    ..trackingCode = ''
    ..roomNo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stock_list');

  static Stream<StockListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StockListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StockListRecord._();
  factory StockListRecord([void Function(StockListRecordBuilder) updates]) =
      _$StockListRecord;

  static StockListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStockListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? code,
  String? receiveName,
  String? trackingCode,
  String? roomNo,
}) {
  final firestoreData = serializers.toFirestore(
    StockListRecord.serializer,
    StockListRecord(
      (s) => s
        ..createDate = createDate
        ..createBy = createBy
        ..status = status
        ..code = code
        ..receiveName = receiveName
        ..trackingCode = trackingCode
        ..roomNo = roomNo,
    ),
  );

  return firestoreData;
}
