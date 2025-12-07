import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/game_details/use_cases/get_game_details.dart';
import 'package:thrillzz_sports_app/domain/sports/errors/game_not_found.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('GetGameDetails', () {
    test('returns game when found', () async {
      final game = buildGame();
      final repo = FakeGameDetailsRepository(game: game);
      final useCase = GetGameDetails(repo);

      final result = await useCase(game.id);

      expect(result.isSuccess(), isTrue);
      expect(result.tryGetSuccess()!.id, game.id);
    });

    test('returns error when missing', () async {
      final repo = FakeGameDetailsRepository();
      final useCase = GetGameDetails(repo);

      final result = await useCase(secondGameId);
      expect(result.isError(), isTrue);
      expect(result.tryGetError()?.message, 'Game not found');
    });
  });
}
