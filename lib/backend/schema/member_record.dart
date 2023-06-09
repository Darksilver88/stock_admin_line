import 'dart:async';

import 'package:stock_admin_line/app_state.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'member_record.g.dart';

abstract class MemberRecord
    implements Built<MemberRecord, MemberRecordBuilder> {
  static Serializer<MemberRecord> get serializer => _$memberRecordSerializer;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  int? get status;

  String? get userRole;

  String? get firstName;

  String? get lastName;

  String? get fullName;

  String? get roomNo;

  @BuiltValueField(wireName: 'create_by')
  DocumentReference? get createBy;

  String? get prefixName;

  String? get lineID;

  bool? get isVerify;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MemberRecordBuilder builder) => builder
    ..status = 0
    ..userRole = ''
    ..firstName = ''
    ..lastName = ''
    ..fullName = ''
    ..roomNo = ''
    ..prefixName = ''
    ..lineID = ''
    ..isVerify = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kconnect/${FFAppState().customerName}/member');

  static Stream<MemberRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MemberRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MemberRecord._();
  factory MemberRecord([void Function(MemberRecordBuilder) updates]) =
      _$MemberRecord;

  static MemberRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMemberRecordData({
  DateTime? createDate,
  int? status,
  String? userRole,
  String? firstName,
  String? lastName,
  String? fullName,
  String? roomNo,
  DocumentReference? createBy,
  String? prefixName,
  String? lineID,
  bool? isVerify,
}) {
  final firestoreData = serializers.toFirestore(
    MemberRecord.serializer,
    MemberRecord(
      (m) => m
        ..createDate = createDate
        ..status = status
        ..userRole = userRole
        ..firstName = firstName
        ..lastName = lastName
        ..fullName = fullName
        ..roomNo = roomNo
        ..createBy = createBy
        ..prefixName = prefixName
        ..lineID = lineID
        ..isVerify = isVerify,
    ),
  );

  return firestoreData;
}
