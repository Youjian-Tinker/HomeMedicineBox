import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/draft_service.dart';
import '../../domain/models.dart';

class RecognitionConfig {
  const RecognitionConfig({
    required this.endpoint,
    required this.apiKey,
    this.model = 'default',
  });

  final Uri? endpoint;
  final String? apiKey;
  final String model;

  bool get isConfigured =>
      endpoint != null && apiKey != null && apiKey!.isNotEmpty;
}

class RecognitionService {
  RecognitionService({
    required this.config,
    required this.client,
    required this.draftService,
    this.timeout = const Duration(seconds: 30),
  });

  final RecognitionConfig config;
  final http.Client client;
  final DraftService draftService;
  final Duration timeout;

  Future<RecognitionDraft> recognizeMedicine({
    required String draftId,
    required String memberId,
    required List<String> imageAssetIds,
    required List<String> imagePaths,
    required DateTime now,
  }) async {
    if (!config.isConfigured) {
      return draftService.failedDraft(
        id: draftId,
        draftType: DraftType.medicine,
        memberId: memberId,
        imageAssetIds: imageAssetIds,
        message: 'AI service is not configured. Continue with manual input.',
        now: now,
      );
    }

    try {
      final response = await client
          .post(
            config.endpoint!,
            headers: {
              'authorization': 'Bearer ${config.apiKey}',
              'content-type': 'application/json',
            },
            body: jsonEncode({
              'task': 'recognize_medicine',
              'model': config.model,
              'imagePaths': imagePaths,
            }),
          )
          .timeout(timeout);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw StateError('AI request failed: ${response.statusCode}');
      }
      final decoded = jsonDecode(response.body) as Map<String, Object?>;
      final payload =
          (decoded['payload'] as Map?)?.cast<String, Object?>() ?? {};
      final missingFields =
          (decoded['missingFields'] as List?)?.whereType<String>().toList() ??
              const [];
      return RecognitionDraft(
        id: draftId,
        draftType: DraftType.medicine,
        memberId: memberId,
        status: missingFields.isEmpty
            ? DraftStatus.pending
            : DraftStatus.needsInput,
        payload: payload,
        missingFields: missingFields,
        imageAssetIds: imageAssetIds,
        createdAt: now,
        updatedAt: now,
      );
    } catch (error) {
      return draftService.failedDraft(
        id: draftId,
        draftType: DraftType.medicine,
        memberId: memberId,
        imageAssetIds: imageAssetIds,
        message: 'AI recognition failed. Continue with manual input.',
        now: now,
      );
    }
  }
}
