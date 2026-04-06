import 'model_enums.dart';

class MedicalDocumentRecord {
  const MedicalDocumentRecord({
    required this.id,
    required this.visitRecordId,
    required this.documentType,
    required this.summary,
    required this.extractedText,
    required this.keyIndicators,
    required this.imageAssetIds,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
    this.prescriptionMedicines = const <String>[],
  });

  final String id;
  final String visitRecordId;
  final MedicalDocumentType documentType;
  final String summary;
  final String extractedText;
  final String? keyIndicators;
  final List<String> imageAssetIds;
  final MedicineSource source;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> prescriptionMedicines;
}

