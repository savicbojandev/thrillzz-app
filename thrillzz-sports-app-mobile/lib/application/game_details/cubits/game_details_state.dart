import 'package:equatable/equatable.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class GameDetailsState extends Equatable {
  const GameDetailsState({
    this.game,
    this.loading = false,
    this.error,
  });

  final Game? game;
  final bool loading;
  final String? error;

  GameDetailsState copyWith({
    Game? game,
    bool? loading,
    String? error,
  }) => GameDetailsState(
    game: game ?? this.game,
    loading: loading ?? this.loading,
    error: error,
  );

  @override
  List<Object?> get props => [game, loading, error];
}
