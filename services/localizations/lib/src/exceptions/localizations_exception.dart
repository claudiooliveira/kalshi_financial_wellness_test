class LocalizationsException implements Exception {
  const LocalizationsException();

  @override
  String toString() => 'Missing Localizations delegate';
}
