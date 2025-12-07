import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/game_details/ports/game_details_repository.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/game_details/api_adapters/game_details_api.dart';

class GameDetailsRepo implements GameDetailsRepository {
  GameDetailsRepo({
    required GameDetailsApi api,
  }) : _api = api;

  final GameDetailsApi _api;

  @override
  Future<Result<Game, DomainError>> findGame(GameId id) async {
    final result = await _api.fetchGame(id);
    return result.when(
      Success.new,
      (error) => Error(DomainError(error.message)),
    );
  }
}
