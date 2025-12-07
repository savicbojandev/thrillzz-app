import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

abstract class GameDetailsRepository {
  Future<Result<Game, DomainError>> findGame(GameId id);
}
