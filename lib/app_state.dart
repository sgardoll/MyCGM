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
    _background = prefs.getString('ff_background') ?? _background;
    _ratio = prefs.getInt('ff_ratio') ?? _ratio;
  }

  late SharedPreferences prefs;

  int latestSGV = 0;

  String _background =
      'https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png';
  String get background => _background;
  set background(String _value) {
    _background = _value;
    prefs.setString('ff_background', _value);
  }

  String latestDate = '';

  double latestDelta = 0.0;

  String NovoUnitsEntered = '1';

  String OptiUnitsEntered = '';

  bool recordInsulinWithCarbs = true;

  String carbValuForCalc = '';

  int _ratio = 20;
  int get ratio => _ratio;
  set ratio(int _value) {
    _ratio = _value;
    prefs.setInt('ff_ratio', _value);
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
