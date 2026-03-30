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
import '/auth/firebase_auth/auth_util.dart';

String? getNextMonth() {
  DateTime now = DateTime.now();
  int nextMonth;

  // Logic to determine the next month's index (1-12)
  if (now.month == 12) {
    nextMonth = 1;
  } else {
    nextMonth = now.month + 1;
  }

  // Map the number to the Month Name string
  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  // Return the name (List is 0-indexed, so we subtract 1)
  return monthNames[nextMonth - 1];
}

int? getCurrentMonthIndex() {
  return DateTime.now().month - 1;
}

int getNextMonthIndex() {
  return (DateTime.now().month - 1 + 1) % 12;
}

int getNext2ndMonthIndex() {
  return (DateTime.now().month - 1 + 2) % 12;
}

int getNext3rdMonthIndex() {
  return (DateTime.now().month - 1 + 3) % 12;
}

bool isIndexEven(int index) {
  // % 2 finds the remainder. If it's 0, the number is even.
  return index % 2 == 0;
}
