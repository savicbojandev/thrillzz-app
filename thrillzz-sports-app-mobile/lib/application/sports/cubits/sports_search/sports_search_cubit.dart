import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:thrillzz_sports_app/application/sports/cubits/sports_search/sports_search_state.dart';
import 'package:thrillzz_sports_app/application/sports/use_cases/search_games.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

const debounceDuration = Duration(milliseconds: 350);

class SportsSearchCubit extends Cubit<SportsSearchState> {
  SportsSearchCubit(this._searchGames) : super(const SportsSearchState()) {
    _resultsSubscription = _searchGames.repository.matchesQueueStream.listen((
      sports,
    ) {
      emit(
        state.copyWith(
          loading: false,
          results: sports,
        ),
      );
    });
  }

  final SearchGames _searchGames;
  Timer? _debounce;
  late final StreamSubscription<List<Sport>> _resultsSubscription;

  void updateNameQuery(String query, {Duration debounce = debounceDuration}) {
    emit(
      state.copyWith(
        form: state.form.copyWith(teamNameQuery: query),
        loading: true,
      ),
    );
    _debounce?.cancel();
    _debounce = Timer(debounce, _run);
  }

  Future<void> updateStartDate(DateTime? date) async {
    emit(
      state.copyWith(
        form: state.form.copyWith(startDate: date),
        loading: true,
      ),
    );
    await _run();
  }

  void updateEndDate(DateTime? date) {
    emit(
      state.copyWith(
        form: state.form.copyWith(endDate: date),
        loading: true,
      ),
    );
    unawaited(_run());
  }

  Future<void> _run() async {
    _debounce?.cancel();
    emit(state.copyWith(loading: true));

    final result = await _searchGames(state.form.toFilters());
    result.when(
      (_) => emit(state.copyWith(loading: false, error: null)),
      (error) => emit(state.copyWith(loading: false, error: error.message)),
    );
  }

  @override
  Future<void> close() async {
    _debounce?.cancel();
    await _resultsSubscription.cancel();
    await super.close();
  }
}
