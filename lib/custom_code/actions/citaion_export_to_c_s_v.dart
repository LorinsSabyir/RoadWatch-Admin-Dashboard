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

/// it downloads the citation data from firebase into a csv file.
Future citaionExportToCSV() async {
  try {
    // Get data from Firebase Firestore
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('citation').get();

    if (querySnapshot.docs.isEmpty) {
      print('No citation data found');
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
      'Apprehesion Place',
      'Apprehended Enforcer',
      'Apprehension Time',
      'Violation Name',
      'Violation Section',
      'Violation Fine',
      'Total Violation Fine',
      'Edited Time',
    ]);

    // Add data rows
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      csvData.add([
        doc.id ?? '',
        data['violator_name'] ?? '',
        data['volator_gender'] ?? '',
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
        DateFormat('yyyy/MM/dd HH:mm').format(data['created_time'].toDate()),
        (data['violation_name'] as List<dynamic>?)?.join(', ') ?? '',
        (data['violation_section'] as List<dynamic>?)?.join(', ') ?? '',
        (data['violation_fine'] as List<dynamic>?)?.join(', ') ?? '',
        data['violation_total_fine']?.toString() ?? '',
        data['edited_time']?.toDate()?.toString() ?? ''
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
          'citation_export_${DateTime.now().millisecondsSinceEpoch}.csv';

    html.document.body?.children.add(anchor);
    anchor.click();

    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);

    print('CSV export completed successfully');
  } catch (e) {
    print('Error exporting data to CSV: $e');
    throw Exception('Failed to export data: $e');
  }
}
