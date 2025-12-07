import 'package:thrillzz_sports_app/application/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class GameSearchForm extends Form {
  const GameSearchForm({
    this.teamNameQuery = '',
    this.startDate,
    this.endDate,
  });

  final String teamNameQuery;
  final DateTime? startDate;
  final DateTime? endDate;

  GameSearchForm copyWith({
    String? teamNameQuery,
    DateTime? startDate,
    DateTime? endDate,
  }) => GameSearchForm(
    teamNameQuery: teamNameQuery ?? this.teamNameQuery,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
  );

  GameSearchFilters toFilters() => GameSearchFilters(
    teamNameQuery: teamNameQuery,
    startDate: startDate,
    endDate: endDate,
  );

  bool get hasFilters => toFilters().hasFilters;

  @override
  List<Object?> get props => [teamNameQuery, startDate, endDate];
}
