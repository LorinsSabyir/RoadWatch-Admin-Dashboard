import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Dummy data not final
class AnnualViolationsRecord extends FirestoreRecord {
  AnnualViolationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  bool hasMonth() => _month != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "month_name" field.
  String? _monthName;
  String get monthName => _monthName ?? '';
  bool hasMonthName() => _monthName != null;

  // "violation_name" field.
  String? _violationName;
  String get violationName => _violationName ?? '';
  bool hasViolationName() => _violationName != null;

  // "appre_place" field.
  String? _apprePlace;
  String get apprePlace => _apprePlace ?? '';
  bool hasApprePlace() => _apprePlace != null;

  void _initializeFields() {
    _month = castToType<int>(snapshotData['month']);
    _amount = castToType<int>(snapshotData['amount']);
    _monthName = snapshotData['month_name'] as String?;
    _violationName = snapshotData['violation_name'] as String?;
    _apprePlace = snapshotData['appre_place'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('annualViolations');

  static Stream<AnnualViolationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnnualViolationsRecord.fromSnapshot(s));

  static Future<AnnualViolationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AnnualViolationsRecord.fromSnapshot(s));

  static AnnualViolationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnualViolationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnualViolationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnualViolationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnualViolationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnnualViolationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnnualViolationsRecordData({
  int? month,
  int? amount,
  String? monthName,
  String? violationName,
  String? apprePlace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'month': month,
      'amount': amount,
      'month_name': monthName,
      'violation_name': violationName,
      'appre_place': apprePlace,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnnualViolationsRecordDocumentEquality
    implements Equality<AnnualViolationsRecord> {
  const AnnualViolationsRecordDocumentEquality();

  @override
  bool equals(AnnualViolationsRecord? e1, AnnualViolationsRecord? e2) {
    return e1?.month == e2?.month &&
        e1?.amount == e2?.amount &&
        e1?.monthName == e2?.monthName &&
        e1?.violationName == e2?.violationName &&
        e1?.apprePlace == e2?.apprePlace;
  }

  @override
  int hash(AnnualViolationsRecord? e) => const ListEquality().hash(
      [e?.month, e?.amount, e?.monthName, e?.violationName, e?.apprePlace]);

  @override
  bool isValidKey(Object? o) => o is AnnualViolationsRecord;
}
