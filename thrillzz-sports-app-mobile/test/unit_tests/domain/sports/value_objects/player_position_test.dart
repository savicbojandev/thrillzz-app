import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/player_position.dart';

void main() {
  group('PlayerPosition', () {
    test('throws on empty', () {
      expect(() => PlayerPosition('  '), throwsA(isA<PlayerPositionEmpty>()));
    });

    test('trims the provided value', () {
      final position = PlayerPosition('  Guard  ');

      expect(position.value, 'Guard');
    });
  });
}
