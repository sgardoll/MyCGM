import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
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
    _mmol = await secureStorage.getDouble('ff_mmol') ?? _mmol;
  }

  late FlutterSecureStorage secureStorage;

  String latestDate = '';

  double latestDelta = 0.0;

  String NovoUnitsEntered = '1';

  String OptiUnitsEntered = '';

  bool recordInsulinWithCarbs = true;

  String carbValuForCalc = '1';

  String novoCalcField = '';

  String _ratio = '15';
  String get ratio => _ratio;
  set ratio(String _value) {
    _ratio = _value;
    secureStorage.setString('ff_ratio', _value);
  }

  void deleteRatio() {
    secureStorage.delete(key: 'ff_ratio');
  }

  List<int> sgv = [];

  List<int> date = [];

  List<String> mmolList = [];

  double _mmol = 0.0;
  double get mmol => _mmol;
  set mmol(double _value) {
    _mmol = _value;
    secureStorage.setDouble('ff_mmol', _value);
  }

  void deleteMmol() {
    secureStorage.delete(key: 'ff_mmol');
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
