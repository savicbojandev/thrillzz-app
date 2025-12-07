import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  const AppRoute();

  Widget buildPage(GoRouterState state);

  String get path;

  String get name;

  GoRoute get route => GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => MaterialPage(
      child: buildPage(state),
    ),
  );
}
