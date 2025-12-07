import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/game_details/ports/game_details_repository.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class FakeGameDetailsRepository implements GameDetailsRepository {
  FakeGameDetailsRepository({
    Game? game,
  }) : _game = game;

  final Game? _game;

  @override
  Future<Result<Game, DomainError>> findGame(GameId id) async {
    if (_game == null) return Error(DomainError('Game not found'));
    return Success(_game!);
  }
}
