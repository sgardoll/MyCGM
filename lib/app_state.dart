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
    _count = (await secureStorage.getStringList('ff_count'))
            ?.map(int.parse)
            .toList() ??
        _count;
    _token = await secureStorage.getString('ff_token') ?? _token;
    _apikey = await secureStorage.getString('ff_apikey') ?? _apikey;
    _nightscout = await secureStorage.getString('ff_nightscout') ?? _nightscout;
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
    _count = _value;
    secureStorage.setStringList(
        'ff_count', _value.map((x) => x.toString()).toList());
  }

  void deleteCount() {
    secureStorage.delete(key: 'ff_count');
  }

  void addToCount(int _value) {
    _count.add(_value);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  void removeFromCount(int _value) {
    _count.remove(_value);
    secureStorage.setStringList(
        'ff_count', _count.map((x) => x.toString()).toList());
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    secureStorage.setString('ff_token', _value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  String _apikey = '';
  String get apikey => _apikey;
  set apikey(String _value) {
    _apikey = _value;
    secureStorage.setString('ff_apikey', _value);
  }

  void deleteApikey() {
    secureStorage.delete(key: 'ff_apikey');
  }

  String _nightscout = '';
  String get nightscout => _nightscout;
  set nightscout(String _value) {
    _nightscout = _value;
    secureStorage.setString('ff_nightscout', _value);
  }

  void deleteNightscout() {
    secureStorage.delete(key: 'ff_nightscout');
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
