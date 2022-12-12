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
    _latestMmolList = (await secureStorage.getStringList('ff_latestMmolList'))
            ?.map(double.parse)
            .toList() ??
        _latestMmolList;
    _latestDateList = await secureStorage.getStringList('ff_latestDateList') ??
        _latestDateList;
    _latestMmol = await secureStorage.getDouble('ff_latestMmol') ?? _latestMmol;
    _rememberedPass =
        await secureStorage.getString('ff_rememberedPass') ?? _rememberedPass;
    _rememberedUser =
        await secureStorage.getString('ff_rememberedUser') ?? _rememberedUser;
    _useBio = await secureStorage.getBool('ff_useBio') ?? _useBio;
    _nightscout = await secureStorage.getString('ff_nightscout') ?? _nightscout;
    _apiKey = await secureStorage.getString('ff_apiKey') ?? _apiKey;
    _token = await secureStorage.getString('ff_token') ?? _token;
  }

  late FlutterSecureStorage secureStorage;

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

  List<double> _latestMmolList = [];
  List<double> get latestMmolList => _latestMmolList;
  set latestMmolList(List<double> _value) {
    notifyListeners();

    _latestMmolList = _value;
    secureStorage.setStringList(
        'ff_latestMmolList', _value.map((x) => x.toString()).toList());
  }

  void deleteLatestMmolList() {
    notifyListeners();
    secureStorage.delete(key: 'ff_latestMmolList');
  }

  void addToLatestMmolList(double _value) {
    notifyListeners();
    _latestMmolList.add(_value);
    secureStorage.setStringList(
        'ff_latestMmolList', _latestMmolList.map((x) => x.toString()).toList());
  }

  void removeFromLatestMmolList(double _value) {
    notifyListeners();
    _latestMmolList.remove(_value);
    secureStorage.setStringList(
        'ff_latestMmolList', _latestMmolList.map((x) => x.toString()).toList());
  }

  List<String> _latestDateList = [];
  List<String> get latestDateList => _latestDateList;
  set latestDateList(List<String> _value) {
    notifyListeners();

    _latestDateList = _value;
    secureStorage.setStringList('ff_latestDateList', _value);
  }

  void deleteLatestDateList() {
    notifyListeners();
    secureStorage.delete(key: 'ff_latestDateList');
  }

  void addToLatestDateList(String _value) {
    notifyListeners();
    _latestDateList.add(_value);
    secureStorage.setStringList('ff_latestDateList', _latestDateList);
  }

  void removeFromLatestDateList(String _value) {
    notifyListeners();
    _latestDateList.remove(_value);
    secureStorage.setStringList('ff_latestDateList', _latestDateList);
  }

  double _latestMmol = 0.0;
  double get latestMmol => _latestMmol;
  set latestMmol(double _value) {
    notifyListeners();

    _latestMmol = _value;
    secureStorage.setDouble('ff_latestMmol', _value);
  }

  void deleteLatestMmol() {
    notifyListeners();
    secureStorage.delete(key: 'ff_latestMmol');
  }

  String _rememberedPass = '';
  String get rememberedPass => _rememberedPass;
  set rememberedPass(String _value) {
    notifyListeners();

    _rememberedPass = _value;
    secureStorage.setString('ff_rememberedPass', _value);
  }

  void deleteRememberedPass() {
    notifyListeners();
    secureStorage.delete(key: 'ff_rememberedPass');
  }

  String _rememberedUser = '';
  String get rememberedUser => _rememberedUser;
  set rememberedUser(String _value) {
    notifyListeners();

    _rememberedUser = _value;
    secureStorage.setString('ff_rememberedUser', _value);
  }

  void deleteRememberedUser() {
    notifyListeners();
    secureStorage.delete(key: 'ff_rememberedUser');
  }

  bool _useBio = false;
  bool get useBio => _useBio;
  set useBio(bool _value) {
    notifyListeners();

    _useBio = _value;
    secureStorage.setBool('ff_useBio', _value);
  }

  void deleteUseBio() {
    notifyListeners();
    secureStorage.delete(key: 'ff_useBio');
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

  String _apiKey = '';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    notifyListeners();

    _apiKey = _value;
    secureStorage.setString('ff_apiKey', _value);
  }

  void deleteApiKey() {
    notifyListeners();
    secureStorage.delete(key: 'ff_apiKey');
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
