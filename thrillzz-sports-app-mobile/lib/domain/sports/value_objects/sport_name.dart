sealed class SportNameException implements Exception {}

class SportNameEmpty extends SportNameException {}

class SportName {
  SportName(String value) : value = value.trim() {
    if (this.value.isEmpty) throw SportNameEmpty();
  }

  final String value;
}
