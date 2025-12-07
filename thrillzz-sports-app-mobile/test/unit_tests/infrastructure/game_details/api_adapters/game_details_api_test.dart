import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/api.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/network_response.dart';
import 'package:thrillzz_sports_app/infrastructure/game_details/api_adapters/game_details_api.dart';

class _MockApi extends Mock implements Api {}

void main() {
  setUpAll(() {
    registerFallbackValue('');
  });

  group('GameDetailsApi', () {
    late _MockApi api;
    late GameDetailsApi gameDetailsApi;

    setUp(() {
      api = _MockApi();
      gameDetailsApi = GameDetailsApi(api: api);
    });

    final gameJson = {
      'id': '10',
      'sportId': '1',
      'leagueId': '2',
      'homeTeam': 'Home',
      'awayTeam': 'Away',
      'date': DateTime.utc(2025, 1, 1).toIso8601String(),
      'venue': 'Arena',
      'players': [],
    };

    test('returns parsed game when response is successful', () async {
      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => NetworkResponse.success({'game': gameJson}),
      );

      final result = await gameDetailsApi.fetchGame(GameId.fromString('10'));

      final game = result.tryGetSuccess();
      expect(game?.id.value, '10');
      expect(game?.venue, 'Arena');
    });

    test('returns parsing error when payload invalid', () async {
      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => NetworkResponse.success({'game': 'oops'}),
      );

      final result = await gameDetailsApi.fetchGame(GameId.fromString('11'));

      expect(
        result.tryGetError()?.message,
        startsWith('Parsing error:'),
      );
    });

    test('returns message or error variants as AppError', () async {
      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => const NetworkResponse.message('not found'),
      );

      final messageResult = await gameDetailsApi.fetchGame(GameId.fromString('1'));
      expect(messageResult.tryGetError()?.message, 'not found');

      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer(
        (_) async => NetworkResponse.error(AppError(message: 'api error')),
      );

      final errorResult = await gameDetailsApi.fetchGame(GameId.fromString('1'));
      expect(errorResult.tryGetError()?.message, 'api error');
    });

    test('wraps thrown exceptions into AppError', () async {
      when(() => api.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(Exception('network down'));

      final result = await gameDetailsApi.fetchGame(GameId.fromString('3'));

      expect(result.tryGetError()?.message, contains('network down'));
    });
  });
}
