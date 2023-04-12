// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> checkAdminUserIsVarify(
  String? phoneNumber,
  String? customerName,
) async {
  // Add your function code here!
  var dataReturn = ['failed', 'ผู้ใช้นี้ถูกเปิดใช้งานแล้ว'];

  //เช็คว่ามี customer name นี้ยัง
  var rsCus = await FirebaseFirestore.instance.doc('kconnect/$customerName').get();
  if (!rsCus.exists) {
    return dataReturn = ['failed', 'ขออภัยไม่พบชื่อโครงการนี้ในระบบ'];
  }

  //เช็คว่าใน customer name มี เบอร์นี้ยัง
  var rsMember = await FirebaseFirestore.instance.collection('kconnect/$customerName/member').where('phoneNumber', isEqualTo: phoneNumber).get();
  print("rsMember");
  print(rsMember);

  if (rsMember.docs.length <= 0) {
    return dataReturn = ['failed', 'ขออภัยไม่พบเบอร์โทรศัพท์นี้ในระบบ'];
  }
  print("aaaa");
  //เช็คว่าเบอร์นี้ เป็น นิติ มั้ย
  if (rsMember.docs[0].data()["userRole"] != 'เจ้าหน้าที่นิติ') {
    return dataReturn = ['failed', 'ขออภัยผู้ใช้ไม่ใช้เจ้าหน้าที่นิติ'];
  }
  print("bbbb");
  //เช็คว่าเบอร์นี้ verify  ยัง
  if (rsMember.docs[0].data().containsKey('isVerify')) {
    print("cccc");
    if (rsMember.docs[0].data()["isVerify"]) {
      print("dddd");
      dataReturn = ['failed', 'ผู้ใช้นี้ถูกเปิดใช้งานแล้ว'];
    } else {
      // เซท verify
      print("eeee");
      FFAppState().currentAdminMember = rsMember.docs[0].reference;
      FFAppState().customerName = customerName!;
      final memberUpdateData = createMemberRecordData(
        isVerify: true,
      );
      await FFAppState().currentAdminMember!.update(memberUpdateData);
      dataReturn = ['success', 'เปิดใช้งานเรียบร้อยแล้ว'];
    }
  } else {
    // เซท verify
    print("ffff");
    FFAppState().currentAdminMember = rsMember.docs[0].reference;
    FFAppState().customerName = customerName!;
    final memberUpdateData = createMemberRecordData(
      isVerify: true,
    );
    await FFAppState().currentAdminMember!.update(memberUpdateData);
    dataReturn = ['success', 'เปิดใช้งานเรียบร้อยแล้ว'];
  }
  return dataReturn;
}
