class GameSearchFilters {
  const GameSearchFilters({
    this.teamNameQuery,
    this.startDate,
    this.endDate,
  });

  final String? teamNameQuery;
  final DateTime? startDate;
  final DateTime? endDate;

  bool get hasFilters =>
      (teamNameQuery ?? '').trim().isNotEmpty ||
      startDate != null ||
      endDate != null;

  String normalizedTeamNameQuery() => teamNameQuery?.trim().toLowerCase() ?? '';

  Map<String, dynamic> toJson() => <String, dynamic>{
    'teamName': teamNameQuery,
    'startDate': startDate?.toIso8601String(),
    'endDate': endDate?.toIso8601String(),
  };
}
