// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeagueDto _$LeagueDtoFromJson(Map<String, dynamic> json) {
  return _LeagueDto.fromJson(json);
}

/// @nodoc
mixin _$LeagueDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sportId => throw _privateConstructorUsedError;
  List<GameDto> get games => throw _privateConstructorUsedError;

  /// Serializes this LeagueDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeagueDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeagueDtoCopyWith<LeagueDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueDtoCopyWith<$Res> {
  factory $LeagueDtoCopyWith(LeagueDto value, $Res Function(LeagueDto) then) =
      _$LeagueDtoCopyWithImpl<$Res, LeagueDto>;
  @useResult
  $Res call({String id, String name, String sportId, List<GameDto> games});
}

/// @nodoc
class _$LeagueDtoCopyWithImpl<$Res, $Val extends LeagueDto>
    implements $LeagueDtoCopyWith<$Res> {
  _$LeagueDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeagueDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sportId = null,
    Object? games = null,
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
            sportId: null == sportId
                ? _value.sportId
                : sportId // ignore: cast_nullable_to_non_nullable
                      as String,
            games: null == games
                ? _value.games
                : games // ignore: cast_nullable_to_non_nullable
                      as List<GameDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeagueDtoImplCopyWith<$Res>
    implements $LeagueDtoCopyWith<$Res> {
  factory _$$LeagueDtoImplCopyWith(
    _$LeagueDtoImpl value,
    $Res Function(_$LeagueDtoImpl) then,
  ) = __$$LeagueDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String sportId, List<GameDto> games});
}

/// @nodoc
class __$$LeagueDtoImplCopyWithImpl<$Res>
    extends _$LeagueDtoCopyWithImpl<$Res, _$LeagueDtoImpl>
    implements _$$LeagueDtoImplCopyWith<$Res> {
  __$$LeagueDtoImplCopyWithImpl(
    _$LeagueDtoImpl _value,
    $Res Function(_$LeagueDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeagueDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sportId = null,
    Object? games = null,
  }) {
    return _then(
      _$LeagueDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sportId: null == sportId
            ? _value.sportId
            : sportId // ignore: cast_nullable_to_non_nullable
                  as String,
        games: null == games
            ? _value._games
            : games // ignore: cast_nullable_to_non_nullable
                  as List<GameDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeagueDtoImpl implements _LeagueDto {
  const _$LeagueDtoImpl({
    required this.id,
    required this.name,
    required this.sportId,
    final List<GameDto> games = const [],
  }) : _games = games;

  factory _$LeagueDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeagueDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String sportId;
  final List<GameDto> _games;
  @override
  @JsonKey()
  List<GameDto> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  @override
  String toString() {
    return 'LeagueDto(id: $id, name: $name, sportId: $sportId, games: $games)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeagueDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sportId, sportId) || other.sportId == sportId) &&
            const DeepCollectionEquality().equals(other._games, _games));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    sportId,
    const DeepCollectionEquality().hash(_games),
  );

  /// Create a copy of LeagueDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeagueDtoImplCopyWith<_$LeagueDtoImpl> get copyWith =>
      __$$LeagueDtoImplCopyWithImpl<_$LeagueDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeagueDtoImplToJson(this);
  }
}

abstract class _LeagueDto implements LeagueDto {
  const factory _LeagueDto({
    required final String id,
    required final String name,
    required final String sportId,
    final List<GameDto> games,
  }) = _$LeagueDtoImpl;

  factory _LeagueDto.fromJson(Map<String, dynamic> json) =
      _$LeagueDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get sportId;
  @override
  List<GameDto> get games;

  /// Create a copy of LeagueDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeagueDtoImplCopyWith<_$LeagueDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
