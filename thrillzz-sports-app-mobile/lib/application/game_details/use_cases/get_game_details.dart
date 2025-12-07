import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/application/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/game_details/ports/game_details_repository.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class GetGameDetails with IOUseCase<GameId, Future<Result<Game, DomainError>>> {
  const GetGameDetails(this._repository);

  final GameDetailsRepository _repository;

  @override
  Future<Result<Game, DomainError>> call(GameId id) async =>
      _repository.findGame(id);
}
