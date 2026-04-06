class LocalImageAsset {
  const LocalImageAsset({
    required this.id,
    required this.localPath,
    required this.fileName,
    required this.mimeType,
    required this.fileSize,
    required this.width,
    required this.height,
    required this.createdAt,
  });

  final String id;
  final String localPath;
  final String fileName;
  final String mimeType;
  final int fileSize;
  final int width;
  final int height;
  final DateTime createdAt;
}

