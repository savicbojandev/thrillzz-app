import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/api.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/network_response.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/api_adapters/sports_api.dart';

class _MockApi extends Mock implements Api {}

void main() {
  setUpAll(() {
    registerFallbackValue('');
  });

  group('SportsApi', () {
    late _MockApi api;
    late SportsApi sportsApi;

    setUp(() {
      api = _MockApi();
      sportsApi = SportsApi(api: api);
    });

    const sportsJson = [
      {
        'id': '1',
        'name': 'Soccer',
        'leagues': [
          {
            'id': '10',
            'name': 'Premier',
            'sportId': '1',
            'games': [
              {
                'id': '100',
                'sportId': '1',
                'leagueId': '10',
                'homeTeam': 'A',
                'awayTeam': 'B',
                'date': '2025-01-01T00:00:00.000Z',
                'players': [],
              }
            ],
          }
        ],
      },
    ];

    test('fetchSports parses response into domain models', () async {
      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => const NetworkResponse.success({'sports': sportsJson}),
      );

      final result = await sportsApi.fetchSports();

      final sports = result.tryGetSuccess();
      expect(sports, isNotNull);
      expect(sports!.single.id.value, '1');
      expect(sports.single.leagues.single.games.single.homeTeam.value, 'A');
    });

    test('fetchSports returns AppError on parsing failure', () async {
      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => const NetworkResponse.success({'sports': 'invalid'}),
      );

      final result = await sportsApi.fetchSports();

      expect(result.tryGetError()?.message, startsWith('Parsing error'));
    });

    test('handles message and error responses', () async {
      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => const NetworkResponse.message('oops'),
      );

      final messageResult = await sportsApi.fetchSports();
      expect(messageResult.tryGetError()?.message, 'oops');

      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => NetworkResponse.error(AppError(message: 'boom')),
      );

      final errorResult = await sportsApi.fetchSports();
      expect(errorResult.tryGetError()?.message, 'boom');
    });

    test('searchGames sends filters without nulls', () async {
      when(() => api.get(any(),
          queryParameters: any(named: 'queryParameters'))).thenAnswer(
        (_) async => const NetworkResponse.success({'sports': sportsJson}),
      );

      final filters = GameSearchFilters(
        teamNameQuery: 'Team X',
        startDate: DateTime.utc(2025, 1, 1),
      );

      final result = await sportsApi.searchGames(filters);

      final sports = result.tryGetSuccess();
      expect(sports, isNotNull);

      verify(
        () => api.get(
          any(),
          queryParameters: {
            'teamName': 'Team X',
            'startDate': filters.startDate!.toIso8601String(),
          },
        ),
      ).called(1);
    });
  });
}
