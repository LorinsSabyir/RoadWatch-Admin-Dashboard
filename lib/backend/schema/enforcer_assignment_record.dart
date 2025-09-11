import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnforcerAssignmentRecord extends FirestoreRecord {
  EnforcerAssignmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "shiftEnd" field.
  DateTime? _shiftEnd;
  DateTime? get shiftEnd => _shiftEnd;
  bool hasShiftEnd() => _shiftEnd != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "enforcer_name" field.
  DocumentReference? _enforcerName;
  DocumentReference? get enforcerName => _enforcerName;
  bool hasEnforcerName() => _enforcerName != null;

  // "shift_start" field.
  DateTime? _shiftStart;
  DateTime? get shiftStart => _shiftStart;
  bool hasShiftStart() => _shiftStart != null;

  // "appre_place" field.
  DocumentReference? _apprePlace;
  DocumentReference? get apprePlace => _apprePlace;
  bool hasApprePlace() => _apprePlace != null;

  void _initializeFields() {
    _shiftEnd = snapshotData['shiftEnd'] as DateTime?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _note = snapshotData['note'] as String?;
    _enforcerName = snapshotData['enforcer_name'] as DocumentReference?;
    _shiftStart = snapshotData['shift_start'] as DateTime?;
    _apprePlace = snapshotData['appre_place'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('enforcerAssignment');

  static Stream<EnforcerAssignmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnforcerAssignmentRecord.fromSnapshot(s));

  static Future<EnforcerAssignmentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EnforcerAssignmentRecord.fromSnapshot(s));

  static EnforcerAssignmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnforcerAssignmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnforcerAssignmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnforcerAssignmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnforcerAssignmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnforcerAssignmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnforcerAssignmentRecordData({
  DateTime? shiftEnd,
  DateTime? createdTime,
  DateTime? editedTime,
  String? status,
  String? note,
  DocumentReference? enforcerName,
  DateTime? shiftStart,
  DocumentReference? apprePlace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'shiftEnd': shiftEnd,
      'created_time': createdTime,
      'edited_time': editedTime,
      'status': status,
      'note': note,
      'enforcer_name': enforcerName,
      'shift_start': shiftStart,
      'appre_place': apprePlace,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnforcerAssignmentRecordDocumentEquality
    implements Equality<EnforcerAssignmentRecord> {
  const EnforcerAssignmentRecordDocumentEquality();

  @override
  bool equals(EnforcerAssignmentRecord? e1, EnforcerAssignmentRecord? e2) {
    return e1?.shiftEnd == e2?.shiftEnd &&
        e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        e1?.status == e2?.status &&
        e1?.note == e2?.note &&
        e1?.enforcerName == e2?.enforcerName &&
        e1?.shiftStart == e2?.shiftStart &&
        e1?.apprePlace == e2?.apprePlace;
  }

  @override
  int hash(EnforcerAssignmentRecord? e) => const ListEquality().hash([
        e?.shiftEnd,
        e?.createdTime,
        e?.editedTime,
        e?.status,
        e?.note,
        e?.enforcerName,
        e?.shiftStart,
        e?.apprePlace
      ]);

  @override
  bool isValidKey(Object? o) => o is EnforcerAssignmentRecord;
}
