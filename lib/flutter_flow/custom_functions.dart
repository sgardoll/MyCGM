import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

double sgvToProgressInd(int sgv) {
  double i = 1.0;
  if (sgv < 61) {
    i = 0.1;
    return i;
  }
  if (sgv > 169) {
    i = 1.0;
    return i;
  } else {
    i = sgv / 180;
    return i;
  }
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

bool showDownArrow(double delta) {
  return delta <= -1;
}

String setBgByMmol(double sgvToDoubleMmol) {
  // change image link based on the value of sgvToMmol
  var i = "https://connectio.com.au/MyCGM/assets/PrimaryBGDark.png";
  if (sgvToDoubleMmol >= 9.4) {
    i = "https://connectio.com.au/MyCGM/assets/SecBGDark-AltBGLight.png";
    return i;
  }
  if (sgvToDoubleMmol <= 3.9) {
    i = "https://connectio.com.au/MyCGM/assets/AltBGDark.png";
    return i;
  } else {
    return i = "https://connectio.com.au/MyCGM/assets/PrimaryBGDark.png";
  }
}

String setColByMmol(double sgvToDoubleMmol) {
  // change image link based on the value of sgvToMmol
  var i = "https://connectio.com.au/MyCGM/assets/Pri.png";
  if (sgvToDoubleMmol >= 9.4) {
    i = "https://connectio.com.au/MyCGM/assets/Sec.png";
    return i;
  }
  if (sgvToDoubleMmol <= 3.9) {
    i = "https://connectio.com.au/MyCGM/assets/Alt.png";
    return i;
  } else {
    return i = "https://connectio.com.au/MyCGM/assets/Pri.png";
  }
}

String setBgByMmolLight(double sgvToDoubleMmol) {
  // change image link based on the value of sgvToMmol
  var i = "https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png";
  if (sgvToDoubleMmol >= 9.4) {
    i = "https://connectio.com.au/MyCGM/assets/SecBGLight.png";
    return i;
  }
  if (sgvToDoubleMmol <= 3.9) {
    i = "https://connectio.com.au/MyCGM/assets/SecBGDark-AltBGLight.png";
    return i;
  } else {
    return i;
  }
}

double sgvToDoubleMmol(int sgv) {
  // convert sgv from a String into a double and divide it by 18 to get mmol
  num x = sgv / 18;
  var y = double.parse((x).toStringAsFixed(1));
  return y;
}
