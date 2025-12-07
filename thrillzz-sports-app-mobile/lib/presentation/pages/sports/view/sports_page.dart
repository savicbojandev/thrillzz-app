import 'package:flutter/material.dart';
import 'package:thrillzz_sports_app/core/l10n/l10n.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/sport_page_body/sport_page_body.dart';
import 'package:thrillzz_sports_app/presentation/widgets/shell/shell.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.appTitle,
      body: const SportPageBody(),
    );
  }
}
