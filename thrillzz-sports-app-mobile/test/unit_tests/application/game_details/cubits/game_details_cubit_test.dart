import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/game_details/cubits/game_details_cubit.dart';
import 'package:thrillzz_sports_app/application/game_details/cubits/game_details_state.dart';
import 'package:thrillzz_sports_app/application/game_details/use_cases/get_game_details.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('GameDetailsCubit', () {
    test('emits game when load succeeds', () async {
      final game = buildGame();
      final cubit = GameDetailsCubit(
        GetGameDetails(
          FakeGameDetailsRepository(game: game),
        ),
      );

      expectLater(
        cubit.stream,
        emitsInOrder([
          isA<GameDetailsState>().having((s) => s.loading, 'loading', true),
          isA<GameDetailsState>()
              .having((s) => s.game, 'game', game)
              .having((s) => s.loading, 'loading', false)
              .having((s) => s.error, 'error', isNull),
        ]),
      );

      await cubit.load(game.id);
    });

    test('emits error when load fails', () async {
      final cubit = GameDetailsCubit(
        GetGameDetails(
          FakeGameDetailsRepository(),
        ),
      );

      expectLater(
        cubit.stream,
        emitsThrough(
          isA<GameDetailsState>()
              .having((s) => s.error, 'error', 'Game not found')
              .having((s) => s.loading, 'loading', false),
        ),
      );

      await cubit.load(secondGameId);
    });
  });
}
