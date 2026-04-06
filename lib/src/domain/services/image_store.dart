import '../models/local_image_asset.dart';

abstract class ImageStore {
  Future<List<LocalImageAsset>> listAssets();

  Future<void> saveTemporaryAssets(List<LocalImageAsset> assets);

  Future<void> moveAssetsToDraft(String draftId, List<String> assetIds);

  Future<void> deleteUnreferenced(List<String> assetIds);
}

