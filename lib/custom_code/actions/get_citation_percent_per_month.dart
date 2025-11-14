// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

/// Note: You must remove the List<CitationRecord> parameter as the action is
/// now fetching the data itself.
Future<double?> getCitationPercentPerMonth() async {
  // Get current month and year
  final now = DateTime.now();
  final thisMonthName = DateFormat('MMMM').format(now);
  final thisYear = now.year.toString();

  // Compute previous month and year manually
  final lastMonthDate = DateTime(now.year, now.month - 1, 1);
  final lastMonthName = DateFormat('MMMM').format(lastMonthDate);
  final lastMonthYear = lastMonthDate.year.toString();

  // Reference to your Firestore collection (assuming it's 'citations')
  final citationsCollection = FirebaseFirestore.instance.collection('citation');

  // --- A. Get This Month's Count ---
  final thisMonthQuery = await citationsCollection
      .where('appre_date_month', isEqualTo: thisMonthName)
      .where('appre_date_year', isEqualTo: thisYear)
      .get();

  final thisMonthCount = thisMonthQuery.size;

  // --- B. Get Last Month's Count ---
  final lastMonthQuery = await citationsCollection
      .where('appre_date_month', isEqualTo: lastMonthName)
      .where('appre_date_year', isEqualTo: lastMonthYear)
      .get();

  final lastMonthCount = lastMonthQuery.size;

  // --- Calculation ---

  // Check if last month's count is zero to avoid division by zero
  if (lastMonthCount == 0) {
    // If there's an increase from 0, return null (undefined percent change)
    return thisMonthCount > 0 ? null : 0.0;
  }

  // Calculate the difference and percentage difference
  final difference = thisMonthCount - lastMonthCount;
  final percentDifference = (difference / lastMonthCount) * 100;

  return percentDifference;
}
