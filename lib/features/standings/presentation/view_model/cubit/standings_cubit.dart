import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/league_standing_model/league_standing_model.dart';
import '../../../data/repos/standings_repo.dart';

part 'standings_state.dart';

class StandingsCubit extends Cubit<StandingsState> {
  StandingsCubit(this.standingsRepo) : super(StandingsInitial()) {
    getAllStandings();
  }
  static StandingsCubit get(context) => BlocProvider.of(context);
  final StandingsRepo standingsRepo;

  List<LeagueStandingModel> standings = [];
  List<int> leaguesId = [
    8,
    564,
    384,
    82,
    301,
  ];
  List<int> seasonsId = [
    21646,
    21694,
    21818,
    21795,
    21779,
  ];
  Future<void> getLeagueStandingWithLeagueId() async {
    emit(StandingsGetLeaguesStandingLoadingState());
    var result = await standingsRepo.fetchLeagueStandingWithLeagueId(
      leagueId: leaguesId,
      leaguesStandingList: standings,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(StandingsGetLeaguesStandingFailureState(
          errMessage: failure.errMessage));
    }, (leagueStandingModel) {
      standings = leagueStandingModel.map((item) => item).toList();
      emit(HStandingsGetLeaguesStandingSuccessState());
    });
  }

  Future<void> getLeagueStandingWithSeasonId() async {
    emit(StandingsGetLeaguesStandingLoadingState());
    var result = await standingsRepo.fetchLeagueStandingWithSeasonId(
      seasonId: seasonsId,
      leaguesStandingList: standings,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(StandingsGetLeaguesStandingFailureState(
          errMessage: failure.errMessage));
    }, (leagueStandingModel) {
      standings = leagueStandingModel.map((item) => item).toList();
      emit(HStandingsGetLeaguesStandingSuccessState());
    });
  }

  Future<void> getAllStandings() async {
    emit(StandingsGetAllLeaguesStandingLoadingState());
    await getLeagueStandingWithLeagueId();
    if (standings.isEmpty) {
      await getLeagueStandingWithSeasonId();
      if (standings.first.data == null) {
        standings.clear();
      }
    }
    emit(StandingsGetAllLeaguesStandingSuccessState());
  }
}
