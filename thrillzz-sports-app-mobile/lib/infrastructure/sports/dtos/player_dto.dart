import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thrillzz_sports_app/domain/shared/policies/simple_id.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

part 'player_dto.freezed.dart';
part 'player_dto.g.dart';

@freezed
class PlayerDto with _$PlayerDto {
  const factory PlayerDto({
    required String id,
    required String name,
    required String team,
    required String position,
  }) = _PlayerDto;

  factory PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerDtoFromJson(json);
}

extension PlayerDtoX on PlayerDto {
  Player toDomain() => Player(
    id: _parseId(id),
    name: PlayerName(name),
    team: TeamName(team),
    position: PlayerPosition(position),
  );

  PlayerId _parseId(String raw) {
    try {
      return PlayerId.fromString(raw);
    } on SimpleIdException {
      // Fallback to generated ID when backend uses non-numeric IDs.
      return PlayerId.newId();
    }
  }
}
