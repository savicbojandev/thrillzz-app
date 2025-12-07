import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/sports/cubits/sports/sports_state.dart';

import '../../../../helpers/constants/sample_data.dart';

void main() {
  group('SportsState', () {
    test('SportsLoading defaults to empty sports', () {
      const state = SportsLoading();

      expect(state.sports, isEmpty);
      expect(state.props.single, isEmpty);
    });

    test('SportsError keeps message in props', () {
      const state = SportsError('boom');

      expect(state.message, 'boom');
      expect(state.props.last, 'boom');
    });

    test('SportsLoaded copyWith updates sports list', () {
      final state = SportsLoaded(sports: [buildSport(name: 'Soccer')]);

      final updated = state.copyWith(
        sports: [buildSport(name: 'Basketball')],
      );

      expect(updated.sports.single.name.value, 'Basketball');
      expect(updated.props.first, updated.sports);
    });
  });
}
