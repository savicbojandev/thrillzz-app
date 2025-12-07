import 'package:thrillzz_sports_app/core/logging/models/log_level.dart';

abstract class LogService {
  void log(
    String message, {
    required LogLevel level,
    Object? error,
    StackTrace? stackTrace,
  });

  void debug(String message) => log(message, level: LogLevel.debug);

  void info(String message) => log(message, level: LogLevel.info);

  void warn(String message) => log(message, level: LogLevel.warning);

  void error(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) => log(
    message,
    level: LogLevel.error,
    error: error,
    stackTrace: stackTrace,
  );
}
