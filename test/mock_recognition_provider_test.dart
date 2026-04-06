import 'package:flutter_test/flutter_test.dart';
import 'package:home_medicine_box/src/data/mock/mock_recognition_provider.dart';
import 'package:home_medicine_box/src/domain/models/local_image_asset.dart';
import 'package:home_medicine_box/src/domain/models/model_enums.dart';

void main() {
  test('returns medicine draft payload for selected images', () async {
    const provider = MockRecognitionProvider();
    final image = LocalImageAsset(
      id: 'asset-1',
      localPath: 'Documents/images/drafts/demo.jpg',
      fileName: 'demo.jpg',
      mimeType: 'image/jpeg',
      fileSize: 100,
      width: 100,
      height: 100,
      createdAt: DateTime(2026, 4, 6),
    );

    final draft = await provider.recognizeMedicine(
      memberId: 'member-shared',
      images: [image],
    );

    expect(draft.draftType, DraftType.medicine);
    expect(draft.imageAssetIds, ['asset-1']);
    expect(draft.recognizedPayload['name'], isNotNull);
  });
}
