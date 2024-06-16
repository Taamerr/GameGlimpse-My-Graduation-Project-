import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/utils/cache_helper.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../auth/data/repos/auth_repo_impl.dart';
import '../../../data/repos/profile_repo/profile_repo.dart';
import '../../views/widgets/incognito_view.dart';
import '../../views/widgets/user_profile_view.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileRepo profileRepo;
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

  Future<void> signOut() async {
    emit(ProfileSignOutLoadingState());
    var result = await profileRepo.signOut();
    result.fold((failure) {
      emit(ProfileSignOutFailureState(errMessage: failure));
    }, (_) {
      emit(ProfileSignOutSuccessState());
    });
  }
}
