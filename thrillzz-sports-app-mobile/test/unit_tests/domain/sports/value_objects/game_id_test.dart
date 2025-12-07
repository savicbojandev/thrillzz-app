import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/game_id.dart';

void main() {
  group('GameId', () {
    test('throws on empty', () {
      expect(() => GameId.fromString(''), throwsA(isA<GameIdEmpty>()));
    });

    test('generates numeric id on newId', () {
      final id = GameId.newId();

      expect(id.value, matches(RegExp(r'^[1-9][0-9]*$')));
    });

    test('throws on non-numeric', () {
      expect(() => GameId.fromString('abc'), throwsA(isA<FieldMustBeSimpleId>()));
    });

    test('accepts numeric', () {
      final id = GameId.fromString('123');
      expect(id.value, '123');
    });
  });
}
