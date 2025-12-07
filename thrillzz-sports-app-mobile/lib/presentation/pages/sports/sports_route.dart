import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrillzz_sports_app/presentation/core/router/app_route.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/view/sports_page.dart';

class SportsRoute extends AppRoute {
  const SportsRoute();

  @override
  Widget buildPage(GoRouterState state) => const SportsPage();

  @override
  String get path => '/';

  @override
  String get name => 'sports';
}
