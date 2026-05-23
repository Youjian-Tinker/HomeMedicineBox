import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models.dart';
import 'app_database.dart';

class MedicineEntry {
  const MedicineEntry({
    required this.memberId,
    required this.name,
    required this.specification,
    required this.dosageForm,
    required this.quantity,
    required this.unit,
    required this.expiryDate,
    required this.lowStockThreshold,
    this.genericName,
    this.indication,
    this.storageNotes,
  });

  final String memberId;
  final String name;
  final String? genericName;
  final String specification;
  final String dosageForm;
  final double quantity;
  final String unit;
  final DateTime expiryDate;
  final double lowStockThreshold;
  final String? indication;
  final String? storageNotes;
}

class MedicineUpdate {
  const MedicineUpdate({
    required this.name,
    required this.specification,
    required this.dosageForm,
    this.genericName,
    this.indication,
    this.storageNotes,
  });

  final String name;
  final String? genericName;
  final String specification;
  final String dosageForm;
  final String? indication;
  final String? storageNotes;
}

class VisitEntry {
  const VisitEntry({
    required this.memberId,
    required this.visitDate,
    required this.diagnosisSummary,
    this.hospitalName,
    this.department,
    this.doctorName,
    this.documentSummary,
  });

  final String memberId;
  final DateTime visitDate;
  final String? hospitalName;
  final String? department;
  final String diagnosisSummary;
  final String? doctorName;
  final String? documentSummary;
}

class HomeRepository {
  HomeRepository(this._db, {Uuid? uuid}) : _uuid = uuid ?? const Uuid();

  final AppDatabase _db;
  final Uuid _uuid;

  Future<HomeMedicineState> loadState({String? selectedMemberId}) async {
    await ensureDefaultMember();
    final members = await _db.select(_db.familyMembers).get();
    final medicines = await (_db.select(_db.medicineItems)
          ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)]))
        .get();
    final batches = await _db.select(_db.medicineBatches).get();
    final visits = await (_db.select(_db.visitRecords)
          ..orderBy([(table) => OrderingTerm.desc(table.visitDate)]))
        .get();
    final documents = await _db.select(_db.medicalDocumentRecords).get();
    final drafts = await (_db.select(_db.recognitionDrafts)
          ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)]))
        .get();
    final images = await _db.select(_db.localImageAssets).get();
    final defaultMember = members.firstWhere(
      (member) => member.isSystemDefault,
      orElse: () => members.first,
    );
    final selectedStillExists =
        members.any((member) => member.id == selectedMemberId);

    return HomeMedicineState(
      members: members.map(_toFamilyMember).toList(),
      medicines: medicines.map(_toMedicineItem).toList(),
      batches: batches.map(_toMedicineBatch).toList(),
      visits: visits.map((visit) => _toVisitRecord(visit, documents)).toList(),
      documents: documents.map(_toMedicalDocumentRecord).toList(),
      drafts: drafts.map(_toRecognitionDraft).toList(),
      images: images.map(_toLocalImageAsset).toList(),
      selectedMemberId:
          selectedStillExists ? selectedMemberId! : defaultMember.id,
    );
  }

  Future<FamilyMember> ensureDefaultMember() async {
    final existing = await (_db.select(_db.familyMembers)
          ..where((table) => table.isSystemDefault.equals(true)))
        .getSingleOrNull();
    if (existing != null) {
      return _toFamilyMember(existing);
    }

    final now = DateTime.now();
    const id = 'member-shared';
    await _db.into(_db.familyMembers).insert(
          FamilyMembersCompanion.insert(
            id: id,
            name: '家庭共用',
            relation: MemberRelation.shared.name,
            isSystemDefault: const Value(true),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return const FamilyMember(
      id: id,
      name: '家庭共用',
      relation: MemberRelation.shared,
      isSystemDefault: true,
    );
  }

  Future<void> addMedicine(MedicineEntry entry) async {
    final now = DateTime.now();
    final medicineId = _uuid.v4();
    await _db.transaction(() async {
      await _db.into(_db.medicineItems).insert(
            MedicineItemsCompanion.insert(
              id: medicineId,
              memberId: entry.memberId,
              name: entry.name,
              genericName: Value(_blankToNull(entry.genericName)),
              specification: entry.specification,
              dosageForm: entry.dosageForm,
              indication: Value(_blankToNull(entry.indication)),
              storageNotes: Value(_blankToNull(entry.storageNotes)),
              source: 'manual',
              createdAt: now,
              updatedAt: now,
            ),
          );
      await _db.into(_db.medicineBatches).insert(
            MedicineBatchesCompanion.insert(
              id: _uuid.v4(),
              medicineItemId: medicineId,
              quantity: entry.quantity,
              unit: entry.unit,
              expiryDate: entry.expiryDate,
              lowStockThreshold: Value(entry.lowStockThreshold),
              createdAt: now,
              updatedAt: now,
            ),
          );
    });
  }

  Future<void> updateMedicine(String id, MedicineUpdate update) async {
    await (_db.update(_db.medicineItems)..where((table) => table.id.equals(id)))
        .write(
      MedicineItemsCompanion(
        name: Value(update.name),
        genericName: Value(_blankToNull(update.genericName)),
        specification: Value(update.specification),
        dosageForm: Value(update.dosageForm),
        indication: Value(_blankToNull(update.indication)),
        storageNotes: Value(_blankToNull(update.storageNotes)),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> reduceBatchQuantity(String batchId, double amount) async {
    final batch = await (_db.select(_db.medicineBatches)
          ..where((table) => table.id.equals(batchId)))
        .getSingle();
    final nextQuantity = (batch.quantity - amount).clamp(0, double.infinity);
    await (_db.update(_db.medicineBatches)
          ..where((table) => table.id.equals(batchId)))
        .write(
      MedicineBatchesCompanion(
        quantity: Value(nextQuantity.toDouble()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteMedicine(String id) async {
    await _db.transaction(() async {
      await (_db.delete(_db.medicineBatches)
            ..where((table) => table.medicineItemId.equals(id)))
          .go();
      await (_db.delete(_db.medicineItems)
            ..where((table) => table.id.equals(id)))
          .go();
    });
  }

  Future<void> addVisit(VisitEntry entry) async {
    final now = DateTime.now();
    final visitId = _uuid.v4();
    await _db.transaction(() async {
      await _db.into(_db.visitRecords).insert(
            VisitRecordsCompanion.insert(
              id: visitId,
              memberId: entry.memberId,
              visitDate: entry.visitDate,
              hospitalName: Value(_blankToNull(entry.hospitalName)),
              department: Value(_blankToNull(entry.department)),
              diagnosisSummary: entry.diagnosisSummary,
              doctorName: Value(_blankToNull(entry.doctorName)),
              createdAt: now,
              updatedAt: now,
            ),
          );
      final summary = _blankToNull(entry.documentSummary);
      if (summary != null) {
        await _db.into(_db.medicalDocumentRecords).insert(
              MedicalDocumentRecordsCompanion.insert(
                id: _uuid.v4(),
                visitRecordId: visitId,
                documentType: DocumentType.diagnosis.name,
                summary: summary,
                imageAssetIdsJson: encodeStringList(const []),
                source: 'manual',
                createdAt: now,
                updatedAt: now,
              ),
            );
      }
    });
  }

  Future<void> deleteVisit(String id) async {
    await _db.transaction(() async {
      await (_db.delete(_db.medicalDocumentRecords)
            ..where((table) => table.visitRecordId.equals(id)))
          .go();
      await (_db.delete(_db.visitRecords)
            ..where((table) => table.id.equals(id)))
          .go();
    });
  }

  Future<void> addManualMedicineDraft(String memberId) async {
    final now = DateTime.now();
    await _db.into(_db.recognitionDrafts).insert(
          RecognitionDraftsCompanion.insert(
            id: _uuid.v4(),
            draftType: DraftType.medicine.name,
            memberId: memberId,
            status: DraftStatus.needsInput.name,
            recognizedPayloadJson: encodeMap({
              'name': '待补充药品',
              'specification': '请填写规格',
              'dosageForm': '片剂',
              'quantity': 1,
              'unit': '盒',
              'expiryDate':
                  now.add(const Duration(days: 180)).toIso8601String(),
            }),
            missingFieldsJson: encodeStringList(const ['药品名称', '规格', '有效期']),
            imageAssetIdsJson: encodeStringList(const []),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<void> deleteDraft(String id) async {
    await (_db.delete(_db.recognitionDrafts)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  Future<void> promoteMedicineDraft(RecognitionDraft draft) async {
    final now = DateTime.now();
    final medicineId = _uuid.v4();
    await _db.transaction(() async {
      await _db.into(_db.medicineItems).insert(
            MedicineItemsCompanion.insert(
              id: medicineId,
              memberId: draft.memberId,
              name: draft.payload['name']?.toString() ?? '',
              genericName: const Value(null),
              specification: draft.payload['specification']?.toString() ?? '',
              dosageForm: draft.payload['dosageForm']?.toString() ?? '',
              indication:
                  Value(_blankToNull(draft.payload['indication']?.toString())),
              storageNotes: Value(
                  _blankToNull(draft.payload['storageNotes']?.toString())),
              source: 'draft',
              createdAt: now,
              updatedAt: now,
            ),
          );
      await _db.into(_db.medicineBatches).insert(
            MedicineBatchesCompanion.insert(
              id: _uuid.v4(),
              medicineItemId: medicineId,
              quantity: _numValue(draft.payload['quantity'], 1),
              unit: draft.payload['unit']?.toString() ?? '盒',
              expiryDate: DateTime.tryParse(
                    draft.payload['expiryDate']?.toString() ?? '',
                  ) ??
                  now,
              lowStockThreshold:
                  Value(_numValue(draft.payload['lowStockThreshold'], 1)),
              createdAt: now,
              updatedAt: now,
            ),
          );
      await (_db.update(_db.recognitionDrafts)
            ..where((table) => table.id.equals(draft.id)))
          .write(
        RecognitionDraftsCompanion(
          status: Value(DraftStatus.promoted.name),
          updatedAt: Value(now),
        ),
      );
    });
  }

  FamilyMember _toFamilyMember(FamilyMemberRow row) {
    return FamilyMember(
      id: row.id,
      name: row.name,
      relation: MemberRelation.values.byName(row.relation),
      isSystemDefault: row.isSystemDefault,
    );
  }

  MedicineItem _toMedicineItem(MedicineItemRow row) {
    return MedicineItem(
      id: row.id,
      memberId: row.memberId,
      name: row.name,
      genericName: row.genericName,
      specification: row.specification,
      dosageForm: row.dosageForm,
      indication: row.indication,
      storageNotes: row.storageNotes,
      imageAssetIds: const [],
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  MedicineBatch _toMedicineBatch(MedicineBatchRow row) {
    return MedicineBatch(
      id: row.id,
      medicineItemId: row.medicineItemId,
      quantity: row.quantity,
      unit: row.unit,
      expiryDate: row.expiryDate,
      lowStockThreshold: row.lowStockThreshold,
    );
  }

  VisitRecord _toVisitRecord(
    VisitRecordRow row,
    List<MedicalDocumentRecordRow> documents,
  ) {
    return VisitRecord(
      id: row.id,
      memberId: row.memberId,
      visitDate: row.visitDate,
      hospitalName: row.hospitalName,
      department: row.department,
      diagnosisSummary: row.diagnosisSummary,
      doctorName: row.doctorName,
      documentIds: documents
          .where((document) => document.visitRecordId == row.id)
          .map((document) => document.id)
          .toList(),
      createdAt: row.createdAt,
    );
  }

  MedicalDocumentRecord _toMedicalDocumentRecord(MedicalDocumentRecordRow row) {
    return MedicalDocumentRecord(
      id: row.id,
      visitRecordId: row.visitRecordId,
      documentType: DocumentType.values.byName(row.documentType),
      summary: row.summary,
      imageAssetIds: decodeStringList(row.imageAssetIdsJson),
      createdAt: row.createdAt,
    );
  }

  RecognitionDraft _toRecognitionDraft(RecognitionDraftRow row) {
    return RecognitionDraft(
      id: row.id,
      draftType: DraftType.values.byName(row.draftType),
      memberId: row.memberId,
      status: DraftStatus.values.byName(row.status),
      payload: decodeMap(row.recognizedPayloadJson),
      missingFields: decodeStringList(row.missingFieldsJson),
      imageAssetIds: decodeStringList(row.imageAssetIdsJson),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      errorMessage: row.errorMessage,
    );
  }

  LocalImageAsset _toLocalImageAsset(LocalImageAssetRow row) {
    return LocalImageAsset(
      id: row.id,
      localPath: row.localPath,
      createdAt: row.createdAt,
    );
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }

  double _numValue(Object? value, double fallback) {
    if (value is num) {
      return value.toDouble();
    }
    return double.tryParse(value?.toString() ?? '') ?? fallback;
  }
}
