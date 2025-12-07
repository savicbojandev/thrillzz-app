import 'package:thrillzz_sports_app/presentation/core/router/app_route.dart';
import 'package:thrillzz_sports_app/presentation/pages/game_details/game_details_route.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/sports_route.dart';

class AppRoutes {
  static const sports = SportsRoute();
  static const gameDetails = GameDetailsRoute();

  static final all = <AppRoute>[
    sports,
    gameDetails,
  ];
}
