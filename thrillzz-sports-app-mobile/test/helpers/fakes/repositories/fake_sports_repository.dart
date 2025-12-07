import 'dart:async';

import 'package:multiple_result/multiple_result.dart';
import 'package:thrillzz_sports_app/domain/shared/shared.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class FakeSportsRepository implements SportsRepository {
  FakeSportsRepository({
    List<Sport>? sports,
    this.throwOnSearch,
    this.throwOnId,
    this.throwOnGetAll = false,
  }) : _sports = sports ?? const [];

  final List<Sport> _sports;
  final String? throwOnSearch;
  final String? throwOnId;
  final bool throwOnGetAll;
  final _matchesQueueController = StreamController<List<Sport>>.broadcast();

  int getAllCalls = 0;
  int searchCalls = 0;
  int findCalls = 0;

  @override
  Future<Result<List<Sport>, DomainError>> getAllSports() async {
    getAllCalls++;
    if (throwOnGetAll) return Error(DomainError('getAllSports failed'));
    return Success(_sports);
  }

  @override
  Future<Result<List<Sport>, DomainError>> searchGames(
    GameSearchFilters filters,
  ) async {
    searchCalls++;
    if (throwOnSearch != null &&
        filters.normalizedTeamNameQuery() == throwOnSearch) {
      return Error(DomainError('searchGames failed'));
    }

    var games = _allGames;
    if (filters.startDate != null) {
      games = games.where((g) => !g.date.value.isBefore(filters.startDate!));
    }
    if (filters.endDate != null) {
      games = games.where((g) => !g.date.value.isAfter(filters.endDate!));
    }
    final nameQuery = filters.normalizedTeamNameQuery();
    if (nameQuery.isNotEmpty) {
      final leaguesById = Map<LeagueId, League>.fromEntries(
        _sports
            .expand((s) => s.leagues)
            .map(
              (league) => MapEntry(league.id, league),
            ),
      );
      games = games.where(
        (g) =>
            g.title.toLowerCase().contains(nameQuery) ||
            g.homeTeam.value.toLowerCase().contains(nameQuery) ||
            g.awayTeam.value.toLowerCase().contains(nameQuery) ||
            (leaguesById[g.leagueId]?.name.value.toLowerCase().contains(
                  nameQuery,
                ) ??
                false),
      );
    }
    final sportsWithMatches = _sports
        .map(
          (sport) => Sport(
            id: sport.id,
            name: sport.name,
            leagues: sport.leagues
                .map(
                  (league) {
                    final leagueGames = games
                        .where((g) => g.leagueId == league.id)
                        .toList(growable: false);
                    if (leagueGames.isEmpty) {
                      return null;
                    }
                    return League(
                      id: league.id,
                      name: league.name,
                      sportId: league.sportId,
                      games: leagueGames,
                    );
                  },
                )
                .whereType<League>()
                .toList(growable: false),
          ),
        )
        .where((sport) => sport.leagues.isNotEmpty)
        .toList(growable: false);

    _matchesQueueController.add(sportsWithMatches);
    return Success(sportsWithMatches);
  }

  @override
  Stream<List<Sport>> get matchesQueueStream => _matchesQueueController.stream;

  Iterable<Game> get _allGames sync* {
    for (final sport in _sports) {
      for (final league in sport.leagues) {
        for (final game in league.games) {
          yield game;
        }
      }
    }
  }
}
