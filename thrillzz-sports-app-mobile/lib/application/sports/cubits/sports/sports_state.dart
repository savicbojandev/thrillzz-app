import 'package:equatable/equatable.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

sealed class SportsState extends Equatable {
  const SportsState({
    required this.sports,
  });

  final List<Sport> sports;

  @override
  List<Object?> get props => [sports];
}

class SportsLoading extends SportsState {
  const SportsLoading({
    super.sports = const [],
  });
}

class SportsError extends SportsState {
  const SportsError(
    this.message, {
    super.sports = const [],
  });

  final String message;

  @override
  List<Object?> get props => [...super.props, message];
}

class SportsLoaded extends SportsState {
  const SportsLoaded({
    required super.sports,
  });

  SportsLoaded copyWith({
    List<Sport>? sports,
  }) {
    return SportsLoaded(
      sports: sports ?? this.sports,
    );
  }
}
