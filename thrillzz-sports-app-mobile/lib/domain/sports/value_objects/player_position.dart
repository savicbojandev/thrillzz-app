sealed class PlayerPositionException implements Exception {}

class PlayerPositionEmpty extends PlayerPositionException {}

class PlayerPosition {
  PlayerPosition(String value) : value = value.trim() {
    if (this.value.isEmpty) throw PlayerPositionEmpty();
  }

  final String value;
}
