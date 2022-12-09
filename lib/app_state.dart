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
    _count = (await secureStorage.getStringList('ff_count'))
            ?.map(int.parse)
            .toList() ??
        _count;
    _token = await secureStorage.getString('ff_token') ?? _token;
    _apikey = await secureStorage.getString('ff_apikey') ?? _apikey;
    _nightscout = await secureStorage.getString('ff_nightscout') ?? _nightscout;
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

  List<int> _sgv = [];
  List<int> get sgv => _sgv;
  set sgv(List<int> _value) {
    notifyListeners();

    _sgv = _value;
  }

  void addToSgv(int _value) {
    notifyListeners();
    _sgv.add(_value);
  }

  void removeFromSgv(int _value) {
    notifyListeners();
    _sgv.remove(_value);
  }

  List<int> _date = [];
  List<int> get date => _date;
  set date(List<int> _value) {
    notifyListeners();

    _date = _value;
  }

  void addToDate(int _value) {
    notifyListeners();
    _date.add(_value);
  }

  void removeFromDate(int _value) {
    notifyListeners();
    _date.remove(_value);
  }

  List<String> _mmolList = [];
  List<String> get mmolList => _mmolList;
  set mmolList(List<String> _value) {
    notifyListeners();

    _mmolList = _value;
  }

  void addToMmolList(String _value) {
    notifyListeners();
    _mmolList.add(_value);
  }

  void removeFromMmolList(String _value) {
    notifyListeners();
    _mmolList.remove(_value);
  }

  List<int> _count = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];
  List<int> get count => _count;
  set count(List<int> _value) {
    notifyListeners();

    _count = _value;
    secureStorage.setStringList(
        'ff_count', _value.map((x) => x.toString()).toList());
  }

  void deleteCount() {
    notifyListeners();
    secureStorage.delete(key: 'ff_count');
  }

  void addToCount(int _value) {
    notifyListeners();
    _count.add(_value);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  void removeFromCount(int _value) {
    notifyListeners();
    _count.remove(_value);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    notifyListeners();

    _token = _value;
    secureStorage.setString('ff_token', _value);
  }

  void deleteToken() {
    notifyListeners();
    secureStorage.delete(key: 'ff_token');
  }

  String _apikey = '';
  String get apikey => _apikey;
  set apikey(String _value) {
    notifyListeners();

    _apikey = _value;
    secureStorage.setString('ff_apikey', _value);
  }

  void deleteApikey() {
    notifyListeners();
    secureStorage.delete(key: 'ff_apikey');
  }

  String _nightscout = '';
  String get nightscout => _nightscout;
  set nightscout(String _value) {
    notifyListeners();

    _nightscout = _value;
    secureStorage.setString('ff_nightscout', _value);
  }

  void deleteNightscout() {
    notifyListeners();
    secureStorage.delete(key: 'ff_nightscout');
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
