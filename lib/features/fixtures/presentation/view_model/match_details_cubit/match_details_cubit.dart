import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/match_stat_model/formation.dart';
import '../../../data/models/match_stat_model/lineup.dart';
import '../../../data/models/match_stat_model/statistic.dart';
import '../../../data/repos/match_details_repo/match_details_repo.dart';

part 'match_details_state.dart';

class MatchDetailsCubit extends Cubit<MatchDetailsState> {
  MatchDetailsCubit(this.matchDetailsRepo) : super(MatchDetailsInitial());
  static MatchDetailsCubit get(context) => BlocProvider.of(context);
  final MatchDetailsRepo matchDetailsRepo;

  List<Lineup> lineups = [];
  List<Statistic> statistics = [];
  List<Formation> formations = [];

  Future<void> getMatchStat({
    required int fixtureId,
    required int teamAId,
    required int teamBId,
  }) async {
    emit(MatchDetailsGetMatchStatsLoadingState());

    var result = await matchDetailsRepo.getMatchStat(
      fixtureId: fixtureId,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(MatchDetailsGetMatchStatsFailureState(
          errMessage: failure.errMessage));
    }, (matchStatModel) {
      lineups = matchStatModel.data!.lineups!;
      statistics = matchStatModel.data!.statistics!;
      formations = matchStatModel.data!.formations!;
      splitTeamsData(
        teamAId: teamAId,
        teamBId: teamBId,
      );
      emit(MatchDetailsGetMatchStatsSuccessState());
    });
  }

  List<Lineup> teamALineup = [];
  List<Lineup> teamBLineup = [];
  List<Statistic> teamAStat = [];
  List<Statistic> teamBStat = [];

  void splitTeamsData({
    required int teamAId,
    required int teamBId,
  }) {
    if (statistics.isNotEmpty) {
      for (var player in lineups) {
        if (player.teamId == teamAId) {
          teamALineup.add(player);
        } else if (player.teamId == teamBId) {
          teamBLineup.add(player);
        }
      }
      teamALineup
          .sort((a, b) => a.formationPosition!.compareTo(b.formationPosition!));
      teamBLineup
          .sort((a, b) => a.formationPosition!.compareTo(b.formationPosition!));
      for (var stat in statistics) {
        if (stat.location == 'home') {
          teamAStat.add(stat);
        } else if (stat.location == 'away') {
          teamBStat.add(stat);
        }
      }
      teamAStat.sort((a, b) => a.typeId!.compareTo(b.typeId!));
      teamBStat.sort((a, b) => a.typeId!.compareTo(b.typeId!));
    }
  }
}
