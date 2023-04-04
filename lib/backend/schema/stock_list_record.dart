import 'dart:async';

import '../../app_state.dart';
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

  DocumentReference? get memberRef;

  @BuiltValueField(wireName: 'update_date')
  DateTime? get updateDate;

  @BuiltValueField(wireName: 'update_by')
  DocumentReference? get updateBy;

  int? get readStatus;

  String? get ocrDetail;

  String? get qrCode;

  String? get remark;

  String? get dummyName;

  String? get dummyPhoto;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StockListRecordBuilder builder) => builder
    ..status = 0
    ..code = ''
    ..receiveName = ''
    ..trackingCode = ''
    ..roomNo = ''
    ..readStatus = 0
    ..ocrDetail = ''
    ..qrCode = ''
    ..remark = ''
    ..dummyName = ''
    ..dummyPhoto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kconnect/${FFAppState().customerName}/stock/data/stock_list');

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
  DocumentReference? memberRef,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? readStatus,
  String? ocrDetail,
  String? qrCode,
  String? remark,
  String? dummyName,
  String? dummyPhoto,
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
        ..roomNo = roomNo
        ..memberRef = memberRef
        ..updateDate = updateDate
        ..updateBy = updateBy
        ..readStatus = readStatus
        ..ocrDetail = ocrDetail
        ..qrCode = qrCode
        ..remark = remark
        ..dummyName = dummyName
        ..dummyPhoto = dummyPhoto,
    ),
  );

  return firestoreData;
}
