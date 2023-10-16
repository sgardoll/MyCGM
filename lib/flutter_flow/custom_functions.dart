import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? minutesAgo(dynamic timestamp) {
  if (timestamp == null) {
    return "";
  }
  final latestDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final difference = DateTime.now().difference(latestDate);
  final minutes = difference.inMinutes;
  final hours = difference.inHours;
  final days = difference.inDays;
  final weeks = (days / 7).floor();
  final months = (days / 30).floor();
  final years = (days / 365).floor();

  if (minutes < 1) {
    return 'just now';
  } else if (minutes == 1) {
    return '1 minute ago';
  } else if (minutes < 60) {
    return '$minutes minutes ago';
  } else if (hours == 1) {
    return '1 hour ago';
  } else if (hours < 24) {
    return '$hours hours ago';
  } else if (days == 1) {
    return '1 day ago';
  } else if (days < 7) {
    return '$days days ago';
  } else if (weeks == 1) {
    return '1 week ago';
  } else if (weeks < 4) {
    return '$weeks weeks ago';
  } else if (months == 1) {
    return '1 month ago';
  } else if (months < 12) {
    return '$months months ago';
  } else if (years == 1) {
    return '1 year ago';
  } else {
    return '$years years ago';
  }
}

String? novoCalcBasedOnRatio(
  String? ratio,
  String? carbValuForCalc,
) {
  //check if either ratio or carbValueForCalc is null
//  if (ratio == null || carbValuForCalc == null) {
//    return "-";
//  } else {
  // convert carbValueForCalc to a number
  double carbValue = double.parse(carbValuForCalc ??= "");
  // calculate the amount of insulin based on the current ratio
  double carbs = carbValue / double.parse(ratio ??= "");
  // return the carbs as a string
  return carbs.toStringAsFixed(1);
}

String novoTo1DecimalPlace(String units) {
  // if units is a number without a decimal place add .0 to it
  if (units.contains('.'))
    return units;
  else
    return units + '.0';
}

double? stringToDouble(String? carbs) {
  // convert string to a double
  return double.tryParse(carbs ?? '');
}

List<double> sgvDivideBy18(List<dynamic> sgv) {
  List<dynamic> values = sgv ?? [];
  List<double> doubles = values.map((i) => (i as num) / 18).toList();
  return doubles;
}

String? jsonDateToString(dynamic date) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
  String dateTimeString = dateTime.toString();
  return dateTimeString;
}

int barcodeScanInt(String barcodeScan) {
  int barcodeInt = math.max(1, int.parse(barcodeScan));
  return barcodeInt;
}
