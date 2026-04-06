enum MemberRelation { self, child, parent, partner, shared, other }

enum MedicineSource { manual, ai }

enum MedicineBatchStatus { normal, expiringSoon, expired, lowStock, consumed }

enum VisitStatus { archived, needsMoreDocuments }

enum MedicalDocumentType { prescription, inspectionReport, diagnosisNote, other }

enum DraftType { medicine, medicalDocument }

enum DraftStatus { pendingReview, needsMoreInfo, failed, discarded, promoted }

enum ReminderKind { expiringSoon, expired, lowStock }

extension MemberRelationLabel on MemberRelation {
  String get label {
    switch (this) {
      case MemberRelation.self:
        return '本人';
      case MemberRelation.child:
        return '孩子';
      case MemberRelation.parent:
        return '父母';
      case MemberRelation.partner:
        return '伴侣';
      case MemberRelation.shared:
        return '家庭共用';
      case MemberRelation.other:
        return '其他';
    }
  }
}

extension MedicineBatchStatusLabel on MedicineBatchStatus {
  String get label {
    switch (this) {
      case MedicineBatchStatus.normal:
        return '正常';
      case MedicineBatchStatus.expiringSoon:
        return '即将过期';
      case MedicineBatchStatus.expired:
        return '已过期';
      case MedicineBatchStatus.lowStock:
        return '库存不足';
      case MedicineBatchStatus.consumed:
        return '已用完';
    }
  }
}

extension MedicalDocumentTypeLabel on MedicalDocumentType {
  String get label {
    switch (this) {
      case MedicalDocumentType.prescription:
        return '处方单';
      case MedicalDocumentType.inspectionReport:
        return '检查报告';
      case MedicalDocumentType.diagnosisNote:
        return '诊断书';
      case MedicalDocumentType.other:
        return '其他';
    }
  }
}

extension DraftTypeLabel on DraftType {
  String get label {
    switch (this) {
      case DraftType.medicine:
        return '药品';
      case DraftType.medicalDocument:
        return '医疗文档';
    }
  }
}

extension DraftStatusLabel on DraftStatus {
  String get label {
    switch (this) {
      case DraftStatus.pendingReview:
        return '待确认';
      case DraftStatus.needsMoreInfo:
        return '待补充';
      case DraftStatus.failed:
        return '识别失败';
      case DraftStatus.discarded:
        return '已放弃';
      case DraftStatus.promoted:
        return '已转正';
    }
  }
}

extension ReminderKindLabel on ReminderKind {
  String get label {
    switch (this) {
      case ReminderKind.expiringSoon:
        return '即将过期';
      case ReminderKind.expired:
        return '已过期';
      case ReminderKind.lowStock:
        return '库存不足';
    }
  }
}

