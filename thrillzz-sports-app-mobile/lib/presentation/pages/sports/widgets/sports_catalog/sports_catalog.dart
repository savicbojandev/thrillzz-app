import 'package:flutter/material.dart';
import 'package:thrillzz_sports_app/core/l10n/l10n.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/league_catalog/league_catalog.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/sports_catalog/sports_catalog_styles.dart';

class SportsCatalog extends StatelessWidget {
  const SportsCatalog({
    required this.sport,
    super.key,
  });

  final Sport sport;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sport.name.value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: SportsCatalogStyles.gapSmall),
        if (sport.leagues.isEmpty)
          Center(
            child: Text(
              l10n.noLeaguesAvailable,
              style: const TextStyle(color: Colors.red),
            ),
          )
        else
          ...sport.leagues.map(
            (league) => LeagueCatalog(league: league),
          ),
        const SizedBox(height: SportsCatalogStyles.dividerHeight),
      ],
    );
  }
}
