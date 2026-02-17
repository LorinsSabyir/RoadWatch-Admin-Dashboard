import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViolationSummaryPerViolationRecord extends FirestoreRecord {
  ViolationSummaryPerViolationRecord._(
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

  // "month_num" field.
  int? _monthNum;
  int get monthNum => _monthNum ?? 0;
  bool hasMonthNum() => _monthNum != null;

  // "total_violation_types" field.
  int? _totalViolationTypes;
  int get totalViolationTypes => _totalViolationTypes ?? 0;
  bool hasTotalViolationTypes() => _totalViolationTypes != null;

  // "total_violations" field.
  int? _totalViolations;
  int get totalViolations => _totalViolations ?? 0;
  bool hasTotalViolations() => _totalViolations != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "variance" field.
  int? _variance;
  int get variance => _variance ?? 0;
  bool hasVariance() => _variance != null;

  // "violation_name" field.
  String? _violationName;
  String get violationName => _violationName ?? '';
  bool hasViolationName() => _violationName != null;

  // "violation_section" field.
  String? _violationSection;
  String get violationSection => _violationSection ?? '';
  bool hasViolationSection() => _violationSection != null;

  // "city_wide_variance" field.
  int? _cityWideVariance;
  int get cityWideVariance => _cityWideVariance ?? 0;
  bool hasCityWideVariance() => _cityWideVariance != null;

  // "city_wide_forecast" field.
  int? _cityWideForecast;
  int get cityWideForecast => _cityWideForecast ?? 0;
  bool hasCityWideForecast() => _cityWideForecast != null;

  // "total_occurrences" field.
  int? _totalOccurrences;
  int get totalOccurrences => _totalOccurrences ?? 0;
  bool hasTotalOccurrences() => _totalOccurrences != null;

  // "total_forecasted_occurrences" field.
  int? _totalForecastedOccurrences;
  int get totalForecastedOccurrences => _totalForecastedOccurrences ?? 0;
  bool hasTotalForecastedOccurrences() => _totalForecastedOccurrences != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _month = snapshotData['month'] as String?;
    _monthNum = castToType<int>(snapshotData['month_num']);
    _totalViolationTypes =
        castToType<int>(snapshotData['total_violation_types']);
    _totalViolations = castToType<int>(snapshotData['total_violations']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _year = snapshotData['year'] as String?;
    _variance = castToType<int>(snapshotData['variance']);
    _violationName = snapshotData['violation_name'] as String?;
    _violationSection = snapshotData['violation_section'] as String?;
    _cityWideVariance = castToType<int>(snapshotData['city_wide_variance']);
    _cityWideForecast = castToType<int>(snapshotData['city_wide_forecast']);
    _totalOccurrences = castToType<int>(snapshotData['total_occurrences']);
    _totalForecastedOccurrences =
        castToType<int>(snapshotData['total_forecasted_occurrences']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('violation_summary_per_violation');

  static Stream<ViolationSummaryPerViolationRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ViolationSummaryPerViolationRecord.fromSnapshot(s));

  static Future<ViolationSummaryPerViolationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ViolationSummaryPerViolationRecord.fromSnapshot(s));

  static ViolationSummaryPerViolationRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ViolationSummaryPerViolationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ViolationSummaryPerViolationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ViolationSummaryPerViolationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ViolationSummaryPerViolationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ViolationSummaryPerViolationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createViolationSummaryPerViolationRecordData({
  String? city,
  String? month,
  int? monthNum,
  int? totalViolationTypes,
  int? totalViolations,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? year,
  int? variance,
  String? violationName,
  String? violationSection,
  int? cityWideVariance,
  int? cityWideForecast,
  int? totalOccurrences,
  int? totalForecastedOccurrences,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'month': month,
      'month_num': monthNum,
      'total_violation_types': totalViolationTypes,
      'total_violations': totalViolations,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'year': year,
      'variance': variance,
      'violation_name': violationName,
      'violation_section': violationSection,
      'city_wide_variance': cityWideVariance,
      'city_wide_forecast': cityWideForecast,
      'total_occurrences': totalOccurrences,
      'total_forecasted_occurrences': totalForecastedOccurrences,
    }.withoutNulls,
  );

  return firestoreData;
}

class ViolationSummaryPerViolationRecordDocumentEquality
    implements Equality<ViolationSummaryPerViolationRecord> {
  const ViolationSummaryPerViolationRecordDocumentEquality();

  @override
  bool equals(ViolationSummaryPerViolationRecord? e1,
      ViolationSummaryPerViolationRecord? e2) {
    return e1?.city == e2?.city &&
        e1?.month == e2?.month &&
        e1?.monthNum == e2?.monthNum &&
        e1?.totalViolationTypes == e2?.totalViolationTypes &&
        e1?.totalViolations == e2?.totalViolations &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.year == e2?.year &&
        e1?.variance == e2?.variance &&
        e1?.violationName == e2?.violationName &&
        e1?.violationSection == e2?.violationSection &&
        e1?.cityWideVariance == e2?.cityWideVariance &&
        e1?.cityWideForecast == e2?.cityWideForecast &&
        e1?.totalOccurrences == e2?.totalOccurrences &&
        e1?.totalForecastedOccurrences == e2?.totalForecastedOccurrences;
  }

  @override
  int hash(ViolationSummaryPerViolationRecord? e) => const ListEquality().hash([
        e?.city,
        e?.month,
        e?.monthNum,
        e?.totalViolationTypes,
        e?.totalViolations,
        e?.createdAt,
        e?.updatedAt,
        e?.year,
        e?.variance,
        e?.violationName,
        e?.violationSection,
        e?.cityWideVariance,
        e?.cityWideForecast,
        e?.totalOccurrences,
        e?.totalForecastedOccurrences
      ]);

  @override
  bool isValidKey(Object? o) => o is ViolationSummaryPerViolationRecord;
}
