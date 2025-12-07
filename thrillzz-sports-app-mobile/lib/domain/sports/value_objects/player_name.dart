sealed class PlayerNameException implements Exception {}

class PlayerNameEmpty extends PlayerNameException {}

class PlayerName {
  PlayerName(String value) : value = value.trim() {
    if (this.value.isEmpty) throw PlayerNameEmpty();
  }

  final String value;
}
