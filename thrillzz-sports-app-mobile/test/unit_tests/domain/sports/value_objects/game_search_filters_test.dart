import 'package:flutter_test/flutter_test.dart';
import 'package:thrillzz_sports_app/domain/sports/value_objects/game_search_filters.dart';

void main() {
  group('GameSearchFilters', () {
    test('hasFilters reflects query and dates', () {
      const empty = GameSearchFilters();
      expect(empty.hasFilters, isFalse);

      const withQuery = GameSearchFilters(teamNameQuery: 'A');
      expect(withQuery.hasFilters, isTrue);

      final withDate = GameSearchFilters(
        startDate: DateTime.utc(2025, 1, 1),
        endDate: DateTime.utc(2025, 1, 2),
      );
      expect(withDate.hasFilters, isTrue);
    });

    test('normalizedTeamNameQuery trims and lowercases', () {
      const filters = GameSearchFilters(teamNameQuery: '  Lakers ');
      expect(filters.normalizedTeamNameQuery(), 'lakers');
    });

    test('toJson includes available fields', () {
      final start = DateTime.utc(2025, 1, 1);
      final end = DateTime.utc(2025, 1, 2);
      final filters = GameSearchFilters(
        teamNameQuery: 'Query',
        startDate: start,
        endDate: end,
      );

      final json = filters.toJson();

      expect(json['teamName'], 'Query');
      expect(json['startDate'], start.toIso8601String());
      expect(json['endDate'], end.toIso8601String());
    });
  });
}
