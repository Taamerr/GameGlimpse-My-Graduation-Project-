import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/fixtures_model.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/match_data.dart';
import 'package:gp_app/features/fixtures/data/repos/fixtures_repo/fixtures_repo.dart';
import 'package:meta/meta.dart';

part 'picked_date_state.dart';

class PickedDateCubit extends Cubit<PickedDateState> {
  PickedDateCubit(this.fixturesRepo) : super(PickedDateInitial());
  final FixturesRepo fixturesRepo;
  static PickedDateCubit get(context) => BlocProvider.of(context);

  FixturesModel? fixtures;
  Future<void> getFixuresDatePicked({
    required String pickedDate,
    String page = '1',
  }) async {
    emit(FixturesGetPickedDateMatchesLoadingState());
    var result = await fixturesRepo.getFixuresDatePicked(
      pickedDate: pickedDate,
      perPage: 50,
      pageNumber: page,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(FixturesGetPickedDateMatchesFailureState(
          errMessage: failure.errMessage));
    }, (fixturesModel) {
      if (fixturesModel.data != null) {
        fixtures = fixturesModel;
        classifyLeague();

        if (fixturesModel.pagination!.hasMore == true) {
          String nextPage =
              (fixturesModel.pagination!.currentPage! + 1).toString();
          getFixuresDatePicked(
            page: nextPage,
            pickedDate: pickedDate,
          );
        }
        emit(FixturesGetPickedDateMatchesSuccessState());
      } else {
        emit(FixturesGetPickedDateMatchesFailureState(errMessage: 'no data'));
      }
    });
  }

  List<List<MatchData>> finalResult = [];
  void classifyLeague() {
    List<List<MatchData>> allLeaguesMatchesList = [];
    for (var match in fixtures!.data!) {
      if (allLeaguesMatchesList.isEmpty) {
        allLeaguesMatchesList.add([]);
        allLeaguesMatchesList.first.add(match);
        continue;
      }
      bool found = false;
      int i = 0;
      for (i = 0; i < allLeaguesMatchesList.length; i++) {
        if (match.leagueId == allLeaguesMatchesList[i].first.leagueId) {
          allLeaguesMatchesList[i].add(match);
          found = true;
          break;
        }
      }
      if (found == false) {
        allLeaguesMatchesList.add([]);
        allLeaguesMatchesList[i].add(match);
      }
    }

    Set<List<MatchData>> allUniqueLeagues = allLeaguesMatchesList.toSet();
    allUniqueLeagues.addAll(finalResult);
    allLeaguesMatchesList = combineLeagues(allUniqueLeagues.toList());
    finalResult = allLeaguesMatchesList;
  }

  List<List<MatchData>> combineLeagues(
      List<List<MatchData>> allLeaguesMatchesList) {
    Map<int, List<MatchData>> leagueMatchesMap = {};
    for (var leagueMatches in allLeaguesMatchesList) {
      for (var match in leagueMatches) {
        if (leagueMatchesMap.containsKey(match.leagueId)) {
          leagueMatchesMap[match.leagueId]!.add(match);
        } else {
          leagueMatchesMap[match.leagueId!] = [match];
        }
      }
    }
    return leagueMatchesMap.values.toList();
  }
}
