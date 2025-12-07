import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/game_dto.dart';

part 'league_dto.freezed.dart';
part 'league_dto.g.dart';

@freezed
class LeagueDto with _$LeagueDto {
  const factory LeagueDto({
    required String id,
    required String name,
    required String sportId,
    @Default([]) List<GameDto> games,
  }) = _LeagueDto;

  factory LeagueDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueDtoFromJson(json);
}

extension LeagueDtoX on LeagueDto {
  League toDomain() => League(
    id: LeagueId.fromString(id),
    name: LeagueName(name),
    sportId: SportId.fromString(sportId),
    games: games.map((game) => game.toDomain()).toList(growable: false),
  );
}
