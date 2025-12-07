import 'package:thrillzz_sports_app/domain/sports/sports.dart';

final defaultSportId = SportId.fromString('4001');
final defaultLeagueId = LeagueId.fromString('4002');
final secondaryLeagueId = LeagueId.fromString('4003');
final firstGameId = GameId.fromString('4004');
final secondGameId = GameId.fromString('4005');

Sport buildSport({
  SportId? id,
  String name = 'Basketball',
  List<League>? leagues,
}) => Sport(
  id: id ?? defaultSportId,
  name: SportName(name),
  leagues: leagues ?? [buildLeague()],
);

League buildLeague({
  LeagueId? id,
  SportId? sportId,
  String name = 'Premier League',
  List<Game>? games,
}) {
  final resolvedSportId = sportId ?? defaultSportId;
  return League(
    id: id ?? defaultLeagueId,
    name: LeagueName(name),
    sportId: resolvedSportId,
    games: games ?? [buildGame(sportId: resolvedSportId)],
  );
}

Game buildGame({
  GameId? id,
  SportId? sportId,
  LeagueId? leagueId,
  String homeTeam = 'Team A',
  String awayTeam = 'Team B',
  DateTime? date,
}) => Game(
  id: id ?? firstGameId,
  sportId: sportId ?? defaultSportId,
  leagueId: leagueId ?? defaultLeagueId,
  homeTeam: TeamName(homeTeam),
  awayTeam: TeamName(awayTeam),
  date: GameDate(date ?? DateTime.utc(2025, 1, 1)),
);
