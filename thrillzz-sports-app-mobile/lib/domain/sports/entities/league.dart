import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class League {
  const League({
    required this.id,
    required this.name,
    required this.sportId,
    this.games = const [],
  });

  final LeagueId id;
  final LeagueName name;
  final SportId sportId;
  final List<Game> games;
}
