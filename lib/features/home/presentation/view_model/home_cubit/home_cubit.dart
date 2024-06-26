import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../../../auth/data/repos/auth_repo_impl.dart';

import '../../../../../core/utils/icons/custom_icons.dart';
import '../../../../../core/utils/icons/icon_broken.dart';
import '../../../../fixtures/presentation/views/matches_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../../standings/presentation/views/standings_view.dart';
import '../../../../summary/presentation/views/videos_summary_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

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

  void checkUser() async {
    emit(HomeGetUserDataLoadingState());
    String? uId = CacheHelper.getData(key: 'uId');
    if (uId != null && Constants.userModel == null) {
      AuthRepoImpl authRepoImpl = AuthRepoImpl();
      var result = await authRepoImpl.getUserData(uId: uId);
      result.fold((failure) {
        emit(HomeGetUserDataFailureState(errMessage: failure));
      }, (_) {
        emit(HomeGetUserDataSuccessState());
      });
    }
  }
}
