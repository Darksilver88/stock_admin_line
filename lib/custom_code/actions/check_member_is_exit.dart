// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> checkMemberIsExit(
  String? roomNo,
  String? fullName,
) async {
  // Add your function code here!
  var rs = await FirebaseFirestore.instance.collection("kconnect/${FFAppState().customerName}/member").where('fullName', isEqualTo: fullName).where('roomNo', isEqualTo: roomNo).get();
  if (rs.docs.isEmpty) {
    return null;
  } else {
    return rs.docs[0].reference;
  }
}
