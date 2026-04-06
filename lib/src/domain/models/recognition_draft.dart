import 'model_enums.dart';

class RecognitionDraft {
  const RecognitionDraft({
    required this.id,
    required this.draftType,
    required this.memberId,
    required this.status,
    required this.recognizedPayload,
    required this.missingFields,
    required this.confidenceHints,
    required this.imageAssetIds,
    required this.createdAt,
    required this.updatedAt,
    this.errorMessage,
  });

  final String id;
  final DraftType draftType;
  final String memberId;
  final DraftStatus status;
  final Map<String, Object?> recognizedPayload;
  final List<String> missingFields;
  final Map<String, double> confidenceHints;
  final List<String> imageAssetIds;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime updatedAt;

  RecognitionDraft copyWith({
    DraftStatus? status,
    Map<String, Object?>? recognizedPayload,
    List<String>? missingFields,
    Map<String, double>? confidenceHints,
    List<String>? imageAssetIds,
    String? errorMessage,
    DateTime? updatedAt,
  }) {
    return RecognitionDraft(
      id: id,
      draftType: draftType,
      memberId: memberId,
      status: status ?? this.status,
      recognizedPayload: recognizedPayload ?? this.recognizedPayload,
      missingFields: missingFields ?? this.missingFields,
      confidenceHints: confidenceHints ?? this.confidenceHints,
      imageAssetIds: imageAssetIds ?? this.imageAssetIds,
      errorMessage: errorMessage ?? this.errorMessage,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

