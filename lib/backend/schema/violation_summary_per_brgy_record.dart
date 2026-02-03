import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViolationSummaryPerBrgyRecord extends FirestoreRecord {
  ViolationSummaryPerBrgyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "actual_violations" field.
  int? _actualViolations;
  int get actualViolations => _actualViolations ?? 0;
  bool hasActualViolations() => _actualViolations != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "forecasted_violations" field.
  int? _forecastedViolations;
  int get forecastedViolations => _forecastedViolations ?? 0;
  bool hasForecastedViolations() => _forecastedViolations != null;

  // "model_used" field.
  String? _modelUsed;
  String get modelUsed => _modelUsed ?? '';
  bool hasModelUsed() => _modelUsed != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "month_num" field.
  int? _monthNum;
  int get monthNum => _monthNum ?? 0;
  bool hasMonthNum() => _monthNum != null;

  // "variance" field.
  int? _variance;
  int get variance => _variance ?? 0;
  bool hasVariance() => _variance != null;

  void _initializeFields() {
    _actualViolations = castToType<int>(snapshotData['actual_violations']);
    _barangay = snapshotData['barangay'] as String?;
    _city = snapshotData['city'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _month = snapshotData['month'] as String?;
    _year = snapshotData['year'] as String?;
    _forecastedViolations =
        castToType<int>(snapshotData['forecasted_violations']);
    _modelUsed = snapshotData['model_used'] as String?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _monthNum = castToType<int>(snapshotData['month_num']);
    _variance = castToType<int>(snapshotData['variance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('violation_summary_per_brgy');

  static Stream<ViolationSummaryPerBrgyRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ViolationSummaryPerBrgyRecord.fromSnapshot(s));

  static Future<ViolationSummaryPerBrgyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ViolationSummaryPerBrgyRecord.fromSnapshot(s));

  static ViolationSummaryPerBrgyRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ViolationSummaryPerBrgyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ViolationSummaryPerBrgyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ViolationSummaryPerBrgyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ViolationSummaryPerBrgyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ViolationSummaryPerBrgyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createViolationSummaryPerBrgyRecordData({
  int? actualViolations,
  String? barangay,
  String? city,
  DateTime? createdAt,
  String? month,
  String? year,
  int? forecastedViolations,
  String? modelUsed,
  DateTime? updatedAt,
  int? monthNum,
  int? variance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'actual_violations': actualViolations,
      'barangay': barangay,
      'city': city,
      'created_at': createdAt,
      'month': month,
      'year': year,
      'forecasted_violations': forecastedViolations,
      'model_used': modelUsed,
      'updated_at': updatedAt,
      'month_num': monthNum,
      'variance': variance,
    }.withoutNulls,
  );

  return firestoreData;
}

class ViolationSummaryPerBrgyRecordDocumentEquality
    implements Equality<ViolationSummaryPerBrgyRecord> {
  const ViolationSummaryPerBrgyRecordDocumentEquality();

  @override
  bool equals(
      ViolationSummaryPerBrgyRecord? e1, ViolationSummaryPerBrgyRecord? e2) {
    return e1?.actualViolations == e2?.actualViolations &&
        e1?.barangay == e2?.barangay &&
        e1?.city == e2?.city &&
        e1?.createdAt == e2?.createdAt &&
        e1?.month == e2?.month &&
        e1?.year == e2?.year &&
        e1?.forecastedViolations == e2?.forecastedViolations &&
        e1?.modelUsed == e2?.modelUsed &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.monthNum == e2?.monthNum &&
        e1?.variance == e2?.variance;
  }

  @override
  int hash(ViolationSummaryPerBrgyRecord? e) => const ListEquality().hash([
        e?.actualViolations,
        e?.barangay,
        e?.city,
        e?.createdAt,
        e?.month,
        e?.year,
        e?.forecastedViolations,
        e?.modelUsed,
        e?.updatedAt,
        e?.monthNum,
        e?.variance
      ]);

  @override
  bool isValidKey(Object? o) => o is ViolationSummaryPerBrgyRecord;
}
