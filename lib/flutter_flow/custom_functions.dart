import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

double sgvToMmol(double sgv) {
  return sgv / 18;
}

String minutesAgo(String dateString) {
  var dateMmol = DateTime.parse(dateString);
  var howRecent = DateTime.now().difference(dateMmol);
  var inMinutes = howRecent.inMinutes;
  return "as of $inMinutes minutes ago";
}

bool showUpArrow(double delta) {
  return delta >= 1;
}

bool showColorHigh(double sgvToMmol) {
  return sgvToMmol >= 9.4;
}

bool showColorLow(double sgvToMmol) {
  return sgvToMmol <= 3.9;
}

bool showDownArrow(double delta) {
  return delta <= -1;
}
