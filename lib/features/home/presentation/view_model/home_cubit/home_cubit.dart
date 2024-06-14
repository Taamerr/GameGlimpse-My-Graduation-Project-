import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/icons/custom_icons.dart';
import '../../../../../core/utils/icons/icon_broken.dart';
import '../../../data/models/fixtures_model/match_data.dart';
import '../../../data/models/league_standing_model/league_standing_model.dart';
import '../../../data/repos/home_repo/home_repo.dart';
import '../../views/matches_view.dart';
import '../../views/profile_view.dart';
import '../../views/standings_view.dart';
import '../../views/videos_summary_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  int currentIndex = 0;
  void changeBottomNavIndex(index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        CustomIcons.soccer_field,
      ),
      label: "Matches",
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.trophy),
      label: "Standings",
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.clapperboard),
      label: "Videos",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Profile,
        size: 32.0,
      ),
      label: "Profile",
    ),
  ];

  List<Widget> screens = [
    const MatchesView(),
    const StandingsView(),
    const VideosSummaryView(),
    const ProfileView(),
  ];

  Future<void> getUserData({required String uId}) async {
    emit(HomeGetUserDataLoadingState());
    var result = await homeRepo.getUserData(uId: uId);
    result.fold((failure) {
      emit(HomeGetUserDataFailureState(errMessage: failure));
    }, (_) {
      emit(HomeGetUserDataSuccessState());
    });
  }

  Future<void> signOut() async {
    emit(HomeSignOutLoadingState());
    var result = await homeRepo.signOut();
    result.fold((failure) {
      emit(HomeSignOutFailureState(errMessage: failure));
    }, (_) {
      currentIndex = 0;
      emit(HomeSignOutSuccessState());
    });
  }

  String tabBarDate = '';
  String today = '';
  String tomorrow = '';
  String yesterday = '';
  String towDaysBefore = '';
  void getDate() {
    DateTime tempToday = DateTime.now();
    DateTime tempTomorrow = tempToday.add(const Duration(days: 1));
    DateTime tempYesterday = tempToday.subtract(const Duration(days: 1));
    DateTime tempTwoDaysBefore = tempToday.subtract(const Duration(days: 2));
    today =
        "${tempToday.year.toString().padLeft(4, '0')}-${tempToday.month.toString().padLeft(2, '0')}-${tempToday.day.toString().padLeft(2, '0')}";
    tomorrow =
        "${tempTomorrow.year.toString().padLeft(4, '0')}-${tempTomorrow.month.toString().padLeft(2, '0')}-${tempTomorrow.day.toString().padLeft(2, '0')}";
    yesterday =
        "${tempYesterday.year.toString().padLeft(4, '0')}-${tempYesterday.month.toString().padLeft(2, '0')}-${tempYesterday.day.toString().padLeft(2, '0')}";
    towDaysBefore =
        "${tempTwoDaysBefore.year.toString().padLeft(4, '0')}-${tempTwoDaysBefore.month.toString().padLeft(2, '0')}-${tempTwoDaysBefore.day.toString().padLeft(2, '0')}";
    tabBarDate = DateFormat.MMMd().format(tempTwoDaysBefore);
  }

  List<List<MatchData>> todayMatches = [];
  List<List<MatchData>> tomorrowMatches = [];
  List<List<MatchData>> yesterdayMatches = [];
  List<List<MatchData>> towDaysBeforeMatches = [];

  Future<void> getAllMatches() async {
    emit(HomeGetMatchesLoadingState());
    todayMatches = [];
    tomorrowMatches = [];
    yesterdayMatches = [];
    towDaysBeforeMatches = [];
    var result = await homeRepo.fetchFixuresMatches(
      startDate: towDaysBefore,
      endDate: tomorrow,
      perPage: 50,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(HomeGetMatchesFailureState(errMessage: failure.errMessage));
    }, (fixturesModel) {
      if (fixturesModel.data != null) {
        classifyLeague(
          matches: fixturesModel.data!,
          date: today,
        );
        classifyLeague(
          matches: fixturesModel.data!,
          date: tomorrow,
        );
        classifyLeague(
          matches: fixturesModel.data!,
          date: yesterday,
        );
        classifyLeague(
          matches: fixturesModel.data!,
          date: towDaysBefore,
        );
      }
      emit(HomeGetMatchesSuccessState());
    });
  }

  void classifyLeague({
    required List<MatchData> matches,
    required String date,
  }) {
    List<MatchData> englandOne = [];
    List<MatchData> englandTwo = [];
    List<MatchData> englandThree = [];
    List<MatchData> europeOne = [];
    List<MatchData> europeTwo = [];
    List<MatchData> europeThree = [];
    List<MatchData> franceOne = [];
    List<MatchData> franceTwo = [];
    List<MatchData> franceThree = [];
    List<MatchData> germanyOne = [];
    List<MatchData> germanyTwo = [];
    List<MatchData> italyOne = [];
    List<MatchData> italyTwo = [];
    List<MatchData> spainOne = [];
    List<MatchData> spainTwo = [];
    for (var match in matches) {
      String matchDate = match.startingAt!.split(' ')[0];
      if (matchDate == date) {
        if (match.leagueId == 8) {
          englandOne.add(match);
        } else if (match.leagueId == 24) {
          englandTwo.add(match);
        } else if (match.leagueId == 27) {
          englandThree.add(match);
        } else if (match.leagueId == 2) {
          europeOne.add(match);
        } else if (match.leagueId == 1326) {
          europeTwo.add(match);
        } else if (match.leagueId == 5) {
          europeThree.add(match);
        } else if (match.leagueId == 301) {
          franceOne.add(match);
        } else if (match.leagueId == 307) {
          franceTwo.add(match);
        } else if (match.leagueId == 310) {
          franceThree.add(match);
        } else if (match.leagueId == 82) {
          germanyOne.add(match);
        } else if (match.leagueId == 109) {
          germanyTwo.add(match);
        } else if (match.leagueId == 384) {
          italyOne.add(match);
        } else if (match.leagueId == 390) {
          italyTwo.add(match);
        } else if (match.leagueId == 564) {
          spainOne.add(match);
        } else if (match.leagueId == 570) {
          spainTwo.add(match);
        }
      }
    }

    List<List<MatchData>> temp = [];
    temp.addAll([
      europeOne,
      europeTwo,
      europeThree,
      englandOne,
      englandTwo,
      englandThree,
      spainOne,
      spainTwo,
      germanyOne,
      germanyTwo,
      italyOne,
      italyTwo,
      franceOne,
      franceTwo,
      franceThree,
    ]);
    if (date == today) {
      todayMatches = temp;
    } else if (date == tomorrow) {
      tomorrowMatches = temp;
    } else if (date == yesterday) {
      yesterdayMatches = temp;
    } else if (date == towDaysBefore) {
      towDaysBeforeMatches = temp;
    }
  }

  List<LeagueStandingModel> standings = [];
  List<int> leaguesId = [
    8,
    564,
    384,
    82,
    301,
  ];
  Future<void> getLeagueStanding({
    required int leagueId,
  }) async {
    emit(HomeGetLeaguesStandingLoadingState());
    var result = await homeRepo.fetchLeagueStanding(
      leagueId: leagueId,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(HomeGetLeaguesStandingFailureState(errMessage: failure.errMessage));
    }, (leagueStandingModel) {
      standings.add(leagueStandingModel);
      emit(HomeGetLeaguesStandingSuccessState());
    });
  }

  Future<void> getAllStandings() async {
    emit(HomeGetAllLeaguesStandingLoadingState());
    for (int i = 0; i < leaguesId.length; i++) {
      await getLeagueStanding(
        leagueId: leaguesId[i],
      );
    }
    emit(HomeGetAllLeaguesStandingSuccessState());
  }
}
