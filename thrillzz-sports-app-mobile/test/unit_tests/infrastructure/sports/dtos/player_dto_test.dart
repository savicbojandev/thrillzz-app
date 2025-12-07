import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/player_dto.dart';

void main() {
  group('PlayerDto', () {
    test('maps to domain player', () {
      final dto = PlayerDto(
        id: '12',
        name: 'John',
        team: 'Home',
        position: 'Guard',
      );

      final player = dto.toDomain();

      expect(player.id.value, '12');
      expect(player.name.value, 'John');
      expect(player.team.value, 'Home');
      expect(player.position.value, 'Guard');
    });

    test('falls back to generated id when id is invalid', () {
      final dto = PlayerDto(
        id: 'abc',
        name: 'Jane',
        team: 'Away',
        position: 'Forward',
      );

      final player = dto.toDomain();

      expect(player.id.value, matches(RegExp(r'^[1-9][0-9]*$')));
      expect(player.id.value, isNot(dto.id));
    });
  });
}
