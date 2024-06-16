import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/fixtures_model/match_data.dart';
import '../../../../home/data/repos/match_details_repo/match_details_repo_impl.dart';
import '../../view_model/match_details_cubit/match_details_cubit.dart';
import 'match_details_view_body.dart';

class MatchDetailsView extends StatelessWidget {
  const MatchDetailsView({
    super.key,
    required this.matchData,
  });
  final MatchData matchData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => MatchDetailsCubit(
          ServiceLocator.getIt.get<MatchDetailsRepoImpl>(),
        )..getMatchStat(
            fixtureId: matchData.id!,
            teamAId: matchData.participants!.first.id!,
            teamBId: matchData.participants!.last.id!,
          ),
        child: Scaffold(
          body: MatchDetailsViewBody(
            matchData: matchData,
          ),
        ),
      ),
    );
  }
}
