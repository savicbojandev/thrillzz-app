sealed class LeagueNameException implements Exception {}

class LeagueNameEmpty extends LeagueNameException {}

class LeagueName {
  LeagueName(String value) : value = value.trim() {
    if (this.value.isEmpty) throw LeagueNameEmpty();
  }

  final String value;
}
