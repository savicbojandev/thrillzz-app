import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/sports/sports.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('SportsCubit', () {
    test('loads sports on bootstrap', () async {
      final repo = FakeSportsRepository(
        sports: [buildSport()],
      );
      final cubit = SportsCubit(
        LoadSports(repo),
      );

      final state =
          await cubit.stream.firstWhere((s) => s is SportsLoaded)
              as SportsLoaded;

      expect(state.sports, isNotEmpty);
      expect(state.sports.first.leagues, isNotEmpty);
    });

    test('updates sports when search results stream arrives', () async {
      final repo = FakeSportsRepository(
        sports: [
          buildSport(
            leagues: [
              buildLeague(
                id: defaultLeagueId,
                games: [buildGame(id: firstGameId, leagueId: defaultLeagueId)],
              ),
              buildLeague(
                id: secondaryLeagueId,
                games: [
                  buildGame(
                    id: secondGameId,
                    leagueId: secondaryLeagueId,
                    homeTeam: 'Madrid',
                  ),
                ],
              ),
            ],
          ),
        ],
      );
      final cubit = SportsCubit(
        LoadSports(repo),
      );

      await cubit.stream.firstWhere((s) => s is SportsLoaded);
      final nextState = cubit.stream.firstWhere(
        (s) =>
            s is SportsLoaded &&
            s.sports.first.leagues.single.games.single.id == secondGameId,
      );
      await repo.searchGames(const GameSearchFilters(teamNameQuery: 'Madrid'));
      final state = (await nextState) as SportsLoaded;

      expect(state.sports, hasLength(1));
      final league = state.sports.first.leagues.single;
      expect(league.games.single.id, secondGameId);
    });

    test('emits error when repo fails', () async {
      final repo = FakeSportsRepository(
        throwOnGetAll: true,
      );
      final cubit = SportsCubit(LoadSports(repo));

      final state = await cubit.stream.firstWhere((s) => s is SportsError)
          as SportsError;

      expect(state.message, 'getAllSports failed');
    });

    test('emits error when no sports', () async {
      final repo = FakeSportsRepository(sports: const []);
      final cubit = SportsCubit(LoadSports(repo));

      final state = await cubit.stream.firstWhere((s) => s is SportsError)
          as SportsError;

      expect(state.message, 'No sports available');
    });

    test('emits error when first sport has no leagues', () async {
      final repo = FakeSportsRepository(
        sports: [
          buildSport(leagues: const []),
        ],
      );
      final cubit = SportsCubit(LoadSports(repo));

      final state = await cubit.stream.firstWhere((s) => s is SportsError)
          as SportsError;

      expect(state.message, 'No leagues available');
    });
  });

  group('SportsState', () {
    test('SportsError exposes message in props', () {
      final state = SportsError('boom', sports: [buildSport()]);

      expect(state.props.contains('boom'), isTrue);
    });

    test('SportsLoaded copyWith replaces sports', () {
      final initial = SportsLoaded(sports: [buildSport()]);
      final replacement = buildSport(name: 'Football');

      final updated = initial.copyWith(sports: [replacement]);

      expect(updated.sports.single.name.value, 'Football');
      expect(initial.sports.single.name.value, isNot('Football'));
    });
  });
}
