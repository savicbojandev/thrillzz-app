import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/error_type.dart';

class AppError {
  AppError({required this.message, this.type = ErrorType.unknown});

  final String message;
  final ErrorType type;

  Result<dynamic, AppError> get asResult => Result.error(this);

  @override
  String toString() => message;
}
