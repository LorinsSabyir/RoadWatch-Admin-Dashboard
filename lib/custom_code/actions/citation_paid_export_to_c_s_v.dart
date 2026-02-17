// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Web-compatible Firebase CSV Export for Citation Collection
import 'dart:convert';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';

String listOrString(dynamic value) {
  if (value == null) return '';
  if (value is List) return value.join(', ');
  if (value is String) return value;
  return value.toString();
}

/// Downloads citation data from Firebase Firestore into a CSV file (Web-compatible)
Future<void> citationPaidExportToCSV(BuildContext context) async {
  try {
    // Get data from Firebase Firestore
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('citation')
        .where('receipt_status', isEqualTo: true)
        .get();

    if (querySnapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('No citation data found'),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
      return;
    }

    // Prepare CSV data
    List<List<dynamic>> csvData = [];

    // Add headers
    csvData.add([
      'Citation ID',
      'Violator Name',
      'Violator Gender',
      'Violator Address Province',
      'Violator Address City',
      'Violator Address Barangay',
      'Violator Address Purok',
      'Confiscated Unit Type',
      'Confiscated Unit Brand',
      'Confiscated Unit Model',
      'Confiscated Unit Plate #',
      'Confiscated Unit Description',
      'Apprehension Place',
      'Apprehended Enforcer',
      'Apprehension Time',
      'Violation Name',
      'Violation Section',
      'Violation Fine',
      'Total Violation Fine',
      'receipt_status',
      'Edited Time',
    ]);

    // Add data rows
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      csvData.add([
        doc.id,
        data['violator_name'] ?? '',
        data['violator_gender'] ?? '', // fixed typo
        data['violator_address_province'] ?? '',
        data['violator_address_city'] ?? '',
        data['violator_address_brgy'] ?? '',
        data['violator_address_prk'] ?? '',
        data['conf_unit_type'] ?? '',
        data['conf_unit_brand'] ?? '',
        data['conf_unit_model'] ?? '',
        data['conf_unit_plate_num'] ?? '',
        data['conf_unit_desc'] ?? '',
        data['appre_place'] ?? '',
        data['appre_enforcer'] ?? '',
        data['created_time'] != null
            ? DateFormat('yyyy/MM/dd HH:mm')
                .format(data['created_time'].toDate())
            : '',
        listOrString(data['violation_name']),
        listOrString(data['violation_section']),
        listOrString(data['violation_fine']),

        data['violation_total_fine']?.toString() ?? '',
        data['receipt_status'] == true ? 'Paid' : 'Unpaid',
        data['edited_time'] != null
            ? DateFormat('yyyy/MM/dd HH:mm')
                .format(data['edited_time'].toDate())
            : '',
      ]);
    }

    // Convert to CSV string
    String csvString = const ListToCsvConverter().convert(csvData);

    // Create and download file (Web)
    final bytes = utf8.encode(csvString);
    final blob = html.Blob([bytes], 'text/csv');
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..setAttribute('download',
          'Paidcitation_export_${DateTime.now().millisecondsSinceEpoch}.csv')
      ..click();

    html.Url.revokeObjectUrl(url);

    // ✅ Success message (themed)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('✅ Citation data exported successfully!'),
        backgroundColor: FlutterFlowTheme.of(context).success,
      ),
    );
  } catch (e) {
    // ❌ Error message (themed)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ Failed to export citation data: $e'),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
  }
}
