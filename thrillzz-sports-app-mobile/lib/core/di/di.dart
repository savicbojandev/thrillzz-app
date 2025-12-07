// coverage:ignore-file
import 'package:get_it/get_it.dart';
import 'package:thrillzz_sports_app/application/game_details/game_details.dart';
import 'package:thrillzz_sports_app/application/sports/sports.dart';
import 'package:thrillzz_sports_app/core/logging/logging.dart';
import 'package:thrillzz_sports_app/domain/game_details/ports/game_details_repository.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/api.dart';
import 'package:thrillzz_sports_app/infrastructure/game_details/api_adapters/game_details_api.dart';
import 'package:thrillzz_sports_app/infrastructure/game_details/repositories/game_details_repo.dart';
import 'package:thrillzz_sports_app/infrastructure/logging/port_adapters/developer_log_service.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/api_adapters/sports_api.dart';
import 'package:thrillzz_sports_app/infrastructure/sports/repositories/sports_repo.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt
    // ----- Core -----
    ..registerLazySingleton<LogService>(DeveloperLogService.new)
    ..registerLazySingleton<Api>(Api.sportsApi)
    ..registerLazySingleton<SportsApi>(() => SportsApi(api: getIt()))
    ..registerLazySingleton<GameDetailsApi>(() => GameDetailsApi(api: getIt()))
    // ----- Domain ports -----
    ..registerLazySingleton<SportsRepository>(
      () => SportsRepo.seeded(getIt()),
    )
    ..registerLazySingleton<GameDetailsRepository>(
      () => GameDetailsRepo(api: getIt()),
    )
    // ----- Application use cases -----
    ..registerLazySingleton<LoadSports>(() => LoadSports(getIt()))
    ..registerLazySingleton<SearchGames>(() => SearchGames(getIt()))
    ..registerLazySingleton<GetGameDetails>(() => GetGameDetails(getIt()))
    // ----- Application cubits -----
    ..registerFactory<SportsCubit>(
      () => SportsCubit(getIt()),
    )
    ..registerFactory<SportsSearchCubit>(() => SportsSearchCubit(getIt()))
    ..registerFactory<GameDetailsCubit>(() => GameDetailsCubit(getIt()));
}
