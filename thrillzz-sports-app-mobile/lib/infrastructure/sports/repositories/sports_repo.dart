import 'dart:async';
import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/api_adapters/sports_api.dart';

class SportsRepo implements SportsRepository {
  factory SportsRepo.seeded(SportsApi sportsApi) {
    return SportsRepo._(sportsApi);
  }

  SportsRepo._(this._sportsApi);

  final SportsApi _sportsApi;

  final _matchesQueueController = StreamController<List<Sport>>.broadcast();

  @override
  Stream<List<Sport>> get matchesQueueStream => _matchesQueueController.stream;

  @override
  Future<Result<List<Sport>, DomainError>> getAllSports() async {
    final result = await _sportsApi.fetchSports();

    return result.when(
      (sports) {
        return Success(sports);
      },
      (error) {
        return Error(_mapError(error));
      },
    );
  }

  @override
  Future<Result<List<Sport>, DomainError>> searchGames(
    GameSearchFilters filters,
  ) async {
    final result = await _sportsApi.searchGames(filters);
    return result.when(
      (sports) {
        _matchesQueueController.add(sports);
        return Success(sports);
      },
      (error) {
        return Error(_mapError(error));
      },
    );
  }

  DomainError _mapError(AppError error) => DomainError(error.message);
}
