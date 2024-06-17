import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/models/date_model/date_model.dart';
import '../../../data/models/fixtures_model/fixtures_model.dart';
import '../../../data/models/fixtures_model/match_data.dart';
import '../../../data/models/leagues_matches_model/leagues_matches_model.dart';
import '../../../data/repos/fixtures_repo.dart';
import '../../views/widgets/livecore_league_widget_tree.dart';
import '../../views/widgets/no_matches_today.dart';

part 'fixtures_state.dart';

class FixturesCubit extends Cubit<FixturesState> {
  FixturesCubit(this.fixturesRepo) : super(FixturesInitial()) {
    initialize();
  }
  final FixturesRepo fixturesRepo;
  static FixturesCubit get(context) => BlocProvider.of(context);

  Future<void> initialize() async {
    getDate();
    initializeClassifyLeagueList();
    generateTabs();
    await getAllMatches();
  }

  List<DateModel> dates = [];
  void getDate() {
    emit(FixturesGenerateDateLoadingState());
    DateTime tempToday = DateTime.now();
    dates = [];
    for (int i = 1; i <= 10; i++) {
      if (i <= 3) {
        DateTime temp = tempToday.subtract(Duration(days: i));
        String date =
            "${temp.year.toString().padLeft(4, '0')}-${temp.month.toString().padLeft(2, '0')}-${temp.day.toString().padLeft(2, '0')}";
        dates.add(
            DateModel(date: date, previewName: DateFormat.MMMd().format(temp)));
      } else if (i == 4) {
        DateTime temp = tempToday;
        String date =
            "${temp.year.toString().padLeft(4, '0')}-${temp.month.toString().padLeft(2, '0')}-${temp.day.toString().padLeft(2, '0')}";
        dates.add(DateModel(date: date, previewName: 'Today'));
      } else {
        DateTime temp = tempToday.add(Duration(days: i - 4));
        String date =
            "${temp.year.toString().padLeft(4, '0')}-${temp.month.toString().padLeft(2, '0')}-${temp.day.toString().padLeft(2, '0')}";
        dates.add(
            DateModel(date: date, previewName: DateFormat.MMMd().format(temp)));
      }
    }
    dates.sort((a, b) {
      DateTime dateA = DateTime.parse(a.date);
      DateTime dateB = DateTime.parse(b.date);
      return dateA.compareTo(dateB);
    });
    emit(FixturesGenerateDateFinishState());
  }

  List<LeaguesMatchesModel> classifyLeagueMatches = [];
  FixturesModel? fixtures;
  Future<void> getAllMatches({String page = '1'}) async {
    emit(FixturesGetMatchesLoadingState());
    var result = await fixturesRepo.fetchFixuresMatches(
      startDate: dates.first.date,
      endDate: dates.last.date,
      perPage: 50,
      pageNumber: page,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(FixturesGetMatchesFailureState(errMessage: failure.errMessage));
    }, (fixturesModel) {
      if (fixturesModel.data != null) {
        fixtures = fixturesModel;
        for (int i = 0; i < dates.length; i++) {
          classifyLeague(
            date: dates[i].date,
            index: i,
          );
        }
      }
      if (fixturesModel.pagination!.hasMore == true) {
        String nextPage =
            (fixturesModel.pagination!.currentPage! + 1).toString();
        getAllMatches(page: nextPage);
      }
      generateTabsScreens();
      emit(FixturesGetMatchesSuccessState());
    });
  }

  void classifyLeague({
    required String date,
    required int index,
  }) {
    List<List<MatchData>> allLeaguesMatchesList = [];
    List<MatchData> matchesToRemove = [];
    for (var match in fixtures!.data!) {
      String matchDate = match.startingAt!.split(' ')[0];
      if (matchDate == date) {
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
        matchesToRemove.add(match);
      }
    }
    for (var match in matchesToRemove) {
      fixtures!.data!.remove(match);
    }
    Set<List<MatchData>> allUniqueLeagues = allLeaguesMatchesList.toSet();
    allUniqueLeagues.addAll(classifyLeagueMatches[index].allLeaguesMatches);
    allLeaguesMatchesList = combineLeagues(allUniqueLeagues.toList());
    classifyLeagueMatches[index].allLeaguesMatches = allLeaguesMatchesList;
  }

  List<Widget> tabs = [];
  void generateTabs() {
    tabs = [];
    for (int i = dates.length - 1; i >= 0; i--) {
      tabs.add(
        Tab(
          child: Text(
            dates[i].previewName,
          ),
        ),
      );
    }
  }

  List<Widget> tabsScreens = [];
  void generateTabsScreens() {
    tabsScreens = [];
    for (int i = dates.length - 1; i >= 0; i--) {
      if (classifyLeagueMatches[i].allLeaguesMatches.isNotEmpty) {
        tabsScreens.add(
          LiveScoreLeagueWidgetTree(
            matches: classifyLeagueMatches[i].allLeaguesMatches,
          ),
        );
      } else {
        tabsScreens.add(
          const NoMatchesToday(),
        );
      }
    }
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

  void initializeClassifyLeagueList() {
    classifyLeagueMatches = [];
    for (int i = 0; i < dates.length; i++) {
      LeaguesMatchesModel leaguesMatchesModel = LeaguesMatchesModel(
          date: dates[i].previewName, allLeaguesMatches: []);
      classifyLeagueMatches.add(leaguesMatchesModel);
    }
  }
}
