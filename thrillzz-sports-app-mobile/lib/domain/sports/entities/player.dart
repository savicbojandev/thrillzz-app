import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class Player {
  const Player({
    required this.id,
    required this.name,
    required this.team,
    required this.position,
  });

  final PlayerId id;
  final PlayerName name;
  final TeamName team;
  final PlayerPosition position;
}
