import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViolationSummaryRecord extends FirestoreRecord {
  ViolationSummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  // "actual_violations" field.
  int? _actualViolations;
  int get actualViolations => _actualViolations ?? 0;
  bool hasActualViolations() => _actualViolations != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "forecasted_violations" field.
  int? _forecastedViolations;
  int get forecastedViolations => _forecastedViolations ?? 0;
  bool hasForecastedViolations() => _forecastedViolations != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "model_used" field.
  String? _modelUsed;
  String get modelUsed => _modelUsed ?? '';
  bool hasModelUsed() => _modelUsed != null;

  // "month_num" field.
  int? _monthNum;
  int get monthNum => _monthNum ?? 0;
  bool hasMonthNum() => _monthNum != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "variance" field.
  int? _variance;
  int get variance => _variance ?? 0;
  bool hasVariance() => _variance != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _month = snapshotData['month'] as String?;
    _actualViolations = castToType<int>(snapshotData['actual_violations']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _forecastedViolations =
        castToType<int>(snapshotData['forecasted_violations']);
    _year = snapshotData['year'] as String?;
    _modelUsed = snapshotData['model_used'] as String?;
    _monthNum = castToType<int>(snapshotData['month_num']);
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _variance = castToType<int>(snapshotData['variance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('violation_summary');

  static Stream<ViolationSummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ViolationSummaryRecord.fromSnapshot(s));

  static Future<ViolationSummaryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ViolationSummaryRecord.fromSnapshot(s));

  static ViolationSummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ViolationSummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ViolationSummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ViolationSummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ViolationSummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ViolationSummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createViolationSummaryRecordData({
  String? city,
  String? month,
  int? actualViolations,
  DateTime? createdAt,
  int? forecastedViolations,
  String? year,
  String? modelUsed,
  int? monthNum,
  DateTime? updatedAt,
  int? variance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'month': month,
      'actual_violations': actualViolations,
      'created_at': createdAt,
      'forecasted_violations': forecastedViolations,
      'year': year,
      'model_used': modelUsed,
      'month_num': monthNum,
      'updated_at': updatedAt,
      'variance': variance,
    }.withoutNulls,
  );

  return firestoreData;
}

class ViolationSummaryRecordDocumentEquality
    implements Equality<ViolationSummaryRecord> {
  const ViolationSummaryRecordDocumentEquality();

  @override
  bool equals(ViolationSummaryRecord? e1, ViolationSummaryRecord? e2) {
    return e1?.city == e2?.city &&
        e1?.month == e2?.month &&
        e1?.actualViolations == e2?.actualViolations &&
        e1?.createdAt == e2?.createdAt &&
        e1?.forecastedViolations == e2?.forecastedViolations &&
        e1?.year == e2?.year &&
        e1?.modelUsed == e2?.modelUsed &&
        e1?.monthNum == e2?.monthNum &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.variance == e2?.variance;
  }

  @override
  int hash(ViolationSummaryRecord? e) => const ListEquality().hash([
        e?.city,
        e?.month,
        e?.actualViolations,
        e?.createdAt,
        e?.forecastedViolations,
        e?.year,
        e?.modelUsed,
        e?.monthNum,
        e?.updatedAt,
        e?.variance
      ]);

  @override
  bool isValidKey(Object? o) => o is ViolationSummaryRecord;
}
