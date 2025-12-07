import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class Game {
  const Game({
    required this.id,
    required this.sportId,
    required this.leagueId,
    required this.homeTeam,
    required this.awayTeam,
    required this.date,
    this.venue,
    this.players = const [],
  });

  final GameId id;
  final SportId sportId;
  final LeagueId leagueId;
  final TeamName homeTeam;
  final TeamName awayTeam;
  final GameDate date;
  final String? venue;
  final List<Player> players;

  String get title => '${homeTeam.value} vs ${awayTeam.value}';
}
