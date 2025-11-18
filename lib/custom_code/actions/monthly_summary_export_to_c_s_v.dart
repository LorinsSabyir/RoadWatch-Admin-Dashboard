// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Web-only Firebase → CSV export
import 'dart:convert';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';

Future<void> monthlySummaryExportToCSV(BuildContext context) async {
  try {
    // 🔹 Fetch data from Firestore from the 'monthlySummary' collection
    final querySnapshot =
        await FirebaseFirestore.instance.collection('monthlySummary').get();

    if (querySnapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: FlutterFlowTheme.of(context).error,
          content: Text(
            'No monthly summary records found to export.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                ),
          ),
        ),
      );
      return;
    }

    // 🔹 Prepare CSV headers
    final List<List<dynamic>> csvData = [
      [
        'Month Document ID',
        'Month Name',
        'Year',
        'Month Number',
        'Total Violations',
        'Violation Details (Name: Count)',
      ]
    ];

    // 🔹 Fill rows from Firestore
    for (final doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;

      // Cast lists, defaulting to an empty list if null or not the correct type
      final List<dynamic> violationNames = (data['violation_name'] is List)
          ? List<dynamic>.from(data['violation_name'] as List)
          : [];
      final List<dynamic> violationCounts = (data['violation_count'] is List)
          ? List<dynamic>.from(data['violation_count'] as List)
          : [];

      // Combine names and counts into a single string for the CSV cell
      final int length = violationNames.length < violationCounts.length
          ? violationNames.length
          : violationCounts.length;

      final List<String> violationDetails = [];
      for (int i = 0; i < length; i++) {
        violationDetails
            .add('${violationNames[i] ?? 'N/A'}: ${violationCounts[i] ?? '0'}');
      }
      final String violationDetailString = violationDetails.join(' | ');

      csvData.add([
        doc.id,
        data['month'] ?? '',
        data['year'] ?? '',
        data['month_num'] ?? '',
        data['total_violations'] ?? '0',
        violationDetailString,
      ]);
    }

    // 🔹 Convert list → CSV string
    final csvString = const ListToCsvConverter().convert(csvData);

    // 🔹 Trigger browser download
    final bytes = utf8.encode(csvString);
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..style.display = 'none'
      ..download =
          'monthly_summary_export_${DateTime.now().millisecondsSinceEpoch}.csv';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);

    // 🔹 Success feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: FlutterFlowTheme.of(context).success,
        content: Text(
          '✅ Monthly Summary CSV file successfully exported!',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
              ),
        ),
      ),
    );
  } catch (e) {
    // 🔹 Error feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: FlutterFlowTheme.of(context).error,
        content: Text(
          '❌ Failed to export CSV: $e',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
