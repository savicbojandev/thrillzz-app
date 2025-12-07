// coverage:ignore-file
class SportNotFound implements Exception {
  const SportNotFound(this.id);

  final String id;

  @override
  String toString() => 'SportNotFound(id: $id)';
}
