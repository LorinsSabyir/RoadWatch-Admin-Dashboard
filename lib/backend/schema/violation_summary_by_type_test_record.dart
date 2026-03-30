import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViolationSummaryByTypeTestRecord extends FirestoreRecord {
  ViolationSummaryByTypeTestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "violation_name" field.
  String? _violationName;
  String get violationName => _violationName ?? '';
  bool hasViolationName() => _violationName != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "actual_values" field.
  List<int>? _actualValues;
  List<int> get actualValues => _actualValues ?? const [];
  bool hasActualValues() => _actualValues != null;

  // "month" field.
  List<String>? _month;
  List<String> get month => _month ?? const [];
  bool hasMonth() => _month != null;

  // "month_num" field.
  List<int>? _monthNum;
  List<int> get monthNum => _monthNum ?? const [];
  bool hasMonthNum() => _monthNum != null;

  // "total_actual_data" field.
  int? _totalActualData;
  int get totalActualData => _totalActualData ?? 0;
  bool hasTotalActualData() => _totalActualData != null;

  // "forecasted_values" field.
  List<int>? _forecastedValues;
  List<int> get forecastedValues => _forecastedValues ?? const [];
  bool hasForecastedValues() => _forecastedValues != null;

  void _initializeFields() {
    _violationName = snapshotData['violation_name'] as String?;
    _year = snapshotData['year'] as String?;
    _city = snapshotData['city'] as String?;
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _actualValues = getDataList(snapshotData['actual_values']);
    _month = getDataList(snapshotData['month']);
    _monthNum = getDataList(snapshotData['month_num']);
    _totalActualData = castToType<int>(snapshotData['total_actual_data']);
    _forecastedValues = getDataList(snapshotData['forecasted_values']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('violation_summary_by_type_test');

  static Stream<ViolationSummaryByTypeTestRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ViolationSummaryByTypeTestRecord.fromSnapshot(s));

  static Future<ViolationSummaryByTypeTestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ViolationSummaryByTypeTestRecord.fromSnapshot(s));

  static ViolationSummaryByTypeTestRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ViolationSummaryByTypeTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ViolationSummaryByTypeTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ViolationSummaryByTypeTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ViolationSummaryByTypeTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ViolationSummaryByTypeTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createViolationSummaryByTypeTestRecordData({
  String? violationName,
  String? year,
  String? city,
  DateTime? lastUpdated,
  int? totalActualData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'violation_name': violationName,
      'year': year,
      'city': city,
      'last_updated': lastUpdated,
      'total_actual_data': totalActualData,
    }.withoutNulls,
  );

  return firestoreData;
}

class ViolationSummaryByTypeTestRecordDocumentEquality
    implements Equality<ViolationSummaryByTypeTestRecord> {
  const ViolationSummaryByTypeTestRecordDocumentEquality();

  @override
  bool equals(ViolationSummaryByTypeTestRecord? e1,
      ViolationSummaryByTypeTestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.violationName == e2?.violationName &&
        e1?.year == e2?.year &&
        e1?.city == e2?.city &&
        e1?.lastUpdated == e2?.lastUpdated &&
        listEquality.equals(e1?.actualValues, e2?.actualValues) &&
        listEquality.equals(e1?.month, e2?.month) &&
        listEquality.equals(e1?.monthNum, e2?.monthNum) &&
        e1?.totalActualData == e2?.totalActualData &&
        listEquality.equals(e1?.forecastedValues, e2?.forecastedValues);
  }

  @override
  int hash(ViolationSummaryByTypeTestRecord? e) => const ListEquality().hash([
        e?.violationName,
        e?.year,
        e?.city,
        e?.lastUpdated,
        e?.actualValues,
        e?.month,
        e?.monthNum,
        e?.totalActualData,
        e?.forecastedValues
      ]);

  @override
  bool isValidKey(Object? o) => o is ViolationSummaryByTypeTestRecord;
}
