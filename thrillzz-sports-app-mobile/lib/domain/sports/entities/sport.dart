import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class Sport {
  const Sport({
    required this.id,
    required this.name,
    this.leagues = const [],
  });

  final SportId id;
  final SportName name;
  final List<League> leagues;
}
