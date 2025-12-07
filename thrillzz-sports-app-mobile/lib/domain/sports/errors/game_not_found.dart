// coverage:ignore-file
class GameNotFound implements Exception {
  const GameNotFound(this.id);

  final String id;

  @override
  String toString() => 'GameNotFound(id: $id)';
}
