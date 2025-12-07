import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thrillzz_sports_app/domain/sports/sports.dart';

class GameCard extends StatelessWidget {
  GameCard({
    required this.game,
    this.leagueName,
    this.onTap,
    super.key,
  });

  final Game game;
  final String? leagueName;
  final VoidCallback? onTap;

  final DateFormat _dateFormat = DateFormat('MMM d, yyyy – HH:mm');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(game.title),
        subtitle: Text(
          [
            if (leagueName != null) leagueName,
            _dateFormat.format(game.date.value),
            if (game.venue != null) game.venue,
          ].whereType<String>().join(' • '),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: onTap,
      ),
    );
  }
}
