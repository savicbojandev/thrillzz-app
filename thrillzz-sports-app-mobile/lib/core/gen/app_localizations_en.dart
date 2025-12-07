// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Thrillzz Sports';

  @override
  String get browseBySport => 'Browse by sport';

  @override
  String get leagues => 'Leagues';

  @override
  String get games => 'Games';

  @override
  String get noGamesFoundForLeague => 'No games found for this league.';

  @override
  String get searchTitle => 'Search';

  @override
  String get searchByNameLabel => 'Search by name';

  @override
  String get searchByNameHint => 'e.g. Lakers vs Celtics';

  @override
  String get searchAction => 'Search';

  @override
  String get searchStartDateLabel => 'Start date';

  @override
  String get searchEndDateLabel => 'End date';

  @override
  String get searchDatePlaceholder => 'Select date';

  @override
  String get searchResultsTitle => 'Search results';

  @override
  String get gameDetailsTitle => 'Game details';

  @override
  String get players => 'Players';

  @override
  String get gameNotLoaded => 'Game not loaded.';

  @override
  String get noGamesForLeague => 'No games for league';

  @override
  String get noLeaguesAvailable => 'No leagues available';
}
