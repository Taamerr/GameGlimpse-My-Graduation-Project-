import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/fixtures_model/match_data.dart';
import 'custom_league_matches.dart';

class LiveScoreLeagueWidgetTree extends StatelessWidget {
  const LiveScoreLeagueWidgetTree({
    super.key,
    required this.matches,
  });

  final List<List<MatchData>> matches;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
         SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => CustomLeagueMatches(
              matchModelList: matches[index],
            ),
            childCount: matches.length,
          ),
        ),
      ],
    );
  }
}