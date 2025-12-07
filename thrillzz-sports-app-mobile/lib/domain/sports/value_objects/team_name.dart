sealed class TeamNameException implements Exception {}

class TeamNameEmpty extends TeamNameException {}

class TeamName {
  TeamName(String value) : value = value.trim() {
    if (this.value.isEmpty) throw TeamNameEmpty();
  }

  final String value;
}
