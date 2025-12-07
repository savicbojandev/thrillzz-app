// coverage:ignore-file
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:thrillzz_sports_app/application/sports/sports.dart';
import 'package:thrillzz_sports_app/core/di/di.dart';
import 'package:thrillzz_sports_app/core/logging/logging.dart';

List<SingleChildWidget> serviceRegistry() => [
  Provider<LogService>.value(value: getIt<LogService>()),
  Provider<LoadSports>.value(value: getIt<LoadSports>()),
  Provider<SearchGames>.value(value: getIt<SearchGames>()),
  Provider<GetGameDetails>.value(value: getIt<GetGameDetails>()),
];
