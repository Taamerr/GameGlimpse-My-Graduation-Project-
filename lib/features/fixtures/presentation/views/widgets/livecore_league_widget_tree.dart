import 'package:flutter/material.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/match_data.dart';
import 'package:gp_app/features/fixtures/presentation/views/widgets/custom_league_matches.dart';

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
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
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