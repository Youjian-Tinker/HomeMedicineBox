import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:home_medicine_box/src/data/recognition/recognition_service.dart';
import 'package:home_medicine_box/src/domain/draft_service.dart';
import 'package:home_medicine_box/src/domain/models.dart';
import 'package:http/http.dart' as http;

void main() {
  test('unconfigured AI returns failed draft for manual fallback', () async {
    final service = RecognitionService(
      config: const RecognitionConfig(endpoint: null, apiKey: null),
      client: _FakeClient((_) async => http.Response('{}', 200)),
      draftService: const DraftService(),
    );

    final draft = await service.recognizeMedicine(
      draftId: 'draft-1',
      memberId: 'member-1',
      imageAssetIds: const ['image-1'],
      imagePaths: const ['local.jpg'],
      now: DateTime(2026, 5, 23),
    );

    expect(draft.status, DraftStatus.failed);
    expect(draft.errorMessage, contains('manual input'));
    expect(draft.imageAssetIds, ['image-1']);
  });

  test('AI request failure still preserves draft and image references',
      () async {
    final service = RecognitionService(
      config: RecognitionConfig(
        endpoint: Uri.parse('https://example.test/recognize'),
        apiKey: 'test-key',
      ),
      client: _FakeClient((_) async => http.Response('server error', 500)),
      draftService: const DraftService(),
    );

    final draft = await service.recognizeMedicine(
      draftId: 'draft-1',
      memberId: 'member-1',
      imageAssetIds: const ['image-1'],
      imagePaths: const ['local.jpg'],
      now: DateTime(2026, 5, 23),
    );

    expect(draft.status, DraftStatus.failed);
    expect(draft.imageAssetIds, ['image-1']);
  });
}

class _FakeClient extends http.BaseClient {
  _FakeClient(this._handler);

  final FutureOr<http.Response> Function(http.BaseRequest request) _handler;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = await _handler(request);
    return http.StreamedResponse(
      Stream.value(response.bodyBytes),
      response.statusCode,
      headers: response.headers,
      reasonPhrase: response.reasonPhrase,
    );
  }
}
