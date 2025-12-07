// coverage:ignore-file
import 'package:flutter/material.dart';

@immutable
abstract class EntityId {
  const EntityId(this.value);

  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityId &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
