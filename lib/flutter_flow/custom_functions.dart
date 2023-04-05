import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../app_state.dart';
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';
import 'package:image/image.dart' as ui;
import 'package:image/image.dart' as img;

Future getStockStatus(int? status) async {
  var rs = await FirebaseFirestore.instance.collection('kconnect_config/config/stock_status').where('id', isEqualTo: status).get();
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

addWaterMark(originalImgPath) async {
  var originalImgByte = (kIsWeb) ? await originalImgPath.readAsBytes() : await _readFileByte(originalImgPath.path);
  var a = (await rootBundle.load("assets/images/watermark.png")).buffer.asUint8List();
  return overlayImg(originalImgByte, a);
}

Future<Uint8List> _readFileByte(String filePath) async {
  print("filePath");
  print(filePath.runtimeType);
  Uri myUri = Uri.parse(filePath);
  print(myUri);
  File audioFile = new File.fromUri(myUri);
  late Uint8List bytes;
  await audioFile.readAsBytes().then((value) {
    bytes = Uint8List.fromList(value);
    print('reading of bytes is completed');
  }).catchError((onError) {
    print('Exception Error while reading audio from path:' + onError.toString());
  });
  return bytes;
}

overlayImg(image1, Uint8List image2) {
  ui.Image? originalImage = ui.decodeImage(image1);
  ui.Image? watermarkImage = ui.decodeImage(image2);
  watermarkImage = ui.copyResize(watermarkImage!, width: originalImage!.width);

  final mergedImage = ui.Image(originalImage.width, originalImage.height);

  ui.copyInto(originalImage, watermarkImage, center: true);
  ui.copyInto(mergedImage, originalImage);

  int newWidth = (originalImage.width * 0.3).toInt();
  int newHeight = (newWidth * (originalImage.height / originalImage.width)).toInt();

  /*print("originalImage width : " + originalImage.width.toString());
  print("originalImage height : " + originalImage.height.toString());
  print("newWidth : " + newWidth.toString());
  print("newHeight : " + newHeight.toString());*/

  var resized = ui.copyResize(mergedImage, width: newWidth, height: newHeight);

  List<int> wmImage = ui.encodePng(resized);
  Uint8List encodeImg = Uint8List.fromList(wmImage);

  return encodeImg;
}
