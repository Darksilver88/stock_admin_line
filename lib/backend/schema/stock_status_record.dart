import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stock_status_record.g.dart';

abstract class StockStatusRecord
    implements Built<StockStatusRecord, StockStatusRecordBuilder> {
  static Serializer<StockStatusRecord> get serializer =>
      _$stockStatusRecordSerializer;

  int? get id;

  String? get name;

  String? get nameAdmin;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StockStatusRecordBuilder builder) => builder
    ..id = 0
    ..name = ''
    ..nameAdmin = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stock_status');

  static Stream<StockStatusRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StockStatusRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StockStatusRecord._();
  factory StockStatusRecord([void Function(StockStatusRecordBuilder) updates]) =
      _$StockStatusRecord;

  static StockStatusRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStockStatusRecordData({
  int? id,
  String? name,
  String? nameAdmin,
}) {
  final firestoreData = serializers.toFirestore(
    StockStatusRecord.serializer,
    StockStatusRecord(
      (s) => s
        ..id = id
        ..name = name
        ..nameAdmin = nameAdmin,
    ),
  );

  return firestoreData;
}
