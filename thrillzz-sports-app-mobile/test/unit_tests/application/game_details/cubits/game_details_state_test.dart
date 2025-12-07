import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/game_details/cubits/game_details_state.dart';

import '../../../../helpers/constants/sample_data.dart';

void main() {
  group('GameDetailsState', () {
    test('copyWith updates fields and clears error by default', () {
      final game = buildGame();
      const error = 'Something went wrong';
      final state = GameDetailsState(
        game: game,
        loading: true,
        error: error,
      );

      final updated = state.copyWith(loading: false);

      expect(updated.game, game);
      expect(updated.loading, isFalse);
      expect(updated.error, isNull);
    });

    test('props include game, loading and error', () {
      final game = buildGame();
      const error = 'Failed';
      final state = GameDetailsState(
        game: game,
        loading: true,
        error: error,
      );

      expect(state.props, [game, true, error]);
    });
  });
}
