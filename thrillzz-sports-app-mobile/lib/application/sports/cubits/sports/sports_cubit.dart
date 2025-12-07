import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:thrillzz_sports_app/application/sports/cubits/sports/sports_state.dart';
import 'package:thrillzz_sports_app/application/sports/use_cases/load_sports.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit(this._loadSports) : super(const SportsLoading()) {
    _bootstrap().ignore();
    _searchSubscription = _loadSports.repository.matchesQueueStream.listen(
      _handleSearchResults,
    );
  }

  final LoadSports _loadSports;
  late final StreamSubscription<List<Sport>> _searchSubscription;

  void _handleSearchResults(List<Sport> results) {
    emit(SportsLoaded(sports: results));
  }

  Future<void> _bootstrap() async {
    emit(const SportsLoading());

    final result = await _loadSports();
    await Future<void>.delayed(const Duration(seconds: 2));

    result.when(
      (sports) {
        if (sports.isEmpty) {
          emit(const SportsError('No sports available'));
          return;
        }

        final sport = sports.first;

        if (sport.leagues.isEmpty) {
          emit(const SportsError('No leagues available'));
          return;
        }

        emit(
          SportsLoaded(
            sports: sports,
          ),
        );
      },
      (error) => emit(SportsError(error.message)),
    );
  }

  @override
  Future<void> close() async {
    await _searchSubscription.cancel();
    await super.close();
  }
}
