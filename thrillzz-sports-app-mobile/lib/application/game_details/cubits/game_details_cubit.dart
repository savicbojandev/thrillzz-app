import 'package:bloc/bloc.dart';
import 'package:thrillzz_sports_app/application/game_details/cubits/game_details_state.dart';
import 'package:thrillzz_sports_app/application/sports/use_cases/use_cases.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class GameDetailsCubit extends Cubit<GameDetailsState> {
  GameDetailsCubit(this._getGameDetails) : super(const GameDetailsState());

  final GetGameDetails _getGameDetails;

  Future<void> load(GameId id) async {
    emit(state.copyWith(loading: true));
    final result = await _getGameDetails(id);

    result.when(
      (game) => emit(
        state.copyWith(
          game: game,
          loading: false,
        ),
      ),
      (error) => emit(
        state.copyWith(
          loading: false,
          error: error.message,
        ),
      ),
    );
  }
}
