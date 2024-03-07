import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../../data/models/fixtures_model/match_data.dart';
import '../../view_model/match_details_cubit/match_details_cubit.dart';
import 'custom_match_detail_app_bar.dart';
import 'lineups_widgets.dart';
import 'match_details_body_upper_part.dart';
import 'statistics.dart';

class MatchDetailsViewBody extends StatelessWidget {
  const MatchDetailsViewBody({
    super.key,
    required this.matchData,
  });

  final MatchData matchData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomMatchDetailsAppBar(
                    leagueName: matchData.league!.name!,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  MatchDetailsBodyUpperPart(
                    matchData: matchData,
                  ),
                  const TabBar(
                    padding: EdgeInsets.zero,
                    isScrollable: false,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    dividerHeight: 0,
                    dividerColor: TAppColors.kScaffoldColor,
                    labelColor: TAppColors.kWhite,
                    indicatorColor: TAppColors.kBlue,
                    unselectedLabelColor: TAppColors.kGrey2,
                    enableFeedback: true,
                    splashBorderRadius: BorderRadius.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        child: Text(
                          'Statistics',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Lineups',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Match summary',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: BlocBuilder<MatchDetailsCubit, MatchDetailsState>(
                builder: (context, state) {
                  var cubit = MatchDetailsCubit.get(context);
                  return TabBarView(
                    children: [
                      cubit.statistics.isNotEmpty
                          ? const Statistics()
                          : const Center(
                              child: Text(
                                'The match has not started yet',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: TAppColors.kWhite,
                                ),
                              ),
                            ),
                      cubit.statistics.isNotEmpty
                          ? const LineUps()
                          : const Center(
                              child: Text(
                                'The match has not started yet',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: TAppColors.kWhite,
                                ),
                              ),
                            ),
                      cubit.statistics.isNotEmpty
                          ? const SizedBox()
                          : const Center(
                              child: Text(
                                'The match has not started yet',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: TAppColors.kWhite,
                                ),
                              ),
                            ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
