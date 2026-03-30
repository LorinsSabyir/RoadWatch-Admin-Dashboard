// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Web-only Firebase → CSV export
import 'dart:convert';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';

Future<void> violationSummaryExportToCSV(BuildContext context) async {
  try {
    // 🔹 Fetch data from Firestore from the 'violation_summary' collection
    final querySnapshot =
        await FirebaseFirestore.instance.collection('violation_summary').get();

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
        'Total Violations',
      ]
    ];

    // Fetch data from firebase
    for (var doc in querySnapshot.docs) {
      final data = doc.data(); // Get the document data map

      csvData.add([
        doc.id, // Document ID
        data['month'] ?? 'NOT FOUND',
        data['year'] ?? 'NOT FOUND',
        data['actual_violations'] ?? 0,
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
          'violation_summary_export_${DateTime.now().millisecondsSinceEpoch}.csv';

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
