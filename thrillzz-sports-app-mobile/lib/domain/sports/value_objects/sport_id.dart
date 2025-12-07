import 'package:thrillzz_sports_app/domain/shared/shared.dart';

sealed class SportIdException implements Exception {}

class SportIdEmpty extends SportIdException {}

class SportId extends EntityId {
  const SportId._(super.value);

  factory SportId.newId() => SportId._(SimpleId.generate());

  factory SportId.fromString(String id) {
    if (id.isEmpty) throw SportIdEmpty();
    SimpleId.assertValid(id, field: 'SportId');
    return SportId._(id);
  }
}
