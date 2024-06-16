import 'package:flutter/material.dart';

import '../../../data/models/fixtures_model/match_data.dart';
import '../../../../home/presentation/views/widgets/custom_league_header.dart';
import 'custom_match_card.dart';

class CustomLeagueMatches extends StatelessWidget {
  const CustomLeagueMatches({
    super.key,
    required this.matchModelList,
  });
  final List<MatchData> matchModelList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          decoration: const BoxDecoration(),
          child: CustomLeagueHeader(
            imageUrl: matchModelList.first.league!.imagePath!,
            leagueId: matchModelList.first.league!.id!,
            leagueName: matchModelList.first.league!.name!,
            iconPressed: () {},
          ),
        ),
        const SizedBox(
          height: 14.0,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CustomMatchCard(
            matchModel: matchModelList[index],
          ),
          itemCount: matchModelList.length,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
