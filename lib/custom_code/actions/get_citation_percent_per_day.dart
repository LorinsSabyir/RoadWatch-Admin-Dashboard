// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

/// Calculates the percentage difference in citations between today and
/// yesterday using the 'created_time' Timestamp field.
///
/// Returns: - The calculated percentage (rounded to 2 decimals) on success. -
/// null if Yesterday's count is 0 and Today's is > 0 (N/A). - 0.0 if both
/// counts are 0. - -999.0 if a Firestore query or other exception occurs
/// (error sentinel).
Future<double?> getCitationPercentPerDay() async {
  // ✅ CONFIRMED FIELD NAME
  const String kCitationTimestampField = 'created_time';

  try {
    // --- 1. Define Date Ranges (Using LOCAL Time) ---
    // Use local time for date range definition to match how data is usually entered locally.
    final now = DateTime.now();

    // Define Today's Start (00:00:00 Local Time)
    final todayStart = DateTime(now.year, now.month, now.day);
    final tomorrowStart = todayStart.add(const Duration(days: 1));

    // Define Yesterday's Start
    final yesterdayStart = todayStart.subtract(const Duration(days: 1));

    // Reference to your Firestore collection
    final citationsCollection =
        FirebaseFirestore.instance.collection('citation');

    // --- 2. Get Today's Count ---
    final todayQuery = await citationsCollection
        // Querying the full 'created_time' Timestamp field
        .where(kCitationTimestampField, isGreaterThanOrEqualTo: todayStart)
        .where(kCitationTimestampField, isLessThan: tomorrowStart)
        .get();

    final int todayCount = todayQuery.size;

    // --- 3. Get Yesterday's Count ---
    final yesterdayQuery = await citationsCollection
        // Querying the full 'created_time' Timestamp field
        .where(kCitationTimestampField, isGreaterThanOrEqualTo: yesterdayStart)
        .where(kCitationTimestampField, isLessThan: todayStart)
        .get();

    final int yesterdayCount = yesterdayQuery.size;

    // --- 4. Calculation ---

    // For debugging, print the counts!
    print('Today Count: $todayCount. Yesterday Count: $yesterdayCount.');

    if (yesterdayCount == 0) {
      if (todayCount > 0) {
        return null; // N/A
      } else {
        return 0.0; // Both 0
      }
    }

    // Calculate the percentage difference
    final double rawPercentDifference =
        ((todayCount - yesterdayCount) / yesterdayCount) * 100;

    // ✅ Apply rounding to 2 decimal places and parse back to double
    final double percentDifference =
        double.parse(rawPercentDifference.toStringAsFixed(2));

    // Success: Return the calculated percentage
    return percentDifference;
  } catch (e) {
    // 🚨 On Error: Log the exception and return the sentinel value.
    print('🚨 FIRESTORE CRITICAL ERROR in getCitationPercentPerDay: $e');
    return -999.0;
  }
}
