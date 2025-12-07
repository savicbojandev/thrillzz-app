import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/sports/entities/player.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/player_id.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/player_name.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/player_position.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/team_name.dart';

void main() {
  test('stores provided player data', () {
    const name = 'John Doe';
    const team = 'Sharks';
    const position = 'Forward';
    final player = Player(
      id: PlayerId.fromString('1'),
      name: PlayerName(name),
      team: TeamName(team),
      position: PlayerPosition(position),
    );

    expect(player.id.value, '1');
    expect(player.name.value, name);
    expect(player.team.value, team);
    expect(player.position.value, position);
  });
}
