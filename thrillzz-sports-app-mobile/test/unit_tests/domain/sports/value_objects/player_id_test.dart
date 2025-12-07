import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/player_id.dart';

void main() {
  group('PlayerId', () {
    test('throws on empty', () {
      expect(() => PlayerId.fromString(''), throwsA(isA<PlayerIdEmpty>()));
    });

    test('throws on non-numeric', () {
      expect(
        () => PlayerId.fromString('abc'),
        throwsA(isA<FieldMustBeSimpleId>()),
      );
    });

    test('accepts numeric', () {
      final id = PlayerId.fromString('99');
      expect(id.value, '99');
    });

    test('generates numeric id on newId', () {
      final id = PlayerId.newId();

      expect(id.value, matches(RegExp(r'^[1-9][0-9]*$')));
    });
  });
}
