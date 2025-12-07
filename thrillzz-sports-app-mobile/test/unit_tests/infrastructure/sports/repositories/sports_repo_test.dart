import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/api_adapters/sports_api.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/repositories/sports_repo.dart';

import '../../../../helpers/constants/sample_data.dart';

class _MockSportsApi extends Mock implements SportsApi {}

void main() {
  setUpAll(() {
    registerFallbackValue(const GameSearchFilters());
  });

  group('SportsRepo', () {
    late _MockSportsApi api;
    late SportsRepo repo;

    setUp(() {
      api = _MockSportsApi();
      repo = SportsRepo.seeded(api);
    });

    test('maps api success to domain result', () async {
      final sports = [buildSport()];
      when(() => api.fetchSports()).thenAnswer((_) async => Success(sports));

      final result = await repo.getAllSports();

      expect(result.tryGetSuccess(), sports);
    });

    test('maps api errors to DomainError', () async {
      when(() => api.fetchSports())
          .thenAnswer((_) async => Error(AppError(message: 'api boom')));

      final result = await repo.getAllSports();

      expect(result.tryGetError(), isA<DomainError>());
      expect(result.tryGetError()?.message, 'api boom');
    });

    test('searchGames pushes results to stream and returns Success', () async {
      final sports = [buildSport()];
      when(() => api.searchGames(any()))
          .thenAnswer((_) async => Success(sports));

      final streamFuture = repo.matchesQueueStream.first;
      final result = await repo.searchGames(
        const GameSearchFilters(teamNameQuery: 'team'),
      );

      expect(result.tryGetSuccess(), sports);
      expect(await streamFuture, sports);
    });

    test('searchGames maps api error', () async {
      when(() => api.searchGames(any()))
          .thenAnswer((_) async => Error(AppError(message: 'error')));

      final result = await repo.searchGames(
        const GameSearchFilters(teamNameQuery: 'team'),
      );

      expect(result.tryGetError()?.message, 'error');
    });
  });
}
