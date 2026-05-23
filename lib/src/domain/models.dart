enum MemberRelation { self, child, parent, partner, shared, other }

enum MedicineStatus { normal, expiringSoon, expired, lowStock, usedUp }

enum DraftType { medicine, medicalDocument }

enum DraftStatus { pending, needsInput, failed, abandoned, promoted }

enum DocumentType { prescription, labReport, diagnosis, other }

class FamilyMember {
  const FamilyMember({
    required this.id,
    required this.name,
    required this.relation,
    this.isSystemDefault = false,
  });

  final String id;
  final String name;
  final MemberRelation relation;
  final bool isSystemDefault;
}

class LocalImageAsset {
  const LocalImageAsset({
    required this.id,
    required this.localPath,
    required this.createdAt,
  });

  final String id;
  final String localPath;
  final DateTime createdAt;
}

class MedicineBatch {
  const MedicineBatch({
    required this.id,
    required this.medicineItemId,
    required this.quantity,
    required this.unit,
    required this.expiryDate,
    this.lowStockThreshold = 1,
  });

  final String id;
  final String medicineItemId;
  final double quantity;
  final String unit;
  final DateTime expiryDate;
  final double lowStockThreshold;

  MedicineBatch copyWith({
    double? quantity,
    DateTime? expiryDate,
    double? lowStockThreshold,
  }) {
    return MedicineBatch(
      id: id,
      medicineItemId: medicineItemId,
      quantity: quantity ?? this.quantity,
      unit: unit,
      expiryDate: expiryDate ?? this.expiryDate,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
    );
  }
}

class MedicineItem {
  const MedicineItem({
    required this.id,
    required this.memberId,
    required this.name,
    required this.specification,
    required this.dosageForm,
    required this.imageAssetIds,
    required this.createdAt,
    required this.updatedAt,
    this.genericName,
    this.indication,
    this.storageNotes,
  });

  final String id;
  final String memberId;
  final String name;
  final String? genericName;
  final String specification;
  final String dosageForm;
  final String? indication;
  final String? storageNotes;
  final List<String> imageAssetIds;
  final DateTime createdAt;
  final DateTime updatedAt;
}

class MedicalDocumentRecord {
  const MedicalDocumentRecord({
    required this.id,
    required this.visitRecordId,
    required this.documentType,
    required this.summary,
    required this.imageAssetIds,
    required this.createdAt,
  });

  final String id;
  final String visitRecordId;
  final DocumentType documentType;
  final String summary;
  final List<String> imageAssetIds;
  final DateTime createdAt;
}

class VisitRecord {
  const VisitRecord({
    required this.id,
    required this.memberId,
    required this.visitDate,
    required this.diagnosisSummary,
    required this.documentIds,
    required this.createdAt,
    this.hospitalName,
    this.department,
    this.doctorName,
  });

  final String id;
  final String memberId;
  final DateTime visitDate;
  final String? hospitalName;
  final String? department;
  final String diagnosisSummary;
  final String? doctorName;
  final List<String> documentIds;
  final DateTime createdAt;
}

class RecognitionDraft {
  const RecognitionDraft({
    required this.id,
    required this.draftType,
    required this.memberId,
    required this.status,
    required this.payload,
    required this.missingFields,
    required this.imageAssetIds,
    required this.createdAt,
    required this.updatedAt,
    this.errorMessage,
  });

  final String id;
  final DraftType draftType;
  final String memberId;
  final DraftStatus status;
  final Map<String, Object?> payload;
  final List<String> missingFields;
  final List<String> imageAssetIds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? errorMessage;

  RecognitionDraft copyWith({
    DraftStatus? status,
    Map<String, Object?>? payload,
    List<String>? missingFields,
    String? errorMessage,
    DateTime? updatedAt,
  }) {
    return RecognitionDraft(
      id: id,
      draftType: draftType,
      memberId: memberId,
      status: status ?? this.status,
      payload: payload ?? this.payload,
      missingFields: missingFields ?? this.missingFields,
      imageAssetIds: imageAssetIds,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class HomeMedicineState {
  const HomeMedicineState({
    required this.members,
    required this.medicines,
    required this.batches,
    required this.visits,
    required this.documents,
    required this.drafts,
    required this.images,
    required this.selectedMemberId,
  });

  final List<FamilyMember> members;
  final List<MedicineItem> medicines;
  final List<MedicineBatch> batches;
  final List<VisitRecord> visits;
  final List<MedicalDocumentRecord> documents;
  final List<RecognitionDraft> drafts;
  final List<LocalImageAsset> images;
  final String selectedMemberId;

  HomeMedicineState copyWith({
    List<FamilyMember>? members,
    List<MedicineItem>? medicines,
    List<MedicineBatch>? batches,
    List<VisitRecord>? visits,
    List<MedicalDocumentRecord>? documents,
    List<RecognitionDraft>? drafts,
    List<LocalImageAsset>? images,
    String? selectedMemberId,
  }) {
    return HomeMedicineState(
      members: members ?? this.members,
      medicines: medicines ?? this.medicines,
      batches: batches ?? this.batches,
      visits: visits ?? this.visits,
      documents: documents ?? this.documents,
      drafts: drafts ?? this.drafts,
      images: images ?? this.images,
      selectedMemberId: selectedMemberId ?? this.selectedMemberId,
    );
  }
}
