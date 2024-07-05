class MissingKeyException implements Exception {
  const MissingKeyException(this.key);

  final String key;

  @override
  String toString() => 'Missing \'$key\' key';
}
