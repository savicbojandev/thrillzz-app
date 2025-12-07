import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

abstract class SportsRepository {
  Future<Result<List<Sport>, DomainError>> getAllSports();

  Future<Result<List<Sport>, DomainError>> searchGames(
    GameSearchFilters filters,
  );

  Stream<List<Sport>> get matchesQueueStream;
}
