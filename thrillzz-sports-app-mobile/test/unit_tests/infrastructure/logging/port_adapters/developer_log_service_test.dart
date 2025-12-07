import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/core/logging/logging.dart';
import 'package:thrillzz_sports_app/infrastructure/logging/port_adapters/developer_log_service.dart';

void main() {
  test('logs all levels without throwing', () {
    final service = DeveloperLogService();

    for (final level in LogLevel.values) {
      expect(
        () => service.log('message for $level', level: level),
        returnsNormally,
      );
    }
  });
}
