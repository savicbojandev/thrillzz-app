class GameDate {
  GameDate(DateTime value)
    : value = DateTime.utc(
        value.year,
        value.month,
        value.day,
        value.hour,
        value.minute,
      );

  final DateTime value;
}
