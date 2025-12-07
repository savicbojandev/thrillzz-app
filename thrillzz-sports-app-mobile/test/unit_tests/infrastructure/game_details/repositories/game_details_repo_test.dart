import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/game_details/api_adapters/game_details_api.dart';
import 'package:thrillzz_sports_app/infrastructure/game_details/repositories/game_details_repo.dart';

import '../../../../helpers/constants/sample_data.dart';

class _MockGameDetailsApi extends Mock implements GameDetailsApi {}

void main() {
  setUpAll(() {
    registerFallbackValue(GameId.fromString('1'));
  });

  group('GameDetailsRepo', () {
    late _MockGameDetailsApi api;
    late GameDetailsRepo repo;

    setUp(() {
      api = _MockGameDetailsApi();
      repo = GameDetailsRepo(api: api);
    });

    test('returns domain game when api succeeds', () async {
      final game = buildGame();
      when(() => api.fetchGame(any())).thenAnswer((_) async => Success(game));

      final result = await repo.findGame(GameId.fromString('1'));

      expect(result.tryGetSuccess(), game);
    });

    test('maps api error to DomainError', () async {
      when(() => api.fetchGame(any()))
          .thenAnswer((_) async => Error(AppError(message: 'boom')));

      final result = await repo.findGame(GameId.fromString('1'));

      expect(result.tryGetError()?.message, 'boom');
    });
  });
}
