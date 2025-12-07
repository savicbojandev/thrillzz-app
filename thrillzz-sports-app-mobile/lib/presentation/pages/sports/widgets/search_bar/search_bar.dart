import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrillzz_sports_app/application/sports/cubits/cubits.dart';
import 'package:thrillzz_sports_app/core/l10n/l10n.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/date_field/date_field.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/search_bar/search_bar_styles.dart';

class GamesSearchBar extends StatelessWidget {
  const GamesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<SportsSearchCubit, SportsSearchState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: l10n.searchByNameLabel,
                hintText: l10n.searchByNameHint,
              ),
              onChanged: (value) {
                context.read<SportsSearchCubit>().updateNameQuery(value);
              },
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: SearchBarStyles.gap),
            Row(
              children: [
                Expanded(
                  child: DateField(
                    label: l10n.searchStartDateLabel,
                    hintText: l10n.searchDatePlaceholder,
                    initialDate: state.form.startDate,
                    onSubmitted: (date) =>
                        context.read<SportsSearchCubit>().updateStartDate(date),
                  ),
                ),
                const SizedBox(width: SearchBarStyles.gap),
                Expanded(
                  child: DateField(
                    label: l10n.searchEndDateLabel,
                    hintText: l10n.searchDatePlaceholder,
                    initialDate: state.form.endDate,
                    onSubmitted: (date) =>
                        context.read<SportsSearchCubit>().updateEndDate(date),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
