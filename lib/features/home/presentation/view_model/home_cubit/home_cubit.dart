import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      icon: Icon(FontAwesomeIcons.user),
      label: "Profile",
    ),
  ];

  List<Widget> screens = [
    const FixturesView(),
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
}
