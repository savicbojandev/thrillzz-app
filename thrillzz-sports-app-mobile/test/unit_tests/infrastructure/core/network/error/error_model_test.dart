import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/error_model.dart';

void main() {
  group('ErrorModel', () {
    test('serializes and deserializes error message', () {
      const json = {'error_message': 'Invalid request'};

      final model = ErrorModel.fromJson(json);

      expect(model.errorMessage, 'Invalid request');
      expect(model.toJson(), json);
    });

    test('copyWith overrides message', () {
      final model = ErrorModel(errorMessage: 'first');

      final updated = model.copyWith(errorMessage: 'second');

      expect(updated.errorMessage, 'second');
    });
  });
}
