import 'package:go_router/go_router.dart';
import 'package:thrillzz_sports_app/presentation/core/router/routes.dart';

final GoRouter router = GoRouter(
  routes: AppRoutes.all.map((route) => route.route).toList(),
);
