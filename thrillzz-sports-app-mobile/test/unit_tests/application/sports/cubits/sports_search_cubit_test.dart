import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/sports/sports.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('SportsSearchCubit', () {
    test('runs search by name and populates results', () async {
      final repo = FakeSportsRepository(sports: [buildSport()]);
      final cubit = SportsSearchCubit(SearchGames(repo))
        ..updateNameQuery('Team A', debounce: Duration.zero);

      final state = await cubit.stream.firstWhere(
        (s) => s.results.isNotEmpty && !s.loading,
      );

      final games = state.results.first.leagues.first.games;
      expect(games.first.homeTeam.value, 'Team A');
    });

    test('runs search on start date change', () async {
      final repo = FakeSportsRepository(sports: [buildSport()]);
      final cubit = SportsSearchCubit(SearchGames(repo));

      final stateFuture = cubit.stream.firstWhere(
        (s) => s.loading == false && s.results.isNotEmpty,
      );

      await cubit.updateStartDate(DateTime.utc(2025, 1, 1));

      final state = await stateFuture;
      expect(state.results.first.leagues.first.games, isNotEmpty);
    });

    test('runs search on end date change', () async {
      final repo = FakeSportsRepository(sports: [buildSport()]);
      final cubit = SportsSearchCubit(SearchGames(repo));

      final stateFuture = cubit.stream.firstWhere(
        (s) => s.loading == false && s.results.isNotEmpty,
      );

      cubit.updateEndDate(DateTime.utc(2025, 12, 31));

      final state = await stateFuture;
      expect(state.results.first.leagues.first.games, isNotEmpty);
    });

    test('captures errors from repository', () async {
      final repo = FakeSportsRepository(
        sports: [buildSport()],
        throwOnSearch: 'fail',
      );
      final cubit = SportsSearchCubit(SearchGames(repo))
        ..updateNameQuery('fail', debounce: Duration.zero);

      final state = await cubit.stream.firstWhere((s) => s.error != null);

      expect(state.loading, isFalse);
      expect(state.error, isNotNull);
    });
  });
}
