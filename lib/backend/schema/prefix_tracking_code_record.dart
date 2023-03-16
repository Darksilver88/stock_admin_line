import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'prefix_tracking_code_record.g.dart';

abstract class PrefixTrackingCodeRecord
    implements
        Built<PrefixTrackingCodeRecord, PrefixTrackingCodeRecordBuilder> {
  static Serializer<PrefixTrackingCodeRecord> get serializer =>
      _$prefixTrackingCodeRecordSerializer;

  String? get prefixName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PrefixTrackingCodeRecordBuilder builder) =>
      builder..prefixName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prefixTrackingCode');

  static Stream<PrefixTrackingCodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PrefixTrackingCodeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PrefixTrackingCodeRecord._();
  factory PrefixTrackingCodeRecord(
          [void Function(PrefixTrackingCodeRecordBuilder) updates]) =
      _$PrefixTrackingCodeRecord;

  static PrefixTrackingCodeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPrefixTrackingCodeRecordData({
  String? prefixName,
}) {
  final firestoreData = serializers.toFirestore(
    PrefixTrackingCodeRecord.serializer,
    PrefixTrackingCodeRecord(
      (p) => p..prefixName = prefixName,
    ),
  );

  return firestoreData;
}
