// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlayerDto _$PlayerDtoFromJson(Map<String, dynamic> json) {
  return _PlayerDto.fromJson(json);
}

/// @nodoc
mixin _$PlayerDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get team => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;

  /// Serializes this PlayerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerDtoCopyWith<PlayerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerDtoCopyWith<$Res> {
  factory $PlayerDtoCopyWith(PlayerDto value, $Res Function(PlayerDto) then) =
      _$PlayerDtoCopyWithImpl<$Res, PlayerDto>;
  @useResult
  $Res call({String id, String name, String team, String position});
}

/// @nodoc
class _$PlayerDtoCopyWithImpl<$Res, $Val extends PlayerDto>
    implements $PlayerDtoCopyWith<$Res> {
  _$PlayerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? team = null,
    Object? position = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            team: null == team
                ? _value.team
                : team // ignore: cast_nullable_to_non_nullable
                      as String,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerDtoImplCopyWith<$Res>
    implements $PlayerDtoCopyWith<$Res> {
  factory _$$PlayerDtoImplCopyWith(
    _$PlayerDtoImpl value,
    $Res Function(_$PlayerDtoImpl) then,
  ) = __$$PlayerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String team, String position});
}

/// @nodoc
class __$$PlayerDtoImplCopyWithImpl<$Res>
    extends _$PlayerDtoCopyWithImpl<$Res, _$PlayerDtoImpl>
    implements _$$PlayerDtoImplCopyWith<$Res> {
  __$$PlayerDtoImplCopyWithImpl(
    _$PlayerDtoImpl _value,
    $Res Function(_$PlayerDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? team = null,
    Object? position = null,
  }) {
    return _then(
      _$PlayerDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        team: null == team
            ? _value.team
            : team // ignore: cast_nullable_to_non_nullable
                  as String,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerDtoImpl implements _PlayerDto {
  const _$PlayerDtoImpl({
    required this.id,
    required this.name,
    required this.team,
    required this.position,
  });

  factory _$PlayerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String team;
  @override
  final String position;

  @override
  String toString() {
    return 'PlayerDto(id: $id, name: $name, team: $team, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, team, position);

  /// Create a copy of PlayerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerDtoImplCopyWith<_$PlayerDtoImpl> get copyWith =>
      __$$PlayerDtoImplCopyWithImpl<_$PlayerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerDtoImplToJson(this);
  }
}

abstract class _PlayerDto implements PlayerDto {
  const factory _PlayerDto({
    required final String id,
    required final String name,
    required final String team,
    required final String position,
  }) = _$PlayerDtoImpl;

  factory _PlayerDto.fromJson(Map<String, dynamic> json) =
      _$PlayerDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get team;
  @override
  String get position;

  /// Create a copy of PlayerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerDtoImplCopyWith<_$PlayerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
