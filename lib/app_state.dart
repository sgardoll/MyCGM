import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _latestDate = prefs.getString('ff_latestDate') ?? _latestDate;
    _latestDelta = prefs.getDouble('ff_latestDelta') ?? _latestDelta;
  }

  late SharedPreferences prefs;

  String _latestDate = '';
  String get latestDate => _latestDate;
  set latestDate(String _value) {
    _latestDate = _value;
    prefs.setString('ff_latestDate', _value);
  }

  double _latestDelta = 0.0;
  double get latestDelta => _latestDelta;
  set latestDelta(double _value) {
    _latestDelta = _value;
    prefs.setDouble('ff_latestDelta', _value);
  }

  int latestSGV = 0;

  String background =
      'https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png';
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
