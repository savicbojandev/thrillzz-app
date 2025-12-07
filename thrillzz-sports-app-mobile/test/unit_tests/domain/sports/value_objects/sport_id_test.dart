import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/sport_id.dart';

void main() {
  group('SportId', () {
    test('throws on empty', () {
      expect(() => SportId.fromString(''), throwsA(isA<SportIdEmpty>()));
    });

    test('generates numeric id on newId', () {
      final id = SportId.newId();

      expect(id.value, matches(RegExp(r'^[1-9][0-9]*$')));
    });

    test('throws on non-numeric', () {
      expect(
        () => SportId.fromString('abc'),
        throwsA(isA<FieldMustBeSimpleId>()),
      );
    });

    test('accepts numeric', () {
      final id = SportId.fromString('789');
      expect(id.value, '789');
    });
  });
}
