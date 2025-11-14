import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthlySummaryRecord extends FirestoreRecord {
  MonthlySummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "total_violations" field.
  int? _totalViolations;
  int get totalViolations => _totalViolations ?? 0;
  bool hasTotalViolations() => _totalViolations != null;

  // "violation_count" field.
  List<int>? _violationCount;
  List<int> get violationCount => _violationCount ?? const [];
  bool hasViolationCount() => _violationCount != null;

  // "violation_name" field.
  List<String>? _violationName;
  List<String> get violationName => _violationName ?? const [];
  bool hasViolationName() => _violationName != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _totalViolations = castToType<int>(snapshotData['total_violations']);
    _violationCount = getDataList(snapshotData['violation_count']);
    _violationName = getDataList(snapshotData['violation_name']);
    _month = snapshotData['month'] as String?;
    _year = snapshotData['year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('monthlySummary');

  static Stream<MonthlySummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MonthlySummaryRecord.fromSnapshot(s));

  static Future<MonthlySummaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MonthlySummaryRecord.fromSnapshot(s));

  static MonthlySummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MonthlySummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MonthlySummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MonthlySummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MonthlySummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MonthlySummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMonthlySummaryRecordData({
  String? uid,
  DateTime? lastUpdated,
  int? totalViolations,
  String? month,
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'last_updated': lastUpdated,
      'total_violations': totalViolations,
      'month': month,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class MonthlySummaryRecordDocumentEquality
    implements Equality<MonthlySummaryRecord> {
  const MonthlySummaryRecordDocumentEquality();

  @override
  bool equals(MonthlySummaryRecord? e1, MonthlySummaryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.totalViolations == e2?.totalViolations &&
        listEquality.equals(e1?.violationCount, e2?.violationCount) &&
        listEquality.equals(e1?.violationName, e2?.violationName) &&
        e1?.month == e2?.month &&
        e1?.year == e2?.year;
  }

  @override
  int hash(MonthlySummaryRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.lastUpdated,
        e?.totalViolations,
        e?.violationCount,
        e?.violationName,
        e?.month,
        e?.year
      ]);

  @override
  bool isValidKey(Object? o) => o is MonthlySummaryRecord;
}
