// coverage:ignore-file
import 'dart:math';

sealed class SimpleIdException implements Exception {}

class FieldMustBeSimpleId extends SimpleIdException {
  FieldMustBeSimpleId({required this.field});

  final String field;

  @override
  String toString() => 'The field $field must be a positive integer ID';
}

class SimpleId {
  static final _random = Random();
  static final _idPattern = RegExp(r'^[1-9][0-9]*$');

  static String generate() {
    // Return a simple positive integer (1..999999) as a string.
    return (1 + _random.nextInt(999999)).toString();
  }

  static void assertValid(String input, {required String field}) {
    if (!_idPattern.hasMatch(input)) {
      throw FieldMustBeSimpleId(field: field);
    }
  }
}
