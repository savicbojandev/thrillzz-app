import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/game_dto.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/league_dto.dart';

void main() {
  test('LeagueDto maps nested games to domain', () {
    final dto = LeagueDto(
      id: '10',
      name: 'Premier',
      sportId: '1',
      games: [
        GameDto(
          id: '100',
          sportId: '1',
          leagueId: '10',
          homeTeam: 'Home',
          awayTeam: 'Away',
          date: DateTime.utc(2025, 1, 1),
        ),
      ],
    );

    final league = dto.toDomain();

    expect(league.id.value, '10');
    expect(league.sportId.value, '1');
    expect(league.games.single.id.value, '100');
  });
}
