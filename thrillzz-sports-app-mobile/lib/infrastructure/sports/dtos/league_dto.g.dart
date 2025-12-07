// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeagueDtoImpl _$$LeagueDtoImplFromJson(Map<String, dynamic> json) =>
    _$LeagueDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sportId: json['sportId'] as String,
      games:
          (json['games'] as List<dynamic>?)
              ?.map((e) => GameDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LeagueDtoImplToJson(_$LeagueDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sportId': instance.sportId,
      'games': instance.games,
    };
