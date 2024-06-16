import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/features/fixtures/data/models/date_model/date_model.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/fixtures_model.dart';
import 'package:gp_app/features/fixtures/data/models/fixtures_model/match_data.dart';
import 'package:gp_app/features/fixtures/data/models/leagues_matches_model/leagues_matches_model.dart';
import 'package:gp_app/features/fixtures/data/repos/fixtures_repo.dart';
import 'package:gp_app/features/fixtures/presentation/views/widgets/livecore_league_widget_tree.dart';
import 'package:intl/intl.dart';

part 'fixtures_state.dart';

class FixturesCubit extends Cubit<FixturesState> {
  FixturesCubit(this.fixturesRepo) : super(FixturesInitial()) {
    initialize();
  }
  final FixturesRepo fixturesRepo;
  static FixturesCubit get(context) => BlocProvider.of(context);

  void initialize() async {
    getDate();
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

  List<String> tempDates = [
    '2024-05-13',
    '2024-05-14',
    '2024-05-15',
    '2024-05-16',
    '2024-05-17',
    '2024-05-18',
    '2024-05-19',
    '2024-05-20',
    '2024-05-21',
    '2024-05-22',
  ];

  List<LeaguesMatchesModel> classifyLeagueMatches = [];
  FixturesModel? fixtures;
  Future<void> getAllMatches() async {
    emit(FixturesGetMatchesLoadingState());
    classifyLeagueMatches = [];
    var result = await fixturesRepo.fetchFixuresMatches(
      startDate: '2024-05-13',
      endDate: '2024-05-22',
      perPage: 50,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(FixturesGetMatchesFailureState(errMessage: failure.errMessage));
    }, (fixturesModel) {
      if (fixturesModel.data != null) {
        fixtures = fixturesModel;
        for (int i = 0; i < dates.length; i++) {
          classifyLeague(
            date: tempDates[i],
          );
        }
      }
      generateTabsScreens();
      emit(FixturesGetMatchesSuccessState());
    });
  }

  void classifyLeague({
    required String date,
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
    classifyLeagueMatches.add(LeaguesMatchesModel(
        allLeaguesMatches: allLeaguesMatchesList, date: date));
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
      tabsScreens.add(
        LiveScoreLeagueWidgetTree(
          matches: classifyLeagueMatches[i].allLeaguesMatches,
        ),
      );
    }
  }
}
