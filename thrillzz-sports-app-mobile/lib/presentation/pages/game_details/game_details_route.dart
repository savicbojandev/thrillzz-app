import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrillzz_sports_app/presentation/core/router/app_route.dart';
import 'package:thrillzz_sports_app/presentation/pages/game_details/view/game_details_page.dart';

class GameDetailsRoute extends AppRoute {
  const GameDetailsRoute();

  @override
  Widget buildPage(GoRouterState state) => GameDetailsPage();

  @override
  String get path => '/games';

  @override
  String get name => 'game-details';
}
