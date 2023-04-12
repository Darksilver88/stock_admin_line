// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> sendNotificationToMember() async {
  // Add your function code here!
  for (var i = 0; i < FFAppState().stockChecked.length; i++) {
    await FirebaseFirestore.instance.doc(FFAppState().stockChecked[i].path).update({
      'status': 2,
      'readStatus': 0, // ไม่ได้ใช้แล้วเพราะ เลข bedge จะใช้ status แทนเพราะ มันสำคัญกว่าอ่านข้อความ ต้องมารับพัสดุ bedge ถึงจะหาย
      'update_date': getCurrentTimestamp,
    });
  }

  return true;
}
