import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrillzz_sports_app/application/sports/cubits/cubits.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/search_bar/search_bar.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/sport_page_body/sport_page_body_styles.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/sports_catalog/sports_catalog.dart';

class SportPageBody extends StatelessWidget {
  const SportPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SportsSearchCubit, SportsSearchState>(
          listener: (context, state) {
            final error = state.error;
            if (error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            }
          },
        ),
        BlocListener<SportsCubit, SportsState>(
          listener: (context, state) {
            if (state is SportsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<SportsCubit, SportsState>(
        buildWhen: (prev, curr) => prev.sports != curr.sports,
        builder: (context, state) {
          final sports = state.sports;
          final isLoading = state is SportsLoading;

          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: SportPageBodyStyles.verticalPadding,
                ),
                itemCount: sports.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.only(
                        bottom: SportPageBodyStyles.verticalPadding,
                      ),
                      child: GamesSearchBar(),
                    );
                  }

                  final sport = sports[index - 1];
                  return SportsCatalog(sport: sport);
                },
              ),
              if (isLoading)
                const Center(
                  child: SizedBox(
                    height: SportPageBodyStyles.loadingIndicatorSize,
                    width: SportPageBodyStyles.loadingIndicatorSize,
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
