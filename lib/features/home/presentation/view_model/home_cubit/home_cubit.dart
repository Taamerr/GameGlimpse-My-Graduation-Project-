import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp_app/core/constants/api_keys.dart';
import 'package:gp_app/core/utils/icons/icon_broken.dart';
import 'package:gp_app/features/home/data/models/matches_model/matches_model.dart';

import '../../../../../core/utils/icons/custom_icons.dart';
import '../../../data/repos/home_repo/home_repo.dart';
import '../../views/matches_view.dart';
import '../../views/profile_view.dart';
import '../../views/standings_view.dart';

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
    ProfileView(),
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
      emit(HomeSignOutSuccessState());
    });
  }

  List<MatchesModel> todayMatchesList = [];
  List<MatchesModel> tomorrowMatchesList = [];
  List<MatchesModel> yesterdayMatchesList = [];
  Future<void> getLeagueMatches({
    required String league,
    required String season,
    required String date,
    required String rapidApiKey,
    required String datePref,
  }) async {
    emit(HomeGetMatchesLoadingState());
    var result = await homeRepo.fetchFixuresMatches(
      league: league,
      season: season,
      date: date,
      rapidApiKey: rapidApiKey,
    );
    result.fold((failure) {
      print('failure = ${failure.errMessage}');
      emit(HomeGetMatchesFailureState(errMessage: failure.errMessage));
    }, (fixturesModel) {
      MatchesModel matchesModel = MatchesModel(
        fixturesModel: fixturesModel,
        rapidApiKey: rapidApiKey,
      );
      if (datePref == 't') {
        todayMatchesList.add(matchesModel);
      } else if (datePref == 'to') {
        tomorrowMatchesList.add(matchesModel);
      } else {
        yesterdayMatchesList.add(matchesModel);
      }
      emit(HomeGetMatchesSuccessState());
    });
  }

  List<String> competitionId = [
    '39', // Premier League
    '140', // La Liga
    '78', // Bundesliga
    '135', // Serie A
    '61', // Ligue 1
    '48', // League Cup
    '45', // FA Cup
    '143', // Copa del Rey
    '81', // DFB Pokal
    '137', // Coppa Italia
    '65', // Coupe de la Ligue
    '66', // Coupe de France
    '2', // Champions League
    '3', // Europa League
    '4', // Euro
    '5', // Nations League
  ];
  List<String> apiKeys = [
    ApiKeys.key1,
    ApiKeys.key2,
    ApiKeys.key3,
    ApiKeys.key4,
    ApiKeys.key5,
  ];
  Future<void> getAllMatches({
    required String date,
    required String datePref,
  }) async {
    emit(HomeGetAllLeaguesMatchesLoadingState());
    int y = 0;
    for (int i = 0; i < 5; i++) {
      await getLeagueMatches(
        datePref: datePref,
        date: date,
        league: competitionId[i],
        rapidApiKey: apiKeys[y],
        season: '2023',
      );
      if (i % 2 != 0 && i > 0) {
        y++;
      }
    }
    emit(HomeGetAllLeaguesMatchesSuccessState());
  }

  Future<void> getThreeDaysMatches() async {
    emit(HomeGetAllMatchesDataLoadingState());
    DateTime now = DateTime.now();
    String formattedToday =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    DateTime yesterday = now.subtract(const Duration(days: 1));
    String formattedYesterday =
        '${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}';
    DateTime tomorrow = now.add(const Duration(days: 1));
    String formattedTomorrow =
        '${tomorrow.year}-${tomorrow.month.toString().padLeft(2, '0')}-${tomorrow.day.toString().padLeft(2, '0')}';
    await getAllMatches(date: formattedToday, datePref: 't');
    await getAllMatches(date: formattedTomorrow, datePref: 'to');
    await getAllMatches(date: formattedYesterday, datePref: 'y');
    emit(HomeGetAllMatchesDataSuccessState());
  }
}
