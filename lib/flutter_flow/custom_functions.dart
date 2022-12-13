import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double? sgvToProgressInd(double? mmol) {
  double i = 1.0;
  if (mmol == null) {
    i = 0.1;
    return i;
  }
  if (mmol < 3.9) {
    i = 0.1;
    return i;
  }
  if (mmol > 9.4) {
    i = 1.0;
    return i;
  } else {
    return (mmol - 3.9) / (9.4 - 3.9);
  }
}

String? minutesAgo(List<String>? latestDate) {
// calculate the difference between the latest date and now. The dateString is in the "2022-11-22T09:30:53.000Z" format
  final difference = DateTime.now().difference(DateTime.parse(latestDate![0]));
  final minutes = difference.inMinutes;
  final hours = difference.inHours;
  final days = difference.inDays;
  final weeks = (days / 7).floor();
  final months = (days / 30).floor();
  final years = (days / 365).floor();

  if (minutes < 1) {
    return 'Just now';
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

List<double>? sgvListToMmolListDouble(List<int> sgv) {
//take the list of integers and convert to a list of doubles
  List<double> l = [];
  for (int i = 0; i < sgv.length; i++) {
    l.add(sgv[i] / 18);
  }
  return l;
}

double? sgvListToMmolDouble(List<dynamic> sgv) {
  var i = sgv.map((e) => (e / 18.0).toStringAsFixed(1)).toList();
  return double.parse(i.first);
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

double? mmolListToLatestMmolFirebase(List<double>? sgvToMmolList) {
  if (sgvToMmolList == null) {
    return 0.0;
  }
  if (sgvToMmolList.isEmpty) {
    return 0.0;
  }
  return sgvToMmolList.first;
}

List<DateTime> dateStringToTimestamp(List<String> date) {
  // convert a list of dateStrings to a list of timestamp
  // dateStrings are in the format of "2022-11-22T07:30:53.000Z"

  List<DateTime> timestamp = [];
  for (var i = 0; i < date.length; i++) {
    timestamp.add(DateTime.parse(date[i]));
  }
  return timestamp;
}

List<double> stringListToDoubleList(List<String>? sgvToMmolList) {
  // parse a list of Strings to a list of doubles
  var lst = <double>[];
  sgvToMmolList?.forEach((element) {
    lst.add(double.parse(element));
  });
  return lst;
}

String novoTo1DecimalPlace(String units) {
  // if units is a number without a decimal place add .0 to it
  if (units.contains('.'))
    return units;
  else
    return units + '.0';
}

double quickProgressInd(double latestMmol) {
  return (latestMmol - 3.9) / (9.4 - 3.9);
}
