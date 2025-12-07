import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/sports/cubits/sports_search/sports_search_state.dart';
import 'package:thrillzz_sports_app/application/sports/queries/game_search_form.dart';

import '../../../../helpers/constants/sample_data.dart';

void main() {
  group('SportsSearchState', () {
    test('hasFilters proxies to form', () {
      final state = SportsSearchState(
        form: const GameSearchForm(teamNameQuery: 'sharks'),
      );

      expect(state.hasFilters, isTrue);
    });

    test('copyWith updates provided fields and keeps others', () {
      final sport = buildSport(name: 'Soccer');
      final initial = SportsSearchState(
        loading: true,
        results: const [],
      );

      final updated = initial.copyWith(
        loading: false,
        results: [sport],
        error: 'oops',
      );

      expect(updated.loading, isFalse);
      expect(updated.results, [sport]);
      expect(updated.error, 'oops');
      expect(updated.form, same(initial.form));
      expect(updated.props, [initial.form, false, [sport], 'oops']);
    });
  });
}
