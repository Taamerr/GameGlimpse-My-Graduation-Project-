import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/core/constants/constants.dart';
import 'package:gp_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:gp_app/features/home/presentation/views/widgets/profile/incognito_view.dart';
import 'package:gp_app/features/home/presentation/views/widgets/profile/user_profile_view.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  Widget targetScreen = const Center(
    child: CircularProgressIndicator(
      color: TAppColors.kBlue,
    ),
  );

  void checkUser({String? uId}) async {
    emit(ProfileCheckUserLoadingState());
    if (uId != null && Constants.userModel == null) {
      AuthRepoImpl authRepoImpl = AuthRepoImpl();
      await authRepoImpl.getUserData(uId: uId);
      if (Constants.userModel != null) {
        targetScreen = const UserProfileView();
      }
    } else {
      targetScreen = const IncognitoView();
    }
    emit(ProfileCheckUserFinishState());
  }
}
