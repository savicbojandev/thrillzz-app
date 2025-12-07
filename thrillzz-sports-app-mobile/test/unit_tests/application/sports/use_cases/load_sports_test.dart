import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/sports/use_cases/load_sports.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('LoadSports', () {
    test('delegates to repository', () async {
      final repo = FakeSportsRepository(sports: [buildSport()]);
      final useCase = LoadSports(repo);

      final result = await useCase();

      expect(result.tryGetSuccess(), hasLength(1));
      expect(repo.getAllCalls, 1);
    });
  });
}
