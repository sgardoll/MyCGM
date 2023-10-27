// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OpenFoodFactsApiStruct extends FFFirebaseStruct {
  OpenFoodFactsApiStruct({
    double? carbohydrates,
    double? carbohydrates100g,
    String? carbohydratesUnit,
    double? carbohydratesValue,
    int? energy,
    double? energyKcal,
    double? energyKcal100g,
    String? energyKcalUnit,
    double? energyKcalValue,
    double? energyKcalValueComputed,
    int? energy100g,
    String? energyUnit,
    double? energyValue,
    double? fat,
    double? fat100g,
    String? fatUnit,
    double? fatValue,
    double? proteins,
    double? proteins100g,
    String? proteinsUnit,
    double? proteinsValue,
    double? sugars,
    double? sugars100g,
    String? sugarsUnit,
    double? sugarsValue,
    String? imageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _carbohydrates = carbohydrates,
        _carbohydrates100g = carbohydrates100g,
        _carbohydratesUnit = carbohydratesUnit,
        _carbohydratesValue = carbohydratesValue,
        _energy = energy,
        _energyKcal = energyKcal,
        _energyKcal100g = energyKcal100g,
        _energyKcalUnit = energyKcalUnit,
        _energyKcalValue = energyKcalValue,
        _energyKcalValueComputed = energyKcalValueComputed,
        _energy100g = energy100g,
        _energyUnit = energyUnit,
        _energyValue = energyValue,
        _fat = fat,
        _fat100g = fat100g,
        _fatUnit = fatUnit,
        _fatValue = fatValue,
        _proteins = proteins,
        _proteins100g = proteins100g,
        _proteinsUnit = proteinsUnit,
        _proteinsValue = proteinsValue,
        _sugars = sugars,
        _sugars100g = sugars100g,
        _sugarsUnit = sugarsUnit,
        _sugarsValue = sugarsValue,
        _imageUrl = imageUrl,
        super(firestoreUtilData);

  // "carbohydrates" field.
  double? _carbohydrates;
  double get carbohydrates => _carbohydrates ?? 0.0;
  set carbohydrates(double? val) => _carbohydrates = val;
  void incrementCarbohydrates(double amount) =>
      _carbohydrates = carbohydrates + amount;
  bool hasCarbohydrates() => _carbohydrates != null;

  // "carbohydrates_100g" field.
  double? _carbohydrates100g;
  double get carbohydrates100g => _carbohydrates100g ?? 0.0;
  set carbohydrates100g(double? val) => _carbohydrates100g = val;
  void incrementCarbohydrates100g(double amount) =>
      _carbohydrates100g = carbohydrates100g + amount;
  bool hasCarbohydrates100g() => _carbohydrates100g != null;

  // "carbohydrates_unit" field.
  String? _carbohydratesUnit;
  String get carbohydratesUnit => _carbohydratesUnit ?? '';
  set carbohydratesUnit(String? val) => _carbohydratesUnit = val;
  bool hasCarbohydratesUnit() => _carbohydratesUnit != null;

  // "carbohydrates_value" field.
  double? _carbohydratesValue;
  double get carbohydratesValue => _carbohydratesValue ?? 0.0;
  set carbohydratesValue(double? val) => _carbohydratesValue = val;
  void incrementCarbohydratesValue(double amount) =>
      _carbohydratesValue = carbohydratesValue + amount;
  bool hasCarbohydratesValue() => _carbohydratesValue != null;

  // "energy" field.
  int? _energy;
  int get energy => _energy ?? 0;
  set energy(int? val) => _energy = val;
  void incrementEnergy(int amount) => _energy = energy + amount;
  bool hasEnergy() => _energy != null;

  // "energy-kcal" field.
  double? _energyKcal;
  double get energyKcal => _energyKcal ?? 0.0;
  set energyKcal(double? val) => _energyKcal = val;
  void incrementEnergyKcal(double amount) => _energyKcal = energyKcal + amount;
  bool hasEnergyKcal() => _energyKcal != null;

  // "energy-kcal_100g" field.
  double? _energyKcal100g;
  double get energyKcal100g => _energyKcal100g ?? 0.0;
  set energyKcal100g(double? val) => _energyKcal100g = val;
  void incrementEnergyKcal100g(double amount) =>
      _energyKcal100g = energyKcal100g + amount;
  bool hasEnergyKcal100g() => _energyKcal100g != null;

  // "energy-kcal_unit" field.
  String? _energyKcalUnit;
  String get energyKcalUnit => _energyKcalUnit ?? '';
  set energyKcalUnit(String? val) => _energyKcalUnit = val;
  bool hasEnergyKcalUnit() => _energyKcalUnit != null;

  // "energy-kcal_value" field.
  double? _energyKcalValue;
  double get energyKcalValue => _energyKcalValue ?? 0.0;
  set energyKcalValue(double? val) => _energyKcalValue = val;
  void incrementEnergyKcalValue(double amount) =>
      _energyKcalValue = energyKcalValue + amount;
  bool hasEnergyKcalValue() => _energyKcalValue != null;

  // "energy-kcal_value_computed" field.
  double? _energyKcalValueComputed;
  double get energyKcalValueComputed => _energyKcalValueComputed ?? 0.0;
  set energyKcalValueComputed(double? val) => _energyKcalValueComputed = val;
  void incrementEnergyKcalValueComputed(double amount) =>
      _energyKcalValueComputed = energyKcalValueComputed + amount;
  bool hasEnergyKcalValueComputed() => _energyKcalValueComputed != null;

  // "energy_100g" field.
  int? _energy100g;
  int get energy100g => _energy100g ?? 0;
  set energy100g(int? val) => _energy100g = val;
  void incrementEnergy100g(int amount) => _energy100g = energy100g + amount;
  bool hasEnergy100g() => _energy100g != null;

  // "energy_unit" field.
  String? _energyUnit;
  String get energyUnit => _energyUnit ?? '';
  set energyUnit(String? val) => _energyUnit = val;
  bool hasEnergyUnit() => _energyUnit != null;

  // "energy_value" field.
  double? _energyValue;
  double get energyValue => _energyValue ?? 0.0;
  set energyValue(double? val) => _energyValue = val;
  void incrementEnergyValue(double amount) =>
      _energyValue = energyValue + amount;
  bool hasEnergyValue() => _energyValue != null;

  // "fat" field.
  double? _fat;
  double get fat => _fat ?? 0.0;
  set fat(double? val) => _fat = val;
  void incrementFat(double amount) => _fat = fat + amount;
  bool hasFat() => _fat != null;

  // "fat_100g" field.
  double? _fat100g;
  double get fat100g => _fat100g ?? 0.0;
  set fat100g(double? val) => _fat100g = val;
  void incrementFat100g(double amount) => _fat100g = fat100g + amount;
  bool hasFat100g() => _fat100g != null;

  // "fat_unit" field.
  String? _fatUnit;
  String get fatUnit => _fatUnit ?? '';
  set fatUnit(String? val) => _fatUnit = val;
  bool hasFatUnit() => _fatUnit != null;

  // "fat_value" field.
  double? _fatValue;
  double get fatValue => _fatValue ?? 0.0;
  set fatValue(double? val) => _fatValue = val;
  void incrementFatValue(double amount) => _fatValue = fatValue + amount;
  bool hasFatValue() => _fatValue != null;

  // "proteins" field.
  double? _proteins;
  double get proteins => _proteins ?? 0.0;
  set proteins(double? val) => _proteins = val;
  void incrementProteins(double amount) => _proteins = proteins + amount;
  bool hasProteins() => _proteins != null;

  // "proteins_100g" field.
  double? _proteins100g;
  double get proteins100g => _proteins100g ?? 0.0;
  set proteins100g(double? val) => _proteins100g = val;
  void incrementProteins100g(double amount) =>
      _proteins100g = proteins100g + amount;
  bool hasProteins100g() => _proteins100g != null;

  // "proteins_unit" field.
  String? _proteinsUnit;
  String get proteinsUnit => _proteinsUnit ?? '';
  set proteinsUnit(String? val) => _proteinsUnit = val;
  bool hasProteinsUnit() => _proteinsUnit != null;

  // "proteins_value" field.
  double? _proteinsValue;
  double get proteinsValue => _proteinsValue ?? 0.0;
  set proteinsValue(double? val) => _proteinsValue = val;
  void incrementProteinsValue(double amount) =>
      _proteinsValue = proteinsValue + amount;
  bool hasProteinsValue() => _proteinsValue != null;

  // "sugars" field.
  double? _sugars;
  double get sugars => _sugars ?? 0.0;
  set sugars(double? val) => _sugars = val;
  void incrementSugars(double amount) => _sugars = sugars + amount;
  bool hasSugars() => _sugars != null;

  // "sugars_100g" field.
  double? _sugars100g;
  double get sugars100g => _sugars100g ?? 0.0;
  set sugars100g(double? val) => _sugars100g = val;
  void incrementSugars100g(double amount) => _sugars100g = sugars100g + amount;
  bool hasSugars100g() => _sugars100g != null;

  // "sugars_unit" field.
  String? _sugarsUnit;
  String get sugarsUnit => _sugarsUnit ?? '';
  set sugarsUnit(String? val) => _sugarsUnit = val;
  bool hasSugarsUnit() => _sugarsUnit != null;

  // "sugars_value" field.
  double? _sugarsValue;
  double get sugarsValue => _sugarsValue ?? 0.0;
  set sugarsValue(double? val) => _sugarsValue = val;
  void incrementSugarsValue(double amount) =>
      _sugarsValue = sugarsValue + amount;
  bool hasSugarsValue() => _sugarsValue != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;
  bool hasImageUrl() => _imageUrl != null;

  static OpenFoodFactsApiStruct fromMap(Map<String, dynamic> data) =>
      OpenFoodFactsApiStruct(
        carbohydrates: castToType<double>(data['carbohydrates']),
        carbohydrates100g: castToType<double>(data['carbohydrates_100g']),
        carbohydratesUnit: data['carbohydrates_unit'] as String?,
        carbohydratesValue: castToType<double>(data['carbohydrates_value']),
        energy: castToType<int>(data['energy']),
        energyKcal: castToType<double>(data['energy-kcal']),
        energyKcal100g: castToType<double>(data['energy-kcal_100g']),
        energyKcalUnit: data['energy-kcal_unit'] as String?,
        energyKcalValue: castToType<double>(data['energy-kcal_value']),
        energyKcalValueComputed:
            castToType<double>(data['energy-kcal_value_computed']),
        energy100g: castToType<int>(data['energy_100g']),
        energyUnit: data['energy_unit'] as String?,
        energyValue: castToType<double>(data['energy_value']),
        fat: castToType<double>(data['fat']),
        fat100g: castToType<double>(data['fat_100g']),
        fatUnit: data['fat_unit'] as String?,
        fatValue: castToType<double>(data['fat_value']),
        proteins: castToType<double>(data['proteins']),
        proteins100g: castToType<double>(data['proteins_100g']),
        proteinsUnit: data['proteins_unit'] as String?,
        proteinsValue: castToType<double>(data['proteins_value']),
        sugars: castToType<double>(data['sugars']),
        sugars100g: castToType<double>(data['sugars_100g']),
        sugarsUnit: data['sugars_unit'] as String?,
        sugarsValue: castToType<double>(data['sugars_value']),
        imageUrl: data['imageUrl'] as String?,
      );

  static OpenFoodFactsApiStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? OpenFoodFactsApiStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'carbohydrates': _carbohydrates,
        'carbohydrates_100g': _carbohydrates100g,
        'carbohydrates_unit': _carbohydratesUnit,
        'carbohydrates_value': _carbohydratesValue,
        'energy': _energy,
        'energy-kcal': _energyKcal,
        'energy-kcal_100g': _energyKcal100g,
        'energy-kcal_unit': _energyKcalUnit,
        'energy-kcal_value': _energyKcalValue,
        'energy-kcal_value_computed': _energyKcalValueComputed,
        'energy_100g': _energy100g,
        'energy_unit': _energyUnit,
        'energy_value': _energyValue,
        'fat': _fat,
        'fat_100g': _fat100g,
        'fat_unit': _fatUnit,
        'fat_value': _fatValue,
        'proteins': _proteins,
        'proteins_100g': _proteins100g,
        'proteins_unit': _proteinsUnit,
        'proteins_value': _proteinsValue,
        'sugars': _sugars,
        'sugars_100g': _sugars100g,
        'sugars_unit': _sugarsUnit,
        'sugars_value': _sugarsValue,
        'imageUrl': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'carbohydrates': serializeParam(
          _carbohydrates,
          ParamType.double,
        ),
        'carbohydrates_100g': serializeParam(
          _carbohydrates100g,
          ParamType.double,
        ),
        'carbohydrates_unit': serializeParam(
          _carbohydratesUnit,
          ParamType.String,
        ),
        'carbohydrates_value': serializeParam(
          _carbohydratesValue,
          ParamType.double,
        ),
        'energy': serializeParam(
          _energy,
          ParamType.int,
        ),
        'energy-kcal': serializeParam(
          _energyKcal,
          ParamType.double,
        ),
        'energy-kcal_100g': serializeParam(
          _energyKcal100g,
          ParamType.double,
        ),
        'energy-kcal_unit': serializeParam(
          _energyKcalUnit,
          ParamType.String,
        ),
        'energy-kcal_value': serializeParam(
          _energyKcalValue,
          ParamType.double,
        ),
        'energy-kcal_value_computed': serializeParam(
          _energyKcalValueComputed,
          ParamType.double,
        ),
        'energy_100g': serializeParam(
          _energy100g,
          ParamType.int,
        ),
        'energy_unit': serializeParam(
          _energyUnit,
          ParamType.String,
        ),
        'energy_value': serializeParam(
          _energyValue,
          ParamType.double,
        ),
        'fat': serializeParam(
          _fat,
          ParamType.double,
        ),
        'fat_100g': serializeParam(
          _fat100g,
          ParamType.double,
        ),
        'fat_unit': serializeParam(
          _fatUnit,
          ParamType.String,
        ),
        'fat_value': serializeParam(
          _fatValue,
          ParamType.double,
        ),
        'proteins': serializeParam(
          _proteins,
          ParamType.double,
        ),
        'proteins_100g': serializeParam(
          _proteins100g,
          ParamType.double,
        ),
        'proteins_unit': serializeParam(
          _proteinsUnit,
          ParamType.String,
        ),
        'proteins_value': serializeParam(
          _proteinsValue,
          ParamType.double,
        ),
        'sugars': serializeParam(
          _sugars,
          ParamType.double,
        ),
        'sugars_100g': serializeParam(
          _sugars100g,
          ParamType.double,
        ),
        'sugars_unit': serializeParam(
          _sugarsUnit,
          ParamType.String,
        ),
        'sugars_value': serializeParam(
          _sugarsValue,
          ParamType.double,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static OpenFoodFactsApiStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OpenFoodFactsApiStruct(
        carbohydrates: deserializeParam(
          data['carbohydrates'],
          ParamType.double,
          false,
        ),
        carbohydrates100g: deserializeParam(
          data['carbohydrates_100g'],
          ParamType.double,
          false,
        ),
        carbohydratesUnit: deserializeParam(
          data['carbohydrates_unit'],
          ParamType.String,
          false,
        ),
        carbohydratesValue: deserializeParam(
          data['carbohydrates_value'],
          ParamType.double,
          false,
        ),
        energy: deserializeParam(
          data['energy'],
          ParamType.int,
          false,
        ),
        energyKcal: deserializeParam(
          data['energy-kcal'],
          ParamType.double,
          false,
        ),
        energyKcal100g: deserializeParam(
          data['energy-kcal_100g'],
          ParamType.double,
          false,
        ),
        energyKcalUnit: deserializeParam(
          data['energy-kcal_unit'],
          ParamType.String,
          false,
        ),
        energyKcalValue: deserializeParam(
          data['energy-kcal_value'],
          ParamType.double,
          false,
        ),
        energyKcalValueComputed: deserializeParam(
          data['energy-kcal_value_computed'],
          ParamType.double,
          false,
        ),
        energy100g: deserializeParam(
          data['energy_100g'],
          ParamType.int,
          false,
        ),
        energyUnit: deserializeParam(
          data['energy_unit'],
          ParamType.String,
          false,
        ),
        energyValue: deserializeParam(
          data['energy_value'],
          ParamType.double,
          false,
        ),
        fat: deserializeParam(
          data['fat'],
          ParamType.double,
          false,
        ),
        fat100g: deserializeParam(
          data['fat_100g'],
          ParamType.double,
          false,
        ),
        fatUnit: deserializeParam(
          data['fat_unit'],
          ParamType.String,
          false,
        ),
        fatValue: deserializeParam(
          data['fat_value'],
          ParamType.double,
          false,
        ),
        proteins: deserializeParam(
          data['proteins'],
          ParamType.double,
          false,
        ),
        proteins100g: deserializeParam(
          data['proteins_100g'],
          ParamType.double,
          false,
        ),
        proteinsUnit: deserializeParam(
          data['proteins_unit'],
          ParamType.String,
          false,
        ),
        proteinsValue: deserializeParam(
          data['proteins_value'],
          ParamType.double,
          false,
        ),
        sugars: deserializeParam(
          data['sugars'],
          ParamType.double,
          false,
        ),
        sugars100g: deserializeParam(
          data['sugars_100g'],
          ParamType.double,
          false,
        ),
        sugarsUnit: deserializeParam(
          data['sugars_unit'],
          ParamType.String,
          false,
        ),
        sugarsValue: deserializeParam(
          data['sugars_value'],
          ParamType.double,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OpenFoodFactsApiStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OpenFoodFactsApiStruct &&
        carbohydrates == other.carbohydrates &&
        carbohydrates100g == other.carbohydrates100g &&
        carbohydratesUnit == other.carbohydratesUnit &&
        carbohydratesValue == other.carbohydratesValue &&
        energy == other.energy &&
        energyKcal == other.energyKcal &&
        energyKcal100g == other.energyKcal100g &&
        energyKcalUnit == other.energyKcalUnit &&
        energyKcalValue == other.energyKcalValue &&
        energyKcalValueComputed == other.energyKcalValueComputed &&
        energy100g == other.energy100g &&
        energyUnit == other.energyUnit &&
        energyValue == other.energyValue &&
        fat == other.fat &&
        fat100g == other.fat100g &&
        fatUnit == other.fatUnit &&
        fatValue == other.fatValue &&
        proteins == other.proteins &&
        proteins100g == other.proteins100g &&
        proteinsUnit == other.proteinsUnit &&
        proteinsValue == other.proteinsValue &&
        sugars == other.sugars &&
        sugars100g == other.sugars100g &&
        sugarsUnit == other.sugarsUnit &&
        sugarsValue == other.sugarsValue &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        carbohydrates,
        carbohydrates100g,
        carbohydratesUnit,
        carbohydratesValue,
        energy,
        energyKcal,
        energyKcal100g,
        energyKcalUnit,
        energyKcalValue,
        energyKcalValueComputed,
        energy100g,
        energyUnit,
        energyValue,
        fat,
        fat100g,
        fatUnit,
        fatValue,
        proteins,
        proteins100g,
        proteinsUnit,
        proteinsValue,
        sugars,
        sugars100g,
        sugarsUnit,
        sugarsValue,
        imageUrl
      ]);
}

OpenFoodFactsApiStruct createOpenFoodFactsApiStruct({
  double? carbohydrates,
  double? carbohydrates100g,
  String? carbohydratesUnit,
  double? carbohydratesValue,
  int? energy,
  double? energyKcal,
  double? energyKcal100g,
  String? energyKcalUnit,
  double? energyKcalValue,
  double? energyKcalValueComputed,
  int? energy100g,
  String? energyUnit,
  double? energyValue,
  double? fat,
  double? fat100g,
  String? fatUnit,
  double? fatValue,
  double? proteins,
  double? proteins100g,
  String? proteinsUnit,
  double? proteinsValue,
  double? sugars,
  double? sugars100g,
  String? sugarsUnit,
  double? sugarsValue,
  String? imageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OpenFoodFactsApiStruct(
      carbohydrates: carbohydrates,
      carbohydrates100g: carbohydrates100g,
      carbohydratesUnit: carbohydratesUnit,
      carbohydratesValue: carbohydratesValue,
      energy: energy,
      energyKcal: energyKcal,
      energyKcal100g: energyKcal100g,
      energyKcalUnit: energyKcalUnit,
      energyKcalValue: energyKcalValue,
      energyKcalValueComputed: energyKcalValueComputed,
      energy100g: energy100g,
      energyUnit: energyUnit,
      energyValue: energyValue,
      fat: fat,
      fat100g: fat100g,
      fatUnit: fatUnit,
      fatValue: fatValue,
      proteins: proteins,
      proteins100g: proteins100g,
      proteinsUnit: proteinsUnit,
      proteinsValue: proteinsValue,
      sugars: sugars,
      sugars100g: sugars100g,
      sugarsUnit: sugarsUnit,
      sugarsValue: sugarsValue,
      imageUrl: imageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OpenFoodFactsApiStruct? updateOpenFoodFactsApiStruct(
  OpenFoodFactsApiStruct? openFoodFactsApi, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    openFoodFactsApi
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOpenFoodFactsApiStructData(
  Map<String, dynamic> firestoreData,
  OpenFoodFactsApiStruct? openFoodFactsApi,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (openFoodFactsApi == null) {
    return;
  }
  if (openFoodFactsApi.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && openFoodFactsApi.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final openFoodFactsApiData =
      getOpenFoodFactsApiFirestoreData(openFoodFactsApi, forFieldValue);
  final nestedData =
      openFoodFactsApiData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = openFoodFactsApi.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOpenFoodFactsApiFirestoreData(
  OpenFoodFactsApiStruct? openFoodFactsApi, [
  bool forFieldValue = false,
]) {
  if (openFoodFactsApi == null) {
    return {};
  }
  final firestoreData = mapToFirestore(openFoodFactsApi.toMap());

  // Add any Firestore field values
  openFoodFactsApi.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOpenFoodFactsApiListFirestoreData(
  List<OpenFoodFactsApiStruct>? openFoodFactsApis,
) =>
    openFoodFactsApis
        ?.map((e) => getOpenFoodFactsApiFirestoreData(e, true))
        .toList() ??
    [];
