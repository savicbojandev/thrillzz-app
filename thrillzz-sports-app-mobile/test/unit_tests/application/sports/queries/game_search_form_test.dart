import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/application/sports/queries/game_search_form.dart';

void main() {
  group('GameSearchForm', () {
    test('hasFilters reflects inputs', () {
      const emptyForm = GameSearchForm();
      expect(emptyForm.hasFilters, isFalse);

      const withQuery = GameSearchForm(teamNameQuery: 'Lakers');
      expect(withQuery.hasFilters, isTrue);

      final withDates = GameSearchForm(
        startDate: DateTime.utc(2025, 1, 1),
        endDate: DateTime.utc(2025, 12, 31),
      );
      expect(withDates.hasFilters, isTrue);
    });

    test('copyWith updates fields immutably', () {
      const form = GameSearchForm(teamNameQuery: 'A');
      final updated = form.copyWith(
        teamNameQuery: 'B',
        startDate: DateTime.utc(2025, 1, 1),
      );

      expect(form.teamNameQuery, 'A');
      expect(updated.teamNameQuery, 'B');
      expect(updated.startDate, isNotNull);
    });

    test('toFilters maps values', () {
      final start = DateTime.utc(2025, 1, 1);
      final end = DateTime.utc(2025, 12, 31);
      const form = GameSearchForm(teamNameQuery: 'Query');

      final filters = form.copyWith(startDate: start, endDate: end).toFilters();

      expect(filters.teamNameQuery, 'Query');
      expect(filters.startDate, start);
      expect(filters.endDate, end);
    });
  });
}
