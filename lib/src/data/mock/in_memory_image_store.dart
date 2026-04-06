import '../../domain/models/local_image_asset.dart';
import '../../domain/services/image_store.dart';
import 'seed_data.dart';

class InMemoryImageStore implements ImageStore {
  InMemoryImageStore._(List<LocalImageAsset> assets)
      : _assets = {for (final asset in assets) asset.id: asset};

  factory InMemoryImageStore.seeded() {
    return InMemoryImageStore._(SeedData.imageAssets);
  }

  final Map<String, LocalImageAsset> _assets;
  final Map<String, List<String>> _draftBindings = {};

  @override
  Future<void> deleteUnreferenced(List<String> assetIds) async {
    for (final assetId in assetIds) {
      final stillReferenced = _draftBindings.values.any((ids) => ids.contains(assetId));
      if (!stillReferenced) {
        _assets.remove(assetId);
      }
    }
  }

  @override
  Future<List<LocalImageAsset>> listAssets() async => _assets.values.toList();

  @override
  Future<void> moveAssetsToDraft(String draftId, List<String> assetIds) async {
    _draftBindings[draftId] = assetIds;
  }

  @override
  Future<void> saveTemporaryAssets(List<LocalImageAsset> assets) async {
    for (final asset in assets) {
      _assets[asset.id] = asset;
    }
  }
}

