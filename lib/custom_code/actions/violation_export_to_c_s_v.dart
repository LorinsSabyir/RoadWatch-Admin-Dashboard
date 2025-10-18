// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// i want you to create a custom action that gets the data from firebase and downloads it in a csv file
import 'dart:convert';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';

/// it downloads the data from firebase into a csv file.
Future violationExportToCSV() async {
  try {
    // Get data from Firebase Firestore
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('violation').get();

    if (querySnapshot.docs.isEmpty) {
      print('No violation data found');
      return;
    }

    // Prepare CSV data
    List<List<dynamic>> csvData = [];

    // Add headers
    csvData.add([
      'Violation ID',
      'Violation Name',
      'Violation Title',
      'Section',
      'Penalty',
      'Fines',
      'edited_time',
      'created_time'
    ]);

    // Add data rows
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      csvData.add([
        doc.id ?? '',
        data['violation_name'] ?? '',
        data['violation_title'] ?? '',
        data['section'] ?? '',
        data['penalty'] ?? '',
        data['fines']?.toString() ?? '',
        DateFormat('yyyy/MM/dd HH:mm').format(data['edited_time'].toDate()),
        DateFormat('yyyy/MM/dd HH:mm').format(data['created_time'].toDate())
      ]);
    }

    // Convert to CSV string
    String csvString = const ListToCsvConverter().convert(csvData);

    // Create and download file
    final bytes = utf8.encode(csvString);
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download =
          'violations_export_${DateTime.now().millisecondsSinceEpoch}.csv';

    html.document.body?.children.add(anchor);
    anchor.click();

    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);

    print('CSV export completed successfully');
  } catch (e) {
    print('Error exporting violations to CSV: $e');
    throw Exception('Failed to export violations: $e');
  }
}
