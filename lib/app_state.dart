import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
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
    _ratio = prefs.getString('ff_ratio') ?? _ratio;
    _FABOpen = prefs.getBool('ff_FABOpen') ?? _FABOpen;
    _count = prefs.getString('ff_count') ?? _count;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _ratio = '15';
  String get ratio => _ratio;
  set ratio(String _value) {
    _ratio = _value;
    prefs.setString('ff_ratio', _value);
  }

  bool _FABOpen = false;
  bool get FABOpen => _FABOpen;
  set FABOpen(bool _value) {
    _FABOpen = _value;
    prefs.setBool('ff_FABOpen', _value);
  }

  double _carbsEntered = 0.0;
  double get carbsEntered => _carbsEntered;
  set carbsEntered(double _value) {
    _carbsEntered = _value;
  }

  bool _refresh = false;
  bool get refresh => _refresh;
  set refresh(bool _value) {
    _refresh = _value;
  }

  String _count = '30';
  String get count => _count;
  set count(String _value) {
    _count = _value;
    prefs.setString('ff_count', _value);
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
