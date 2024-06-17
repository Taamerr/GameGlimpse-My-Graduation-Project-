import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/features/home/data/models/league_standing_model/league_standing_model.dart';
import 'package:gp_app/features/standings/data/repos/standings_repo.dart';
import 'package:meta/meta.dart';

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
    21818,
    21694,
    21795,
    21779,
  ];
  Future<void> getLeagueStandingWithLeagueId({
    required int leagueId,
  }) async {
    emit(StandingsGetLeaguesStandingLoadingState());
    var result = await standingsRepo.fetchLeagueStandingWithLeagueId(
      leagueId: leagueId,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(StandingsGetLeaguesStandingFailureState(
          errMessage: failure.errMessage));
    }, (leagueStandingModel) {
      standings.add(leagueStandingModel);
      emit(HStandingsGetLeaguesStandingSuccessState());
    });
  }

  Future<void> getLeagueStandingWithSeasonId({
    required int seasonId,
  }) async {
    emit(StandingsGetLeaguesStandingLoadingState());
    var result = await standingsRepo.fetchLeagueStandingWithSeasonId(
      seasonId: seasonId,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(StandingsGetLeaguesStandingFailureState(
          errMessage: failure.errMessage));
    }, (leagueStandingModel) {
      standings.add(leagueStandingModel);
      emit(HStandingsGetLeaguesStandingSuccessState());
    });
  }

  Future<void> getAllStandings() async {
    emit(StandingsGetAllLeaguesStandingLoadingState());
    for (int i = 0; i < leaguesId.length; i++) {
      await getLeagueStandingWithLeagueId(
        leagueId: leaguesId[i],
      );
      if (standings.first.data == null) {
        break;
      }
    }
    if (standings.first.data == null) {
      standings.clear();
      for (int i = 0; i < seasonsId.length; i++) {
        await getLeagueStandingWithSeasonId(
          seasonId: seasonsId[i],
        );
        if (standings.first.data == null) {
          break;
        }
      }
    }
    emit(StandingsGetAllLeaguesStandingSuccessState());
  }
}
