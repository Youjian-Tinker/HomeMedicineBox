String generateId(String prefix) {
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  return '$prefix-$timestamp';
}

