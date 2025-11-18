// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';

/// Calculates the percentage difference in citations between this month and
/// last month using the 'created_time' Timestamp field.
///
/// Returns: - The calculated percentage (rounded to 2 decimals) on success. -
/// null if Last Month's count is 0 and This Month's is > 0 (N/A). - 0.0 if
/// both counts are 0. - -999.0 if a Firestore query or other exception occurs
/// (error sentinel).
Future<double?> getCitationPercentPerMonth() async {
  // ✅ Confirmed Timestamp field name
  const String kCitationTimestampField = 'created_time';

  try {
    // --- 1. Define Date Ranges (Using Local Time) ---
    final now = DateTime.now();

    // Define This Month's Start (1st day of current month, 00:00:00 local)
    final thisMonthStart = DateTime(now.year, now.month, 1);

    // Define Next Month's Start (Exclusive end date for this month's count)
    final nextMonthStart = DateTime(now.year, now.month + 1, 1);

    // Define Last Month's Start (1st day of previous month)
    final lastMonthStart = DateTime(now.year, now.month - 1, 1);

    // Reference to your Firestore collection
    final citationsCollection =
        FirebaseFirestore.instance.collection('citation');

    // --- 2. Get This Month's Count ---
    final thisMonthQuery = await citationsCollection
        // Querying based on Timestamp range
        .where(kCitationTimestampField, isGreaterThanOrEqualTo: thisMonthStart)
        .where(kCitationTimestampField, isLessThan: nextMonthStart)
        .get();

    final int thisMonthCount = thisMonthQuery.size;

    // --- 3. Get Last Month's Count ---
    final lastMonthQuery = await citationsCollection
        // Querying based on Timestamp range
        .where(kCitationTimestampField, isGreaterThanOrEqualTo: lastMonthStart)
        .where(kCitationTimestampField,
            isLessThan: thisMonthStart) // End date is thisMonthStart
        .get();

    final int lastMonthCount = lastMonthQuery.size;

    // For debugging, print the counts!
    print(
        'This Month Count: $thisMonthCount. Last Month Count: $lastMonthCount.');

    // --- 4. Calculation ---

    if (lastMonthCount == 0) {
      // If there's an increase from 0, return null (undefined percent change)
      return thisMonthCount > 0 ? null : 0.0;
    }

    // Calculate the raw percentage difference
    final double rawPercentDifference =
        ((thisMonthCount - lastMonthCount) / lastMonthCount) * 100;

    // ✅ Apply rounding to 2 decimal places and parse back to double
    final double percentDifference =
        double.parse(rawPercentDifference.toStringAsFixed(2));

    return percentDifference;
  } catch (e) {
    // 🚨 On Error: Log the exception and return the sentinel value.
    print('🚨 FIRESTORE CRITICAL ERROR in getCitationPercentPerMonth: $e');
    return -999.0;
  }
}
