class MapperException implements Exception {
  final String message;

  MapperException([this.message = 'Invalid data to mapper']);

  @override
  String toString() => this.message;
}
