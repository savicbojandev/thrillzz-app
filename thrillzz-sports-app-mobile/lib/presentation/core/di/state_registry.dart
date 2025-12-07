// coverage:ignore-file
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:thrillzz_sports_app/application/game_details/game_details.dart';
import 'package:thrillzz_sports_app/application/sports/sports.dart';
import 'package:thrillzz_sports_app/core/di/di.dart';

List<SingleChildWidget> stateRegistry() => [
  BlocProvider<SportsCubit>(
    create: (_) => getIt<SportsCubit>(),
  ),
  BlocProvider<SportsSearchCubit>(
    create: (_) => getIt<SportsSearchCubit>(),
  ),
  BlocProvider<GameDetailsCubit>(
    create: (_) => getIt<GameDetailsCubit>(),
  ),
];
