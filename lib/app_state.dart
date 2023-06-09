import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    _currentAdminMember = prefs.getString('ff_currentAdminMember')?.ref ?? _currentAdminMember;
    _customerName = prefs.getString('ff_customerName') ?? _customerName;
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

  bool _isBottomSheetShow = false;

  bool get isBottomSheetShow => _isBottomSheetShow;

  set isBottomSheetShow(bool _value) {
    _isBottomSheetShow = _value;
  }

  DocumentReference? _currentAdminMember;

  DocumentReference? get currentAdminMember => _currentAdminMember;

  set currentAdminMember(DocumentReference? _value) {
    _currentAdminMember = _value;
    _value != null ? prefs.setString('ff_currentAdminMember', _value.path) : prefs.remove('ff_currentAdminMember');
  }

  String _customerName = '';

  String get customerName => _customerName;

  set customerName(String _value) {
    _customerName = _value;
    prefs.setString('ff_customerName', _value);
  }

  var _cameras;

  get cameras => _cameras;

  set cameras(var _value) {
    _cameras = _value;
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
