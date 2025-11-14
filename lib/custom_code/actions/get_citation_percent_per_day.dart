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

/// Calculates the percentage difference in citations between today and
/// yesterday.
Future<double?> getCitationPercentPerDay() async {
  // --- 1. Define Date Ranges ---
  final now = DateTime.now();

  // Define Today's Start and End (start of day to start of next day)
  final todayStart = DateTime(now.year, now.month, now.day);
  final tomorrowStart = todayStart.add(const Duration(days: 1));

  // Define Yesterday's Start and End
  final yesterdayStart = todayStart.subtract(const Duration(days: 1));
  final todayStartForYesterday = todayStart; // Same as todayStart

  // Reference to your Firestore collection
  // **NOTE: Ensure 'citation' is the correct collection name**
  final citationsCollection = FirebaseFirestore.instance.collection('citation');

  // --- 2. Get Today's Count ---
  // Assuming the citation document has a Firestore Timestamp field named 'appre_date'
  final todayQuery = await citationsCollection
      .where('appre_date_day', isGreaterThanOrEqualTo: todayStart)
      .where('appre_date_day', isLessThan: tomorrowStart)
      .get();

  final int todayCount = todayQuery.size;

  // --- 3. Get Yesterday's Count ---
  final yesterdayQuery = await citationsCollection
      .where('appre_date_day', isGreaterThanOrEqualTo: yesterdayStart)
      .where('appre_date_day', isLessThan: todayStartForYesterday)
      .get();

  final int yesterdayCount = yesterdayQuery.size;

  // --- 4. Calculation ---

  // Check if yesterday's count is zero to avoid division by zero
  if (yesterdayCount == 0) {
    if (todayCount > 0) {
      // Growth from zero is mathematically undefined. Return null for N/A.
      return null;
    } else {
      // Both are 0, difference is 0%.
      return 0.0;
    }
  }

  // Calculate the difference and percentage difference
  final double difference = (todayCount - yesterdayCount).toDouble();

  // Formula: ((Today - Yesterday) / Yesterday) * 100
  final double percentDifference = (difference / yesterdayCount) * 100;

  // Return the percentage difference (e.g., 25.0 for 25% increase)
  return percentDifference;
}
