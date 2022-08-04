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

double sgvToProgressInd(double sgv) {
  if (sgv > 180) {
    return 1.0;
  } else {
    return sgv / 180;
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

String setBgByMmol(double sgvToMmol) {
  // change image link based on the value of sgvToMmol
  var i = "https://connectio.com.au/MyCGM/assets/PrimaryBGDark.png";
  if (sgvToMmol >= 9.4) {
    i = "https://connectio.com.au/MyCGM/assets/SecBGDark-AltBGLight.png";
    return i;
  }
  if (sgvToMmol <= 3.9) {
    i = "https://connectio.com.au/MyCGM/assets/AltBGDark.png";
    return i;
  } else {
    return i;
  }
}

String setColByMmol(double sgvToMmol) {
  // change image link based on the value of sgvToMmol
  var i = "https://connectio.com.au/MyCGM/assets/Pri.png";
  if (sgvToMmol >= 9.4) {
    i = "https://connectio.com.au/MyCGM/assets/Sec.png";
    return i;
  }
  if (sgvToMmol <= 3.9) {
    i = "https://connectio.com.au/MyCGM/assets/Alt.png";
    return i;
  } else {
    return i;
  }
}

String setBgByMmolLight(double sgvToMmol) {
  // change image link based on the value of sgvToMmol
  var i = "https://connectio.com.au/MyCGM/assets/PrimaryBGLight.png";
  if (sgvToMmol >= 9.4) {
    i = "https://connectio.com.au/MyCGM/assets/SecBGLight.png";
    return i;
  }
  if (sgvToMmol <= 3.9) {
    i = "https://connectio.com.au/MyCGM/assets/SecBGDark-AltBGLight.png";
    return i;
  } else {
    return i;
  }
}
