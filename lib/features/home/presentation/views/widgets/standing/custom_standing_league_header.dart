import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../data/models/league_standing_model/league_standing_model.dart';
import '../custom_league_header.dart';

class StandingLeagueHeader extends StatelessWidget {
  const StandingLeagueHeader({
    super.key,
    required this.leagueStandingModel,
  });
  final LeagueStandingModel leagueStandingModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kLeagueFullStanding,
          extra: leagueStandingModel,
        );
      },
      child: Container(
        height: 55.h,
        decoration: const BoxDecoration(),
        child: CustomLeagueHeader(
          imageUrl: leagueStandingModel.data!.first.league!.imagePath!,
          leagueId: leagueStandingModel.data!.first.league!.id!,
          leagueName: leagueStandingModel.data!.first.league!.name!,
          iconPressed: () {
            GoRouter.of(context).push(
              AppRouter.kLeagueFullStanding,
              extra: leagueStandingModel,
            );
          },
        ),
      ),
    );
  }
}
