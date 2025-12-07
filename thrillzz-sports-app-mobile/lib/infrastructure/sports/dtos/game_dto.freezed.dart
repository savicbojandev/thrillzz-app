// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameDto _$GameDtoFromJson(Map<String, dynamic> json) {
  return _GameDto.fromJson(json);
}

/// @nodoc
mixin _$GameDto {
  String get id => throw _privateConstructorUsedError;
  String get sportId => throw _privateConstructorUsedError;
  String get leagueId => throw _privateConstructorUsedError;
  String get homeTeam => throw _privateConstructorUsedError;
  String get awayTeam => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  List<PlayerDto> get players => throw _privateConstructorUsedError;

  /// Serializes this GameDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameDtoCopyWith<GameDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDtoCopyWith<$Res> {
  factory $GameDtoCopyWith(GameDto value, $Res Function(GameDto) then) =
      _$GameDtoCopyWithImpl<$Res, GameDto>;
  @useResult
  $Res call({
    String id,
    String sportId,
    String leagueId,
    String homeTeam,
    String awayTeam,
    DateTime date,
    String? venue,
    List<PlayerDto> players,
  });
}

/// @nodoc
class _$GameDtoCopyWithImpl<$Res, $Val extends GameDto>
    implements $GameDtoCopyWith<$Res> {
  _$GameDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sportId = null,
    Object? leagueId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? date = null,
    Object? venue = freezed,
    Object? players = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            sportId: null == sportId
                ? _value.sportId
                : sportId // ignore: cast_nullable_to_non_nullable
                      as String,
            leagueId: null == leagueId
                ? _value.leagueId
                : leagueId // ignore: cast_nullable_to_non_nullable
                      as String,
            homeTeam: null == homeTeam
                ? _value.homeTeam
                : homeTeam // ignore: cast_nullable_to_non_nullable
                      as String,
            awayTeam: null == awayTeam
                ? _value.awayTeam
                : awayTeam // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            venue: freezed == venue
                ? _value.venue
                : venue // ignore: cast_nullable_to_non_nullable
                      as String?,
            players: null == players
                ? _value.players
                : players // ignore: cast_nullable_to_non_nullable
                      as List<PlayerDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameDtoImplCopyWith<$Res> implements $GameDtoCopyWith<$Res> {
  factory _$$GameDtoImplCopyWith(
    _$GameDtoImpl value,
    $Res Function(_$GameDtoImpl) then,
  ) = __$$GameDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String sportId,
    String leagueId,
    String homeTeam,
    String awayTeam,
    DateTime date,
    String? venue,
    List<PlayerDto> players,
  });
}

/// @nodoc
class __$$GameDtoImplCopyWithImpl<$Res>
    extends _$GameDtoCopyWithImpl<$Res, _$GameDtoImpl>
    implements _$$GameDtoImplCopyWith<$Res> {
  __$$GameDtoImplCopyWithImpl(
    _$GameDtoImpl _value,
    $Res Function(_$GameDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sportId = null,
    Object? leagueId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? date = null,
    Object? venue = freezed,
    Object? players = null,
  }) {
    return _then(
      _$GameDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sportId: null == sportId
            ? _value.sportId
            : sportId // ignore: cast_nullable_to_non_nullable
                  as String,
        leagueId: null == leagueId
            ? _value.leagueId
            : leagueId // ignore: cast_nullable_to_non_nullable
                  as String,
        homeTeam: null == homeTeam
            ? _value.homeTeam
            : homeTeam // ignore: cast_nullable_to_non_nullable
                  as String,
        awayTeam: null == awayTeam
            ? _value.awayTeam
            : awayTeam // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        venue: freezed == venue
            ? _value.venue
            : venue // ignore: cast_nullable_to_non_nullable
                  as String?,
        players: null == players
            ? _value._players
            : players // ignore: cast_nullable_to_non_nullable
                  as List<PlayerDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameDtoImpl implements _GameDto {
  const _$GameDtoImpl({
    required this.id,
    required this.sportId,
    required this.leagueId,
    required this.homeTeam,
    required this.awayTeam,
    required this.date,
    this.venue,
    final List<PlayerDto> players = const [],
  }) : _players = players;

  factory _$GameDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String sportId;
  @override
  final String leagueId;
  @override
  final String homeTeam;
  @override
  final String awayTeam;
  @override
  final DateTime date;
  @override
  final String? venue;
  final List<PlayerDto> _players;
  @override
  @JsonKey()
  List<PlayerDto> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'GameDto(id: $id, sportId: $sportId, leagueId: $leagueId, homeTeam: $homeTeam, awayTeam: $awayTeam, date: $date, venue: $venue, players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sportId, sportId) || other.sportId == sportId) &&
            (identical(other.leagueId, leagueId) ||
                other.leagueId == leagueId) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sportId,
    leagueId,
    homeTeam,
    awayTeam,
    date,
    venue,
    const DeepCollectionEquality().hash(_players),
  );

  /// Create a copy of GameDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameDtoImplCopyWith<_$GameDtoImpl> get copyWith =>
      __$$GameDtoImplCopyWithImpl<_$GameDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameDtoImplToJson(this);
  }
}

abstract class _GameDto implements GameDto {
  const factory _GameDto({
    required final String id,
    required final String sportId,
    required final String leagueId,
    required final String homeTeam,
    required final String awayTeam,
    required final DateTime date,
    final String? venue,
    final List<PlayerDto> players,
  }) = _$GameDtoImpl;

  factory _GameDto.fromJson(Map<String, dynamic> json) = _$GameDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get sportId;
  @override
  String get leagueId;
  @override
  String get homeTeam;
  @override
  String get awayTeam;
  @override
  DateTime get date;
  @override
  String? get venue;
  @override
  List<PlayerDto> get players;

  /// Create a copy of GameDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameDtoImplCopyWith<_$GameDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
