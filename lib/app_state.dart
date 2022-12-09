import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
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
    secureStorage = FlutterSecureStorage();
    _ratio = await secureStorage.getString('ff_ratio') ?? _ratio;
  }

  late FlutterSecureStorage secureStorage;

  String _latestDate = '';
  String get latestDate => _latestDate;
  set latestDate(String _value) {
    notifyListeners();

    _latestDate = _value;
  }

  double _latestDelta = 0.0;
  double get latestDelta => _latestDelta;
  set latestDelta(double _value) {
    notifyListeners();

    _latestDelta = _value;
  }

  String _NovoUnitsEntered = '1';
  String get NovoUnitsEntered => _NovoUnitsEntered;
  set NovoUnitsEntered(String _value) {
    notifyListeners();

    _NovoUnitsEntered = _value;
  }

  String _OptiUnitsEntered = '';
  String get OptiUnitsEntered => _OptiUnitsEntered;
  set OptiUnitsEntered(String _value) {
    notifyListeners();

    _OptiUnitsEntered = _value;
  }

  bool _recordInsulinWithCarbs = true;
  bool get recordInsulinWithCarbs => _recordInsulinWithCarbs;
  set recordInsulinWithCarbs(bool _value) {
    notifyListeners();

    _recordInsulinWithCarbs = _value;
  }

  String _carbValuForCalc = '1';
  String get carbValuForCalc => _carbValuForCalc;
  set carbValuForCalc(String _value) {
    notifyListeners();

    _carbValuForCalc = _value;
  }

  String _novoCalcField = '';
  String get novoCalcField => _novoCalcField;
  set novoCalcField(String _value) {
    notifyListeners();

    _novoCalcField = _value;
  }

  String _ratio = '15';
  String get ratio => _ratio;
  set ratio(String _value) {
    notifyListeners();

    _ratio = _value;
    secureStorage.setString('ff_ratio', _value);
  }

  void deleteRatio() {
    notifyListeners();
    secureStorage.delete(key: 'ff_ratio');
  }

  bool _FABOpen = false;
  bool get FABOpen => _FABOpen;
  set FABOpen(bool _value) {
    notifyListeners();

    _FABOpen = _value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
