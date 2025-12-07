import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thrillzz_sports_app/application/game_details/cubits/game_details_cubit.dart';
import 'package:thrillzz_sports_app/core/l10n/l10n.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';
import 'package:thrillzz_sports_app/presentation/core/router/routes.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/game_card.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/league_catalog/league_catalog_styles.dart';

class LeagueCatalog extends StatelessWidget {
  const LeagueCatalog({
    required this.league,
    super.key,
  });

  final League league;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          league.name.value,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: LeagueCatalogStyles.gapSmall),
        if (league.games.isEmpty)
          Text(l10n.noGamesForLeague)
        else
          ...league.games.map(
            (game) => Padding(
              padding: const EdgeInsets.only(
                bottom: LeagueCatalogStyles.gapSmall,
              ),
              child: GameCard(
                game: game,
                leagueName: league.name.value,
                onTap: () {
                  unawaited(context.read<GameDetailsCubit>().load(game.id));
                  unawaited(context.push(AppRoutes.gameDetails.path));
                },
              ),
            ),
          ),
        const SizedBox(height: LeagueCatalogStyles.gapMedium),
      ],
    );
  }
}
