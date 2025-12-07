import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/player_dto.dart';

part 'game_dto.freezed.dart';
part 'game_dto.g.dart';

@freezed
class GameDto with _$GameDto {
  const factory GameDto({
    required String id,
    required String sportId,
    required String leagueId,
    required String homeTeam,
    required String awayTeam,
    required DateTime date,
    String? venue,
    @Default([]) List<PlayerDto> players,
  }) = _GameDto;

  factory GameDto.fromJson(Map<String, dynamic> json) =>
      _$GameDtoFromJson(json);
}

extension GameDtoX on GameDto {
  Game toDomain() => Game(
    id: GameId.fromString(id),
    sportId: SportId.fromString(sportId),
    leagueId: LeagueId.fromString(leagueId),
    homeTeam: TeamName(homeTeam),
    awayTeam: TeamName(awayTeam),
    date: GameDate(date),
    venue: venue,
    players: players
        .map((player) => player.toDomain())
        .toList(
          growable: false,
        ),
  );
}
