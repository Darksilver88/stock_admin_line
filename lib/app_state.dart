import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _stockChecked = [];
  List<DocumentReference> get stockChecked => _stockChecked;
  set stockChecked(List<DocumentReference> _value) {
    _stockChecked = _value;
  }

  void addToStockChecked(DocumentReference _value) {
    _stockChecked.add(_value);
  }

  void removeFromStockChecked(DocumentReference _value) {
    _stockChecked.remove(_value);
  }

  void removeAtIndexFromStockChecked(int _index) {
    _stockChecked.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
