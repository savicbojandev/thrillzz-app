import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/league_dto.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/sport_dto.dart';

void main() {
  test('SportDto maps leagues to domain', () {
    final dto = SportDto(
      id: '1',
      name: 'Soccer',
      leagues: [
        LeagueDto(
          id: '10',
          name: 'Premier',
          sportId: '1',
        ),
      ],
    );

    final sport = dto.toDomain();

    expect(sport.id.value, '1');
    expect(sport.name.value, 'Soccer');
    expect(sport.leagues.single.id.value, '10');
  });
}
