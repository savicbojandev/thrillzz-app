import 'package:thrillzz_sports_app/domain/shared/shared.dart';

sealed class PlayerIdException implements Exception {}

class PlayerIdEmpty extends PlayerIdException {}

class PlayerId extends EntityId {
  const PlayerId._(super.value);

  factory PlayerId.newId() => PlayerId._(SimpleId.generate());

  factory PlayerId.fromString(String id) {
    if (id.isEmpty) throw PlayerIdEmpty();
    SimpleId.assertValid(id, field: 'PlayerId');
    return PlayerId._(id);
  }
}
