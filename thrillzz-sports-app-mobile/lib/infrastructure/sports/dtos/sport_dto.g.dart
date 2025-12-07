// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SportDtoImpl _$$SportDtoImplFromJson(Map<String, dynamic> json) =>
    _$SportDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      leagues:
          (json['leagues'] as List<dynamic>?)
              ?.map((e) => LeagueDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SportDtoImplToJson(_$SportDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'leagues': instance.leagues,
    };
