import 'medical_document_record.dart';
import 'model_enums.dart';

class VisitRecord {
  const VisitRecord({
    required this.id,
    required this.memberId,
    required this.visitDate,
    required this.hospitalName,
    required this.department,
    required this.diagnosisSummary,
    required this.doctorName,
    required this.status,
    required this.documents,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String memberId;
  final DateTime visitDate;
  final String? hospitalName;
  final String? department;
  final String diagnosisSummary;
  final String? doctorName;
  final VisitStatus status;
  final List<MedicalDocumentRecord> documents;
  final DateTime createdAt;
  final DateTime updatedAt;

  int get documentCount => documents.length;
}

