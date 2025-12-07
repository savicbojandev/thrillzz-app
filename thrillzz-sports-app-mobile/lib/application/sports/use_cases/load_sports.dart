import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/application/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class LoadSports with UseCase<Future<Result<List<Sport>, DomainError>>> {
  const LoadSports(this.repository);

  final SportsRepository repository;

  @override
  Future<Result<List<Sport>, DomainError>> call() => repository.getAllSports();
}
