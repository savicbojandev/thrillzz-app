import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/application/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class SearchGames
    with
        IOUseCase<GameSearchFilters, Future<Result<List<Sport>, DomainError>>> {
  const SearchGames(this.repository);

  final SportsRepository repository;

  @override
  Future<Result<List<Sport>, DomainError>> call(GameSearchFilters input) =>
      repository.searchGames(input);
}
