// coverage:ignore-file
class LeagueNotFound implements Exception {
  const LeagueNotFound(this.id);

  final String id;

  @override
  String toString() => 'LeagueNotFound(id: $id)';
}
