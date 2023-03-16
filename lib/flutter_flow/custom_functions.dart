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
