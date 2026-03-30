import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PanaboViolationSummaryTestRecord extends FirestoreRecord {
  PanaboViolationSummaryTestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "total_actual_data" field.
  int? _totalActualData;
  int get totalActualData => _totalActualData ?? 0;
  bool hasTotalActualData() => _totalActualData != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "actual_values" field.
  List<int>? _actualValues;
  List<int> get actualValues => _actualValues ?? const [];
  bool hasActualValues() => _actualValues != null;

  // "forecasted_values" field.
  List<int>? _forecastedValues;
  List<int> get forecastedValues => _forecastedValues ?? const [];
  bool hasForecastedValues() => _forecastedValues != null;

  // "month" field.
  List<String>? _month;
  List<String> get month => _month ?? const [];
  bool hasMonth() => _month != null;

  // "month_num" field.
  List<int>? _monthNum;
  List<int> get monthNum => _monthNum ?? const [];
  bool hasMonthNum() => _monthNum != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _totalActualData = castToType<int>(snapshotData['total_actual_data']);
    _year = snapshotData['year'] as String?;
    _actualValues = getDataList(snapshotData['actual_values']);
    _forecastedValues = getDataList(snapshotData['forecasted_values']);
    _month = getDataList(snapshotData['month']);
    _monthNum = getDataList(snapshotData['month_num']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('panabo_violation_summary_test');

  static Stream<PanaboViolationSummaryTestRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => PanaboViolationSummaryTestRecord.fromSnapshot(s));

  static Future<PanaboViolationSummaryTestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PanaboViolationSummaryTestRecord.fromSnapshot(s));

  static PanaboViolationSummaryTestRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PanaboViolationSummaryTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PanaboViolationSummaryTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PanaboViolationSummaryTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PanaboViolationSummaryTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PanaboViolationSummaryTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPanaboViolationSummaryTestRecordData({
  String? city,
  DateTime? lastUpdated,
  int? totalActualData,
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'last_updated': lastUpdated,
      'total_actual_data': totalActualData,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class PanaboViolationSummaryTestRecordDocumentEquality
    implements Equality<PanaboViolationSummaryTestRecord> {
  const PanaboViolationSummaryTestRecordDocumentEquality();

  @override
  bool equals(PanaboViolationSummaryTestRecord? e1,
      PanaboViolationSummaryTestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.city == e2?.city &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.totalActualData == e2?.totalActualData &&
        e1?.year == e2?.year &&
        listEquality.equals(e1?.actualValues, e2?.actualValues) &&
        listEquality.equals(e1?.forecastedValues, e2?.forecastedValues) &&
        listEquality.equals(e1?.month, e2?.month) &&
        listEquality.equals(e1?.monthNum, e2?.monthNum);
  }

  @override
  int hash(PanaboViolationSummaryTestRecord? e) => const ListEquality().hash([
        e?.city,
        e?.lastUpdated,
        e?.totalActualData,
        e?.year,
        e?.actualValues,
        e?.forecastedValues,
        e?.month,
        e?.monthNum
      ]);

  @override
  bool isValidKey(Object? o) => o is PanaboViolationSummaryTestRecord;
}
