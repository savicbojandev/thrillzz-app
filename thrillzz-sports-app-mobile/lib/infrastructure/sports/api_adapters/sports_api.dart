import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/api.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/infrastructure_const.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/sport_dto.dart';

class SportsApi {
  const SportsApi({required Api api}) : _api = api;

  final Api _api;

  Future<Result<List<Sport>, AppError>> fetchSports() async {
    final response = await _api.get(InfrastructureConst.getSports);

    return response.when(
      success: (data) {
        try {
          return Success(_parseSportsList(data['sports']));
        } catch (e) {
          return Error(AppError(message: 'Parsing error: $e'));
        }
      },
      message: (msg) => Error(AppError(message: msg)),
      error: Error.new,
    );
  }

  Future<Result<List<Sport>, AppError>> searchGames(
    GameSearchFilters filters,
  ) async {
    final response = await _api.get(
      InfrastructureConst.searchGames,
      queryParameters: filters.toJson()
        ..removeWhere((_, value) => value == null),
    );

    return response.when(
      success: (data) {
        try {
          return Success(_parseSportsList(data['sports']));
        } catch (e) {
          return Error(AppError(message: 'Parsing error: $e'));
        }
      },
      message: (msg) => Error(AppError(message: msg)),
      error: Error.new,
    );
  }

  List<Sport> _parseSportsList(dynamic sportsJson) {
    if (sportsJson is! List) {
      throw const FormatException('Invalid sports payload');
    }

    return sportsJson
        .map(
          (json) => SportDto.fromJson(json as Map<String, dynamic>).toDomain(),
        )
        .toList(growable: false);
  }
}
