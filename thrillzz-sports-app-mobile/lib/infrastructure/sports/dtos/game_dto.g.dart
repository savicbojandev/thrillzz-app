// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameDtoImpl _$$GameDtoImplFromJson(Map<String, dynamic> json) =>
    _$GameDtoImpl(
      id: json['id'] as String,
      sportId: json['sportId'] as String,
      leagueId: json['leagueId'] as String,
      homeTeam: json['homeTeam'] as String,
      awayTeam: json['awayTeam'] as String,
      date: DateTime.parse(json['date'] as String),
      venue: json['venue'] as String?,
      players:
          (json['players'] as List<dynamic>?)
              ?.map((e) => PlayerDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GameDtoImplToJson(_$GameDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sportId': instance.sportId,
      'leagueId': instance.leagueId,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'date': instance.date.toIso8601String(),
      'venue': instance.venue,
      'players': instance.players,
    };
