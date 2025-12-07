import 'package:thrillzz_sports_app/domain/shared/shared.dart';

sealed class GameIdException implements Exception {}

class GameIdEmpty extends GameIdException {}

class GameId extends EntityId {
  const GameId._(super.value);

  factory GameId.newId() => GameId._(SimpleId.generate());

  factory GameId.fromString(String id) {
    if (id.isEmpty) throw GameIdEmpty();
    SimpleId.assertValid(id, field: 'GameId');
    return GameId._(id);
  }
}
