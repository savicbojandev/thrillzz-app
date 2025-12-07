import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/dtos/league_dto.dart';

part 'sport_dto.freezed.dart';
part 'sport_dto.g.dart';

@freezed
class SportDto with _$SportDto {
  const factory SportDto({
    required String id,
    required String name,
    @Default([]) List<LeagueDto> leagues,
  }) = _SportDto;

  factory SportDto.fromJson(Map<String, dynamic> json) =>
      _$SportDtoFromJson(json);
}

extension SportDtoX on SportDto {
  Sport toDomain() => Sport(
    id: SportId.fromString(id),
    name: SportName(name),
    leagues: leagues
        .map((league) => league.toDomain())
        .toList(
          growable: false,
        ),
  );
}
