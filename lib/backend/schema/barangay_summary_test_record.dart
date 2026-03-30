import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarangaySummaryTestRecord extends FirestoreRecord {
  BarangaySummaryTestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "actual_values" field.
  List<int>? _actualValues;
  List<int> get actualValues => _actualValues ?? const [];
  bool hasActualValues() => _actualValues != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "month_num" field.
  List<int>? _monthNum;
  List<int> get monthNum => _monthNum ?? const [];
  bool hasMonthNum() => _monthNum != null;

  // "month" field.
  List<String>? _month;
  List<String> get month => _month ?? const [];
  bool hasMonth() => _month != null;

  // "total_actual_data" field.
  int? _totalActualData;
  int get totalActualData => _totalActualData ?? 0;
  bool hasTotalActualData() => _totalActualData != null;

  // "forecasted_values" field.
  List<int>? _forecastedValues;
  List<int> get forecastedValues => _forecastedValues ?? const [];
  bool hasForecastedValues() => _forecastedValues != null;

  void _initializeFields() {
    _actualValues = getDataList(snapshotData['actual_values']);
    _barangay = snapshotData['barangay'] as String?;
    _city = snapshotData['city'] as String?;
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _year = snapshotData['year'] as String?;
    _monthNum = getDataList(snapshotData['month_num']);
    _month = getDataList(snapshotData['month']);
    _totalActualData = castToType<int>(snapshotData['total_actual_data']);
    _forecastedValues = getDataList(snapshotData['forecasted_values']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('barangay_summary_test');

  static Stream<BarangaySummaryTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BarangaySummaryTestRecord.fromSnapshot(s));

  static Future<BarangaySummaryTestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BarangaySummaryTestRecord.fromSnapshot(s));

  static BarangaySummaryTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BarangaySummaryTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BarangaySummaryTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BarangaySummaryTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BarangaySummaryTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BarangaySummaryTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBarangaySummaryTestRecordData({
  String? barangay,
  String? city,
  DateTime? lastUpdated,
  String? year,
  int? totalActualData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barangay': barangay,
      'city': city,
      'last_updated': lastUpdated,
      'year': year,
      'total_actual_data': totalActualData,
    }.withoutNulls,
  );

  return firestoreData;
}

class BarangaySummaryTestRecordDocumentEquality
    implements Equality<BarangaySummaryTestRecord> {
  const BarangaySummaryTestRecordDocumentEquality();

  @override
  bool equals(BarangaySummaryTestRecord? e1, BarangaySummaryTestRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.actualValues, e2?.actualValues) &&
        e1?.barangay == e2?.barangay &&
        e1?.city == e2?.city &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.year == e2?.year &&
        listEquality.equals(e1?.monthNum, e2?.monthNum) &&
        listEquality.equals(e1?.month, e2?.month) &&
        e1?.totalActualData == e2?.totalActualData &&
        listEquality.equals(e1?.forecastedValues, e2?.forecastedValues);
  }

  @override
  int hash(BarangaySummaryTestRecord? e) => const ListEquality().hash([
        e?.actualValues,
        e?.barangay,
        e?.city,
        e?.lastUpdated,
        e?.year,
        e?.monthNum,
        e?.month,
        e?.totalActualData,
        e?.forecastedValues
      ]);

  @override
  bool isValidKey(Object? o) => o is BarangaySummaryTestRecord;
}
