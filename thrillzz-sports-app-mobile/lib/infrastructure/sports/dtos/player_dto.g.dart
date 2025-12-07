// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerDtoImpl _$$PlayerDtoImplFromJson(Map<String, dynamic> json) =>
    _$PlayerDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      team: json['team'] as String,
      position: json['position'] as String,
    );

Map<String, dynamic> _$$PlayerDtoImplToJson(_$PlayerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'team': instance.team,
      'position': instance.position,
    };
