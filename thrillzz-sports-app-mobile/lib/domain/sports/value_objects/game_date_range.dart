sealed class GameDateRangeException implements Exception {}

class GameDateRangeInvalid extends GameDateRangeException {}

class GameDateRange {
  GameDateRange({required this.start, required this.end}) {
    if (end.isBefore(start)) throw GameDateRangeInvalid();
  }

  final DateTime start;
  final DateTime end;

  bool contains(DateTime value) =>
      (value.isAfter(start) || value.isAtSameMomentAs(start)) &&
      (value.isBefore(end) || value.isAtSameMomentAs(end));
}
