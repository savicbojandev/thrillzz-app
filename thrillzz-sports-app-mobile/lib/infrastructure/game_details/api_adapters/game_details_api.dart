import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/api.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/infrastructure_const.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/game_dto.dart';

class GameDetailsApi {
  const GameDetailsApi({required Api api}) : _api = api;

  final Api _api;

  Future<Result<Game, AppError>> fetchGame(GameId id) async {
    try {
      final response = await _api.get(
        '${InfrastructureConst.games}/${id.value}',
      );
      return response.when(
        success: (data) {
          try {
            return Success(
              GameDto.fromJson(data['game'] as Map<String, dynamic>).toDomain(),
            );
          } catch (e) {
            return Error(AppError(message: 'Parsing error: $e'));
          }
        },
        message: (msg) => Error(AppError(message: msg)),
        error: Error.new,
      );
    } on Exception catch (e) {
      return Error(AppError(message: e.toString()));
    }
  }
}
