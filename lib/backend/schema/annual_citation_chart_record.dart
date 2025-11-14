import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnnualCitationChartRecord extends FirestoreRecord {
  AnnualCitationChartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "month_name" field.
  String? _monthName;
  String get monthName => _monthName ?? '';
  bool hasMonthName() => _monthName != null;

  // "citation_num" field.
  int? _citationNum;
  int get citationNum => _citationNum ?? 0;
  bool hasCitationNum() => _citationNum != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  bool hasTotal() => _total != null;

  // "month_num" field.
  int? _monthNum;
  int get monthNum => _monthNum ?? 0;
  bool hasMonthNum() => _monthNum != null;

  void _initializeFields() {
    _year = snapshotData['year'] as String?;
    _monthName = snapshotData['month_name'] as String?;
    _citationNum = castToType<int>(snapshotData['citation_num']);
    _total = castToType<int>(snapshotData['total']);
    _monthNum = castToType<int>(snapshotData['month_num']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('annualCitationChart');

  static Stream<AnnualCitationChartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnnualCitationChartRecord.fromSnapshot(s));

  static Future<AnnualCitationChartRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AnnualCitationChartRecord.fromSnapshot(s));

  static AnnualCitationChartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnualCitationChartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnualCitationChartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnualCitationChartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnualCitationChartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnnualCitationChartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnnualCitationChartRecordData({
  String? year,
  String? monthName,
  int? citationNum,
  int? total,
  int? monthNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'year': year,
      'month_name': monthName,
      'citation_num': citationNum,
      'total': total,
      'month_num': monthNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnnualCitationChartRecordDocumentEquality
    implements Equality<AnnualCitationChartRecord> {
  const AnnualCitationChartRecordDocumentEquality();

  @override
  bool equals(AnnualCitationChartRecord? e1, AnnualCitationChartRecord? e2) {
    return e1?.year == e2?.year &&
        e1?.monthName == e2?.monthName &&
        e1?.citationNum == e2?.citationNum &&
        e1?.total == e2?.total &&
        e1?.monthNum == e2?.monthNum;
  }

  @override
  int hash(AnnualCitationChartRecord? e) => const ListEquality()
      .hash([e?.year, e?.monthName, e?.citationNum, e?.total, e?.monthNum]);

  @override
  bool isValidKey(Object? o) => o is AnnualCitationChartRecord;
}
