import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/error_type.dart';

void main() {
  group('AppError', () {
    test('exposes the error through asResult', () {
      final error = AppError(
        message: 'Network failed',
        type: ErrorType.connectionError,
      );

      final result = error.asResult;

      expect(result.tryGetError(), error);
    });

    test('toString returns message', () {
      final error = AppError(message: 'boom');

      expect(error.toString(), 'boom');
    });
  });
}
