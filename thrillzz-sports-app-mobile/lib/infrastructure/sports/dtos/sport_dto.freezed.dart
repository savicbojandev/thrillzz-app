// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sport_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SportDto _$SportDtoFromJson(Map<String, dynamic> json) {
  return _SportDto.fromJson(json);
}

/// @nodoc
mixin _$SportDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<LeagueDto> get leagues => throw _privateConstructorUsedError;

  /// Serializes this SportDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SportDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SportDtoCopyWith<SportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SportDtoCopyWith<$Res> {
  factory $SportDtoCopyWith(SportDto value, $Res Function(SportDto) then) =
      _$SportDtoCopyWithImpl<$Res, SportDto>;
  @useResult
  $Res call({String id, String name, List<LeagueDto> leagues});
}

/// @nodoc
class _$SportDtoCopyWithImpl<$Res, $Val extends SportDto>
    implements $SportDtoCopyWith<$Res> {
  _$SportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SportDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? leagues = null}) {
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
            leagues: null == leagues
                ? _value.leagues
                : leagues // ignore: cast_nullable_to_non_nullable
                      as List<LeagueDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SportDtoImplCopyWith<$Res>
    implements $SportDtoCopyWith<$Res> {
  factory _$$SportDtoImplCopyWith(
    _$SportDtoImpl value,
    $Res Function(_$SportDtoImpl) then,
  ) = __$$SportDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<LeagueDto> leagues});
}

/// @nodoc
class __$$SportDtoImplCopyWithImpl<$Res>
    extends _$SportDtoCopyWithImpl<$Res, _$SportDtoImpl>
    implements _$$SportDtoImplCopyWith<$Res> {
  __$$SportDtoImplCopyWithImpl(
    _$SportDtoImpl _value,
    $Res Function(_$SportDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SportDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? leagues = null}) {
    return _then(
      _$SportDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        leagues: null == leagues
            ? _value._leagues
            : leagues // ignore: cast_nullable_to_non_nullable
                  as List<LeagueDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SportDtoImpl implements _SportDto {
  const _$SportDtoImpl({
    required this.id,
    required this.name,
    final List<LeagueDto> leagues = const [],
  }) : _leagues = leagues;

  factory _$SportDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SportDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<LeagueDto> _leagues;
  @override
  @JsonKey()
  List<LeagueDto> get leagues {
    if (_leagues is EqualUnmodifiableListView) return _leagues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leagues);
  }

  @override
  String toString() {
    return 'SportDto(id: $id, name: $name, leagues: $leagues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SportDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._leagues, _leagues));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_leagues),
  );

  /// Create a copy of SportDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SportDtoImplCopyWith<_$SportDtoImpl> get copyWith =>
      __$$SportDtoImplCopyWithImpl<_$SportDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SportDtoImplToJson(this);
  }
}

abstract class _SportDto implements SportDto {
  const factory _SportDto({
    required final String id,
    required final String name,
    final List<LeagueDto> leagues,
  }) = _$SportDtoImpl;

  factory _SportDto.fromJson(Map<String, dynamic> json) =
      _$SportDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<LeagueDto> get leagues;

  /// Create a copy of SportDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SportDtoImplCopyWith<_$SportDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
