import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/game_dto.dart';

void main() {
  test('GameDto converts to domain model with players', () {
    final dto = GameDto.fromJson({
      'id': '100',
      'sportId': '1',
      'leagueId': '10',
      'homeTeam': 'Home',
      'awayTeam': 'Away',
      'date': '2025-01-01T00:00:00.000Z',
      'venue': 'Arena',
      'players': const [
        {
          'id': '200',
          'name': 'Player 1',
          'team': 'Home',
          'position': 'Forward',
        },
      ],
    });

    final game = dto.toDomain();

    expect(game.id.value, '100');
    expect(game.sportId.value, '1');
    expect(game.leagueId.value, '10');
    expect(game.venue, 'Arena');
    expect(game.players.single.name.value, 'Player 1');
  });
}
