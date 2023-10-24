import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _ratio = await secureStorage.getString('ff_ratio') ?? _ratio;
    });
    await _safeInitAsync(() async {
      _FABOpen = await secureStorage.getBool('ff_FABOpen') ?? _FABOpen;
    });
    await _safeInitAsync(() async {
      _mmolList = (await secureStorage.getStringList('ff_mmolList'))
              ?.map(double.parse)
              .toList() ??
          _mmolList;
    });
    await _safeInitAsync(() async {
      _latestSgv = await secureStorage.getInt('ff_latestSgv') ?? _latestSgv;
    });
    await _safeInitAsync(() async {
      _latestMmol =
          await secureStorage.getDouble('ff_latestMmol') ?? _latestMmol;
    });
    await _safeInitAsync(() async {
      _mainColor =
          _colorFromIntValue(await secureStorage.getInt('ff_mainColor')) ??
              _mainColor;
    });
    await _safeInitAsync(() async {
      _bgColor = _colorFromIntValue(await secureStorage.getInt('ff_bgColor')) ??
          _bgColor;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _ratio = '15';
  String get ratio => _ratio;
  set ratio(String _value) {
    _ratio = _value;
    secureStorage.setString('ff_ratio', _value);
  }

  void deleteRatio() {
    secureStorage.delete(key: 'ff_ratio');
  }

  bool _FABOpen = false;
  bool get FABOpen => _FABOpen;
  set FABOpen(bool _value) {
    _FABOpen = _value;
    secureStorage.setBool('ff_FABOpen', _value);
  }

  void deleteFABOpen() {
    secureStorage.delete(key: 'ff_FABOpen');
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
  }

  List<int> _percentages = [34, 42, 24];
  List<int> get percentages => _percentages;
  set percentages(List<int> _value) {
    _percentages = _value;
  }

  void addToPercentages(int _value) {
    _percentages.add(_value);
  }

  void removeFromPercentages(int _value) {
    _percentages.remove(_value);
  }

  void removeAtIndexFromPercentages(int _index) {
    _percentages.removeAt(_index);
  }

  void updatePercentagesAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _percentages[_index] = updateFn(_percentages[_index]);
  }

  void insertAtIndexInPercentages(int _index, int _value) {
    _percentages.insert(_index, _value);
  }

  List<double> _mmolList = [];
  List<double> get mmolList => _mmolList;
  set mmolList(List<double> _value) {
    _mmolList = _value;
    secureStorage.setStringList(
        'ff_mmolList', _value.map((x) => x.toString()).toList());
  }

  void deleteMmolList() {
    secureStorage.delete(key: 'ff_mmolList');
  }

  void addToMmolList(double _value) {
    _mmolList.add(_value);
    secureStorage.setStringList(
        'ff_mmolList', _mmolList.map((x) => x.toString()).toList());
  }

  void removeFromMmolList(double _value) {
    _mmolList.remove(_value);
    secureStorage.setStringList(
        'ff_mmolList', _mmolList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromMmolList(int _index) {
    _mmolList.removeAt(_index);
    secureStorage.setStringList(
        'ff_mmolList', _mmolList.map((x) => x.toString()).toList());
  }

  void updateMmolListAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _mmolList[_index] = updateFn(_mmolList[_index]);
    secureStorage.setStringList(
        'ff_mmolList', _mmolList.map((x) => x.toString()).toList());
  }

  void insertAtIndexInMmolList(int _index, double _value) {
    _mmolList.insert(_index, _value);
    secureStorage.setStringList(
        'ff_mmolList', _mmolList.map((x) => x.toString()).toList());
  }

  int _latestSgv = 0;
  int get latestSgv => _latestSgv;
  set latestSgv(int _value) {
    _latestSgv = _value;
    secureStorage.setInt('ff_latestSgv', _value);
  }

  void deleteLatestSgv() {
    secureStorage.delete(key: 'ff_latestSgv');
  }

  double _latestMmol = 0.0;
  double get latestMmol => _latestMmol;
  set latestMmol(double _value) {
    _latestMmol = _value;
    secureStorage.setDouble('ff_latestMmol', _value);
  }

  void deleteLatestMmol() {
    secureStorage.delete(key: 'ff_latestMmol');
  }

  Color _mainColor = Color(4278883222);
  Color get mainColor => _mainColor;
  set mainColor(Color _value) {
    _mainColor = _value;
    secureStorage.setInt('ff_mainColor', _value.value);
  }

  void deleteMainColor() {
    secureStorage.delete(key: 'ff_mainColor');
  }

  Color _bgColor = Color(1291870067);
  Color get bgColor => _bgColor;
  set bgColor(Color _value) {
    _bgColor = _value;
    secureStorage.setInt('ff_bgColor', _value.value);
  }

  void deleteBgColor() {
    secureStorage.delete(key: 'ff_bgColor');
  }

  List<dynamic> _sgvList = [];
  List<dynamic> get sgvList => _sgvList;
  set sgvList(List<dynamic> _value) {
    _sgvList = _value;
  }

  void addToSgvList(dynamic _value) {
    _sgvList.add(_value);
  }

  void removeFromSgvList(dynamic _value) {
    _sgvList.remove(_value);
  }

  void removeAtIndexFromSgvList(int _index) {
    _sgvList.removeAt(_index);
  }

  void updateSgvListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _sgvList[_index] = updateFn(_sgvList[_index]);
  }

  void insertAtIndexInSgvList(int _index, dynamic _value) {
    _sgvList.insert(_index, _value);
  }

  bool _searchOn = false;
  bool get searchOn => _searchOn;
  set searchOn(bool _value) {
    _searchOn = _value;
  }

  bool _firstOpen = true;
  bool get firstOpen => _firstOpen;
  set firstOpen(bool _value) {
    _firstOpen = _value;
  }

  final _foodDataManager = FutureRequestManager<List<FoodDataRecord>>();
  Future<List<FoodDataRecord>> foodData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<FoodDataRecord>> Function() requestFn,
  }) =>
      _foodDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFoodDataCache() => _foodDataManager.clear();
  void clearFoodDataCacheKey(String? uniqueKey) =>
      _foodDataManager.clearRequest(uniqueKey);
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

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
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
