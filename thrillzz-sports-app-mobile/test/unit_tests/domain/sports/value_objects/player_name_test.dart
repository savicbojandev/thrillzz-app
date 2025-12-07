import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/player_name.dart';

void main() {
  group('PlayerName', () {
    test('throws on empty', () {
      expect(() => PlayerName('   '), throwsA(isA<PlayerNameEmpty>()));
    });

    test('trims surrounding whitespace', () {
      final name = PlayerName('  Jane Doe  ');

      expect(name.value, 'Jane Doe');
    });
  });
}
