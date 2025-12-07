import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/sports/use_cases/search_games.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('SearchGames', () {
    final sport = buildSport(
      leagues: [
        buildLeague(
          games: [
            buildGame(homeTeam: 'Arsenal'),
            buildGame(
              id: secondGameId,
              homeTeam: 'Real Madrid',
              leagueId: defaultLeagueId,
            ),
          ],
        ),
      ],
    );

    test('filters by team name', () async {
      final repo = FakeSportsRepository(sports: [sport]);
      final useCase = SearchGames(repo);
      final resultsFuture = repo.matchesQueueStream.first;

      final result = await useCase(
        const GameSearchFilters(teamNameQuery: 'arsenal'),
      );

      expect(result.isSuccess(), isTrue);
      final results = await resultsFuture;
      expect(results, hasLength(1));
      final league = results.first.leagues.first;
      expect(league.games, hasLength(1));
      expect(league.games.first.homeTeam.value, 'Arsenal');
      expect(repo.searchCalls, 1);
    });

    test('returns all when query is empty', () async {
      final repo = FakeSportsRepository(sports: [sport]);
      final useCase = SearchGames(repo);
      final resultsFuture = repo.matchesQueueStream.first;

      final result = await useCase(const GameSearchFilters());

      expect(result.isSuccess(), isTrue);
      final results = await resultsFuture;
      expect(results, hasLength(1));
      expect(results.first.leagues.first.games, hasLength(2));
    });

    test('bubbles repository errors', () async {
      final repo = FakeSportsRepository(sports: [sport], throwOnSearch: 'fail');
      final useCase = SearchGames(repo);

      final result = await useCase(
        const GameSearchFilters(teamNameQuery: 'fail'),
      );

      expect(result.isError(), isTrue);
      expect(result.tryGetError()?.message, 'searchGames failed');
    });
  });
}
