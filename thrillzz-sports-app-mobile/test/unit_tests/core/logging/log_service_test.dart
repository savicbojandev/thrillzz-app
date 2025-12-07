import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/core/logging/logging.dart';

class _FakeLogService extends LogService {
  int calls = 0;
  String? lastMessage;
  LogLevel? lastLevel;
  Object? lastError;
  StackTrace? lastStackTrace;

  @override
  void log(
    String message, {
    required LogLevel level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    calls++;
    lastMessage = message;
    lastLevel = level;
    lastError = error;
    lastStackTrace = stackTrace;
  }
}

void main() {
  group('LogService convenience methods', () {
    test('debug/info/warn call log with correct level', () {
      final fake = _FakeLogService();

      fake.debug('d');
      expect(fake.calls, 1);
      expect(fake.lastLevel, LogLevel.debug);

      fake.info('i');
      expect(fake.calls, 2);
      expect(fake.lastLevel, LogLevel.info);

      fake.warn('w');
      expect(fake.calls, 3);
      expect(fake.lastLevel, LogLevel.warning);
    });

    test('error forwards message, error, and stack trace', () {
      final fake = _FakeLogService();
      final err = Exception('boom');
      final stack = StackTrace.current;

      fake.error('e', err, stack);

      expect(fake.calls, 1);
      expect(fake.lastLevel, LogLevel.error);
      expect(fake.lastMessage, 'e');
      expect(fake.lastError, err);
      expect(fake.lastStackTrace, stack);
    });
  });
}
