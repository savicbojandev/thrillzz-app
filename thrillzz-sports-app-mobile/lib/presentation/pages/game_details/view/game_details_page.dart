import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:thrillzz_sports_app/application/game_details/game_details.dart';
import 'package:thrillzz_sports_app/core/l10n/l10n.dart';
import 'package:thrillzz_sports_app/presentation/pages/game_details/view/game_details_page_styles.dart';
import 'package:thrillzz_sports_app/presentation/widgets/shell/shell.dart';

class GameDetailsPage extends StatelessWidget {
  GameDetailsPage({super.key});

  final DateFormat _dateFormat = DateFormat('MMM d, yyyy – HH:mm');

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.gameDetailsTitle,
      body: BlocBuilder<GameDetailsCubit, GameDetailsState>(
        builder: (context, state) {
          if (state.loading && state.game == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Text(
              state.error!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            );
          }
          final game = state.game;
          if (game == null) {
            return Text(l10n.gameNotLoaded);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: GameDetailsPageStyles.gapSmall),
              Text(
                _dateFormat.format(game.date.value),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (game.venue != null) ...[
                const SizedBox(height: GameDetailsPageStyles.gapTiny),
                Text(game.venue!),
              ],
              const Divider(height: GameDetailsPageStyles.dividerHeight),
              Text(
                l10n.players,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: GameDetailsPageStyles.gapSmall),
              ...game.players.map(
                (player) => ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(player.name.value),
                  subtitle: Text(
                    '${player.team.value} • ${player.position.value}',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
