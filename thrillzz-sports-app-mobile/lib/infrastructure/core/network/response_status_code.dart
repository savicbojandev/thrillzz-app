import 'package:collection/collection.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/error_type.dart';

enum ResponseStatusCode {
  ok(200),
  created(201),
  accepted(202),
  noContent(204),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  methodNotAllowed(405),
  notAcceptable(406),
  conflict(409),
  preconditionFailed(412),
  tooManyRequests(429),
  internalServerError(500),
  serviceUnavailable(503),
  gatewayTimeout(504)
  ;

  const ResponseStatusCode(this.code);

  final int code;

  static ResponseStatusCode? fromCode(int code) =>
      ResponseStatusCode.values.firstWhereOrNull(
        (element) => element.code == code,
      );
}

extension ResponseCodeAppErrorExtension on ResponseStatusCode? {
  AppError get asAppError {
    switch (this) {
      case ResponseStatusCode.badRequest:
        return AppError(message: 'Bad request', type: ErrorType.badRequest);
      case ResponseStatusCode.unauthorized:
        return AppError(message: 'Unauthorized', type: ErrorType.unauthorized);

      case ResponseStatusCode.forbidden:
        return AppError(message: 'Forbidden', type: ErrorType.forbidden);

      case ResponseStatusCode.notFound:
        return AppError(message: 'Not found', type: ErrorType.notFound);

      case ResponseStatusCode.internalServerError:
        return AppError(
          message: 'Internal server error',
          type: ErrorType.internalServerError,
        );
      case ResponseStatusCode.ok:
      case ResponseStatusCode.created:
      case ResponseStatusCode.accepted:
      case ResponseStatusCode.noContent:
      case ResponseStatusCode.methodNotAllowed:
      case ResponseStatusCode.notAcceptable:
      case ResponseStatusCode.conflict:
      case ResponseStatusCode.preconditionFailed:
      case ResponseStatusCode.tooManyRequests:
      case ResponseStatusCode.serviceUnavailable:
      case ResponseStatusCode.gatewayTimeout:
      case null:
        return AppError(message: 'Unknown error');
    }
  }
}
