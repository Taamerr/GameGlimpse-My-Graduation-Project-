import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../data/models/fixtures_model/match_data.dart';
import '../view_model/home_cubit/home_cubit.dart';
import 'widgets/custom_league_matches.dart';
import 'widgets/custom_matches_app_bar.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            top: 12.0,
          ),
          child: DefaultTabController(
            length: 4,
            initialIndex: 1,
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const CustomMatchesAppBar(),
                      TabBar(
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
                          const Tab(
                            child: Text(
                              'Tomorrow',
                            ),
                          ),
                          const Tab(
                            child: Text(
                              'Today',
                            ),
                          ),
                          const Tab(
                            child: Text(
                              'Yesterday',
                            ),
                          ),
                          Tab(
                            child: Text(
                              cubit.tabBarDate,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: state is HomeGetMatchesLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: TAppColors.kBlue,
                          ),
                        )
                      : TabBarView(
                          children: [
                            LiveScoreWidgetTree(
                              matches: cubit.tomorrowMatches,
                            ),
                            LiveScoreWidgetTree(
                              matches: cubit.todayMatches,
                            ),
                            LiveScoreWidgetTree(
                              matches: cubit.yesterdayMatches,
                            ),
                            LiveScoreWidgetTree(
                              matches: cubit.towDaysBeforeMatches,
                            ),
                          ],
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class LiveScoreWidgetTree extends StatelessWidget {
  const LiveScoreWidgetTree({
    super.key,
    required this.matches,
  });

  final List<List<MatchData>> matches;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => matches[index].isNotEmpty
                ? CustomLeagueMatches(
                    matchModelList: matches[index],
                  )
                : const SizedBox(),
            childCount: matches.length,
          ),
        ),
      ],
    );
  }
}
