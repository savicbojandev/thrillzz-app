import 'dart:developer' as logger;

import 'package:thrillzz_sports_app/core/logging/logging.dart';

class DeveloperLogService extends LogService {
  @override
  void log(
    String message, {
    required LogLevel level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final levelPrefix = switch (level) {
      LogLevel.debug => '[DEBUG] ',
      LogLevel.info => '[INFO] ',
      LogLevel.warning => '[WARN] ',
      LogLevel.error => '[ERROR] ',
    };

    logger.log(
      '$levelPrefix$message',
      level: _mapLevel(level),
      error: error,
      stackTrace: stackTrace,
      name: 'ThrillzzSportsApp',
    );
  }

  int _mapLevel(LogLevel level) => switch (level) {
    LogLevel.debug => 500,
    LogLevel.info => 800,
    LogLevel.warning => 900,
    LogLevel.error => 1000,
  };
}
