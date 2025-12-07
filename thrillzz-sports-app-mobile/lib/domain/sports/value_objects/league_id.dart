import 'package:thrillzz_sports_app/domain/shared/shared.dart';

sealed class LeagueIdException implements Exception {}

class LeagueIdEmpty extends LeagueIdException {}

class LeagueId extends EntityId {
  const LeagueId._(super.value);

  factory LeagueId.newId() => LeagueId._(SimpleId.generate());

  factory LeagueId.fromString(String id) {
    if (id.isEmpty) throw LeagueIdEmpty();
    SimpleId.assertValid(id, field: 'LeagueId');
    return LeagueId._(id);
  }
}
