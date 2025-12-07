import 'package:equatable/equatable.dart';
import 'package:thrillzz_sports_app/application/sports/queries/queries.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class SportsSearchState extends Equatable {
  const SportsSearchState({
    this.form = const GameSearchForm(),
    this.loading = false,
    this.results = const [],
    this.error,
  });

  final GameSearchForm form;
  final bool loading;
  final List<Sport> results;
  final String? error;

  bool get hasFilters => form.hasFilters;

  SportsSearchState copyWith({
    GameSearchForm? form,
    bool? loading,
    List<Sport>? results,
    String? error,
  }) => SportsSearchState(
    form: form ?? this.form,
    loading: loading ?? this.loading,
    results: results ?? this.results,
    error: error,
  );

  @override
  List<Object?> get props => [form, loading, results, error];
}
