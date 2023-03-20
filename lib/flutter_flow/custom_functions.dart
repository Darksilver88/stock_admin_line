import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../app_state.dart';
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

Future getStockStatus(int? status) async {
  var rs = await FirebaseFirestore.instance.collection('kconnect/${FFAppState().customerName}/stock/data/stock_status').where('id', isEqualTo: status).get();
  return rs.docs[0].data()["nameAdmin"];
}

autoReceiveName(String? roomCode) async {
  var rs = await FirebaseFirestore.instance.collection('kconnect/${FFAppState().customerName}/member').where('roomNo', isEqualTo: roomCode).get();
  return rs.docs[0].data()["fullName"];
}

runCodeNumber() async {
  var rs = await FirebaseFirestore.instance.collection('kconnect/${FFAppState().customerName}/stock/data/stock_list').orderBy('create_date', descending: true).limit(1).get();
  var firstString = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

  int startNumber = 0;
  int firstStringIndex = 0;

  if (rs.docs.isNotEmpty) {
    var lastCode = rs.docs.last.data()["code"];
    var rsFirstLetter = lastCode[0];
    var rsRemainLetter = int.parse(lastCode.substring(1));
    if (rsRemainLetter == 9999999) {
      startNumber = 0;
      rsRemainLetter = 0;
      if (rsFirstLetter == "Z") {
        firstStringIndex = 0;
      } else {
        firstStringIndex = firstString.indexOf(rsFirstLetter) + 1;
      }
      startNumber = rsRemainLetter;
    } else {
      firstStringIndex = firstString.indexOf(rsFirstLetter);
      startNumber = rsRemainLetter + 1;
    }
  }

  var runNumber = firstString[firstStringIndex] + startNumber.toString().padLeft(7, '0');

  return runNumber;
}
