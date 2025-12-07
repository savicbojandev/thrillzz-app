import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/game_date_range.dart';

void main() {
  group('GameDateRange', () {
    test('throws when end is before start', () {
      expect(
        () => GameDateRange(
          start: DateTime.utc(2025, 1, 2),
          end: DateTime.utc(2025, 1, 1),
        ),
        throwsA(isA<GameDateRangeInvalid>()),
      );
    });

    test('contains checks inclusive bounds', () {
      final range = GameDateRange(
        start: DateTime.utc(2025, 1, 1),
        end: DateTime.utc(2025, 1, 10),
      );

      expect(range.contains(DateTime.utc(2025, 1, 1)), isTrue);
      expect(range.contains(DateTime.utc(2025, 1, 5)), isTrue);
      expect(range.contains(DateTime.utc(2025, 1, 10)), isTrue);
      expect(range.contains(DateTime.utc(2025, 1, 11)), isFalse);
    });
  });
}
