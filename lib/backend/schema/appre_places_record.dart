import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApprePlacesRecord extends FirestoreRecord {
  ApprePlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "purok" field.
  String? _purok;
  String get purok => _purok ?? '';
  bool hasPurok() => _purok != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "landmark" field.
  String? _landmark;
  String get landmark => _landmark ?? '';
  bool hasLandmark() => _landmark != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "active_count" field.
  int? _activeCount;
  int get activeCount => _activeCount ?? 0;
  bool hasActiveCount() => _activeCount != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _barangay = snapshotData['barangay'] as String?;
    _purok = snapshotData['purok'] as String?;
    _street = snapshotData['street'] as String?;
    _landmark = snapshotData['landmark'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _activeCount = castToType<int>(snapshotData['active_count']);
    _id = snapshotData['id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('apprePlaces');

  static Stream<ApprePlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApprePlacesRecord.fromSnapshot(s));

  static Future<ApprePlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApprePlacesRecord.fromSnapshot(s));

  static ApprePlacesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApprePlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApprePlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApprePlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApprePlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApprePlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApprePlacesRecordData({
  String? barangay,
  String? purok,
  String? street,
  String? landmark,
  DateTime? createdTime,
  DateTime? editedTime,
  int? activeCount,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barangay': barangay,
      'purok': purok,
      'street': street,
      'landmark': landmark,
      'created_time': createdTime,
      'edited_time': editedTime,
      'active_count': activeCount,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApprePlacesRecordDocumentEquality implements Equality<ApprePlacesRecord> {
  const ApprePlacesRecordDocumentEquality();

  @override
  bool equals(ApprePlacesRecord? e1, ApprePlacesRecord? e2) {
    return e1?.barangay == e2?.barangay &&
        e1?.purok == e2?.purok &&
        e1?.street == e2?.street &&
        e1?.landmark == e2?.landmark &&
        e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        e1?.activeCount == e2?.activeCount &&
        e1?.id == e2?.id;
  }

  @override
  int hash(ApprePlacesRecord? e) => const ListEquality().hash([
        e?.barangay,
        e?.purok,
        e?.street,
        e?.landmark,
        e?.createdTime,
        e?.editedTime,
        e?.activeCount,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is ApprePlacesRecord;
}
