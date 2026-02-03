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

Future<void> apprePlaceExportToCSV(BuildContext context) async {
  try {
    // 🔹 Fetch data from Firestore
    final querySnapshot =
        await FirebaseFirestore.instance.collection('apprePlaces').get();

    if (querySnapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: FlutterFlowTheme.of(context).error,
          content: Text(
            'No records found to export.',
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
        'Apprehension Place ID',
        'Landmark',
        'Barangay',
        'Purok',
        'Street',
        'Edited Time',
        'Created Time',
      ]
    ];

    // 🔹 Fill rows from Firestore
    for (final doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;

      // Defensive checks in case fields or timestamps are missing
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
        data['landmark'] ?? '',
        data['barangay'] ?? '',
        data['purok'] ?? '',
        data['street'] ?? '',
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
          'appre_placce_export_${DateTime.now().millisecondsSinceEpoch}.csv';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);

    // 🔹 Success feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: FlutterFlowTheme.of(context).success,
        content: Text(
          '✅ CSV file successfully exported!',
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
