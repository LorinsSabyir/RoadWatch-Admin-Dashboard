import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalyticsRecord extends FirestoreRecord {
  AnalyticsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "forecast_value" field.
  int? _forecastValue;
  int get forecastValue => _forecastValue ?? 0;
  bool hasForecastValue() => _forecastValue != null;

  // "model_accuracy" field.
  double? _modelAccuracy;
  double get modelAccuracy => _modelAccuracy ?? 0.0;
  bool hasModelAccuracy() => _modelAccuracy != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _forecastValue = castToType<int>(snapshotData['forecast_value']);
    _modelAccuracy = castToType<double>(snapshotData['model_accuracy']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('analytics');

  static Stream<AnalyticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalyticsRecord.fromSnapshot(s));

  static Future<AnalyticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalyticsRecord.fromSnapshot(s));

  static AnalyticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalyticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalyticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnalyticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalyticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnalyticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnalyticsRecordData({
  int? forecastValue,
  double? modelAccuracy,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'forecast_value': forecastValue,
      'model_accuracy': modelAccuracy,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnalyticsRecordDocumentEquality implements Equality<AnalyticsRecord> {
  const AnalyticsRecordDocumentEquality();

  @override
  bool equals(AnalyticsRecord? e1, AnalyticsRecord? e2) {
    return e1?.forecastValue == e2?.forecastValue &&
        e1?.modelAccuracy == e2?.modelAccuracy &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(AnalyticsRecord? e) => const ListEquality()
      .hash([e?.forecastValue, e?.modelAccuracy, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is AnalyticsRecord;
}
