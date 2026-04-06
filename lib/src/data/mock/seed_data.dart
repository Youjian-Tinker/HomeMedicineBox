import '../../domain/models/family_member.dart';
import '../../domain/models/local_image_asset.dart';
import '../../domain/models/medical_document_record.dart';
import '../../domain/models/medicine_batch.dart';
import '../../domain/models/medicine_item.dart';
import '../../domain/models/model_enums.dart';
import '../../domain/models/recognition_draft.dart';
import '../../domain/models/visit_record.dart';

class SeedData {
  const SeedData._();

  static const sharedMemberId = 'member-shared';
  static final now = DateTime(2026, 4, 6, 9, 30);

  static final familyMembers = <FamilyMember>[
    FamilyMember(
      id: sharedMemberId,
      name: '家庭共用',
      relation: MemberRelation.shared,
      avatarColorHex: '#245D54',
      isSystemDefault: true,
      createdAt: now.subtract(const Duration(days: 120)),
      updatedAt: now.subtract(const Duration(days: 1)),
    ),
    FamilyMember(
      id: 'member-child-luna',
      name: 'Luna',
      relation: MemberRelation.child,
      avatarColorHex: '#E39A58',
      isSystemDefault: false,
      createdAt: now.subtract(const Duration(days: 90)),
      updatedAt: now.subtract(const Duration(days: 2)),
    ),
    FamilyMember(
      id: 'member-parent-dad',
      name: '爸爸',
      relation: MemberRelation.parent,
      avatarColorHex: '#6B7FD7',
      isSystemDefault: false,
      createdAt: now.subtract(const Duration(days: 80)),
      updatedAt: now.subtract(const Duration(days: 3)),
    ),
  ];

  static final imageAssets = <LocalImageAsset>[
    LocalImageAsset(
      id: 'asset-ibu-box',
      localPath: 'Documents/images/medicine/ibu_box.jpg',
      fileName: 'ibu_box.jpg',
      mimeType: 'image/jpeg',
      fileSize: 245000,
      width: 1280,
      height: 960,
      createdAt: now.subtract(const Duration(days: 14)),
    ),
    LocalImageAsset(
      id: 'asset-loratadine-box',
      localPath: 'Documents/images/medicine/loratadine_box.jpg',
      fileName: 'loratadine_box.jpg',
      mimeType: 'image/jpeg',
      fileSize: 228000,
      width: 1280,
      height: 960,
      createdAt: now.subtract(const Duration(days: 24)),
    ),
    LocalImageAsset(
      id: 'asset-visit-prescription',
      localPath: 'Documents/images/medical/prescription_20260318.jpg',
      fileName: 'prescription_20260318.jpg',
      mimeType: 'image/jpeg',
      fileSize: 318000,
      width: 1536,
      height: 2048,
      createdAt: now.subtract(const Duration(days: 19)),
    ),
    LocalImageAsset(
      id: 'asset-draft-report',
      localPath: 'Documents/images/drafts/report_draft.jpg',
      fileName: 'report_draft.jpg',
      mimeType: 'image/jpeg',
      fileSize: 287000,
      width: 1536,
      height: 2048,
      createdAt: now.subtract(const Duration(hours: 5)),
    ),
  ];

  static final medicines = <MedicineItem>[
    MedicineItem(
      id: 'medicine-ibuprofen',
      memberId: sharedMemberId,
      name: '布洛芬混悬液',
      genericName: '布洛芬',
      specification: '100ml:2g',
      dosageForm: '混悬液',
      category: '退烧止痛',
      indication: '发热、轻中度疼痛',
      storageNotes: '阴凉干燥保存，开启后尽快使用',
      coverImageAssetId: 'asset-ibu-box',
      source: MedicineSource.ai,
      createdAt: now.subtract(const Duration(days: 14)),
      updatedAt: now.subtract(const Duration(hours: 12)),
      batches: [
        MedicineBatch(
          id: 'batch-ibuprofen-a',
          medicineItemId: 'medicine-ibuprofen',
          quantity: 0.5,
          unit: '瓶',
          expiryDate: DateTime(2026, 4, 28),
          lowStockThreshold: 1,
          status: MedicineBatchStatus.lowStock,
          createdAt: now.subtract(const Duration(days: 14)),
          updatedAt: now.subtract(const Duration(hours: 12)),
        ),
      ],
    ),
    MedicineItem(
      id: 'medicine-loratadine',
      memberId: sharedMemberId,
      name: '氯雷他定片',
      genericName: '氯雷他定',
      specification: '10mg*6片',
      dosageForm: '片剂',
      category: '过敏常备',
      indication: '缓解过敏性鼻炎症状',
      storageNotes: '避光保存',
      coverImageAssetId: 'asset-loratadine-box',
      source: MedicineSource.manual,
      createdAt: now.subtract(const Duration(days: 24)),
      updatedAt: now.subtract(const Duration(days: 2)),
      batches: [
        MedicineBatch(
          id: 'batch-loratadine-a',
          medicineItemId: 'medicine-loratadine',
          quantity: 1,
          unit: '盒',
          expiryDate: DateTime(2026, 5, 5),
          lowStockThreshold: 1,
          status: MedicineBatchStatus.expiringSoon,
          createdAt: now.subtract(const Duration(days: 24)),
          updatedAt: now.subtract(const Duration(days: 2)),
        ),
      ],
    ),
    MedicineItem(
      id: 'medicine-smecta',
      memberId: 'member-child-luna',
      name: '蒙脱石散',
      genericName: '蒙脱石散',
      specification: '3g*10袋',
      dosageForm: '散剂',
      category: '肠胃用药',
      indication: '腹泻辅助处理',
      storageNotes: '常温保存',
      coverImageAssetId: null,
      source: MedicineSource.ai,
      createdAt: now.subtract(const Duration(days: 50)),
      updatedAt: now.subtract(const Duration(days: 4)),
      batches: [
        MedicineBatch(
          id: 'batch-smecta-a',
          medicineItemId: 'medicine-smecta',
          quantity: 2,
          unit: '袋',
          expiryDate: DateTime(2026, 3, 25),
          lowStockThreshold: 2,
          status: MedicineBatchStatus.expired,
          createdAt: now.subtract(const Duration(days: 50)),
          updatedAt: now.subtract(const Duration(days: 4)),
        ),
      ],
    ),
  ];

  static final visitRecords = <VisitRecord>[
    VisitRecord(
      id: 'visit-shared-20260318',
      memberId: sharedMemberId,
      visitDate: DateTime(2026, 3, 18),
      hospitalName: '浦东新区人民医院',
      department: '儿科门诊',
      diagnosisSummary: '上呼吸道感染，建议继续观察体温并按需服用退热药',
      doctorName: '刘医生',
      status: VisitStatus.archived,
      createdAt: now.subtract(const Duration(days: 19)),
      updatedAt: now.subtract(const Duration(days: 18)),
      documents: [
        MedicalDocumentRecord(
          id: 'doc-prescription-20260318',
          visitRecordId: 'visit-shared-20260318',
          documentType: MedicalDocumentType.prescription,
          summary: '处方含布洛芬混悬液、口服补液盐',
          extractedText: '诊断：上呼吸道感染。医嘱：体温超过 38.5 度时按需使用布洛芬。',
          keyIndicators: null,
          imageAssetIds: ['asset-visit-prescription'],
          source: MedicineSource.ai,
          prescriptionMedicines: ['布洛芬混悬液', '口服补液盐'],
          createdAt: now.subtract(const Duration(days: 19)),
          updatedAt: now.subtract(const Duration(days: 18)),
        ),
      ],
    ),
    VisitRecord(
      id: 'visit-dad-20260207',
      memberId: 'member-parent-dad',
      visitDate: DateTime(2026, 2, 7),
      hospitalName: '东方医院',
      department: '心内科',
      diagnosisSummary: '高血压随诊，维持原方案',
      doctorName: '周医生',
      status: VisitStatus.needsMoreDocuments,
      createdAt: now.subtract(const Duration(days: 58)),
      updatedAt: now.subtract(const Duration(days: 50)),
      documents: [
        MedicalDocumentRecord(
          id: 'doc-diagnosis-20260207',
          visitRecordId: 'visit-dad-20260207',
          documentType: MedicalDocumentType.diagnosisNote,
          summary: '血压控制尚可，建议继续监测',
          extractedText: '血压 135/82 mmHg，建议晨起记录一周。',
          keyIndicators: '血压 135/82 mmHg',
          imageAssetIds: [],
          source: MedicineSource.manual,
          createdAt: now.subtract(const Duration(days: 58)),
          updatedAt: now.subtract(const Duration(days: 50)),
        ),
      ],
    ),
  ];

  static final drafts = <RecognitionDraft>[
    RecognitionDraft(
      id: 'draft-medicine-001',
      draftType: DraftType.medicine,
      memberId: sharedMemberId,
      status: DraftStatus.pendingReview,
      recognizedPayload: {
        'name': '对乙酰氨基酚混悬滴剂',
        'specification': '15ml:1.5g',
        'dosageForm': '滴剂',
        'quantity': 1,
        'unit': '瓶',
        'expiryDate': '2027-01-05',
      },
      missingFields: const [],
      confidenceHints: const {
        'specification': 0.76,
        'expiryDate': 0.72,
      },
      imageAssetIds: const ['asset-ibu-box'],
      createdAt: now.subtract(const Duration(hours: 2)),
      updatedAt: now.subtract(const Duration(hours: 1)),
    ),
    RecognitionDraft(
      id: 'draft-medical-002',
      draftType: DraftType.medicalDocument,
      memberId: 'member-child-luna',
      status: DraftStatus.needsMoreInfo,
      recognizedPayload: {
        'documentType': 'inspection_report',
        'visitDate': '2026-04-05',
        'hospitalName': '儿童医学中心',
        'summary': '血常规部分字段识别成功',
      },
      missingFields: const ['诊断结果摘要'],
      confidenceHints: const {
        'hospitalName': 0.63,
      },
      imageAssetIds: const ['asset-draft-report'],
      createdAt: now.subtract(const Duration(hours: 5)),
      updatedAt: now.subtract(const Duration(hours: 3)),
    ),
  ];
}

