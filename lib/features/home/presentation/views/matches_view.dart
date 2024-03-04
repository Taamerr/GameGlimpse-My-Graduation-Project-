import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/features/home/data/models/matches_model/matches_model.dart';
import 'package:gp_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:gp_app/features/home/presentation/views/widgets/custom_league_matches.dart';
import 'package:gp_app/features/home/presentation/views/widgets/custom_matches_app_bar.dart';

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
          padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 16.0),
          child: DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                const SliverToBoxAdapter(
                  //headerSilverBuilder only accepts slivers
                  child: Column(
                    children: [
                      CustomMatchesAppBar(),
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
                          Tab(
                            child: Text(
                              'Tomorrow',
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Today',
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Yesterday',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              body: TabBarView(
                children: [
                  LiveScoreWidgetTree(
                    matches: cubit.tomorrowMatchesList,
                  ),
                  LiveScoreWidgetTree(
                    matches: cubit.todayMatchesList,
                  ),
                  LiveScoreWidgetTree(
                    matches: cubit.yesterdayMatchesList,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//liveScoreWidgetTree(cubit: cubit)
class LiveScoreWidgetTree extends StatelessWidget {
  const LiveScoreWidgetTree({
    super.key,
    required this.matches,
  });

  final List<MatchesModel> matches;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => matches[index].fixturesModel.results! > 0
                ? CustomLeagueMatches(
                    matchesModel: matches[index],
                  )
                : const SizedBox(),
            childCount: matches.length,
          ),
        ),
      ],
    );
  }
}
