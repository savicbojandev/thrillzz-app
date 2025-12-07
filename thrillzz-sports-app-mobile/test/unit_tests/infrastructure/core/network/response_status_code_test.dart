import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/error_type.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/response_status_code.dart';

void main() {
  test('fromCode finds matching enum or returns null', () {
    expect(ResponseStatusCode.fromCode(200), ResponseStatusCode.ok);
    expect(ResponseStatusCode.fromCode(503), ResponseStatusCode.serviceUnavailable);
    expect(ResponseStatusCode.fromCode(999), isNull);
  });

  test('asAppError maps status codes to app errors', () {
    final expectedTypes = <ResponseStatusCode, ErrorType>{
      ResponseStatusCode.badRequest: ErrorType.badRequest,
      ResponseStatusCode.unauthorized: ErrorType.unauthorized,
      ResponseStatusCode.forbidden: ErrorType.forbidden,
      ResponseStatusCode.notFound: ErrorType.notFound,
      ResponseStatusCode.internalServerError: ErrorType.internalServerError,
    };

    for (final code in ResponseStatusCode.values) {
      final error = code.asAppError;
      final expectedType = expectedTypes[code] ?? ErrorType.unknown;

      expect(error.type, expectedType);
      expect(error.message, isNotEmpty);
    }

    expect((null as ResponseStatusCode?).asAppError.message, 'Unknown error');
  });
}
