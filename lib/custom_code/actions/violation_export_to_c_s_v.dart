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

Future<void> violationExportToCSV(BuildContext context) async {
  try {
    // 🔹 Fetch data from Firestore
    final querySnapshot =
        await FirebaseFirestore.instance.collection('violation').get();

    if (querySnapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: FlutterFlowTheme.of(context).error,
          content: Text(
            '⚠️ No violation data found.',
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
        'Violation ID',
        'Violation Name',
        'Violation Title',
        'Section',
        'Penalty',
        'Fines',
        'Edited Time',
        'Created Time',
      ]
    ];

    // 🔹 Fill rows with Firestore data
    for (final doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;

      final edited = data['edited_time'] is Timestamp
          ? DateFormat('yyyy/MM/dd HH:mm')
              .format((data['edited_time'] as Timestamp).toDate())
          : '';
      final created = data['created_time'] is Timestamp
          ? DateFormat('yyyy/MM/dd HH:mm')
              .format((data['created_time'] as Timestamp).toDate())
          : '';

      csvData.add([
        doc.id,
        data['violation_name'] ?? '',
        data['violation_title'] ?? '',
        data['section'] ?? '',
        data['penalty'] ?? '',
        data['fines']?.toString() ?? '',
        edited,
        created,
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
          'violations_export_${DateTime.now().millisecondsSinceEpoch}.csv';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);

    // 🔹 Success feedback (theme color)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: FlutterFlowTheme.of(context).success,
        content: Text(
          '✅ Violation CSV file downloaded successfully!',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
              ),
        ),
      ),
    );
  } catch (e) {
    // 🔹 Error feedback (theme color)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: FlutterFlowTheme.of(context).error,
        content: Text(
          '❌ Failed to export violations: $e',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
