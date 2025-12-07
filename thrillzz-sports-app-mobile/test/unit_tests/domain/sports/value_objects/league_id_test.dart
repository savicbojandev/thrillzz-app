import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/league_id.dart';

void main() {
  group('LeagueId', () {
    test('throws on empty', () {
      expect(() => LeagueId.fromString(''), throwsA(isA<LeagueIdEmpty>()));
    });

    test('generates numeric id on newId', () {
      final id = LeagueId.newId();

      expect(id.value, matches(RegExp(r'^[1-9][0-9]*$')));
    });

    test('throws on non-numeric', () {
      expect(
        () => LeagueId.fromString('abc'),
        throwsA(isA<FieldMustBeSimpleId>()),
      );
    });

    test('accepts numeric', () {
      final id = LeagueId.fromString('456');
      expect(id.value, '456');
    });
  });
}
