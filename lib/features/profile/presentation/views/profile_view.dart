import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/incognito_view.dart';
import 'widgets/user_profile_view.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repos/profile_repo/profile_repo_impl.dart';
import '../view_model/profile_cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(ServiceLocator.getIt.get<ProfileRepoImpl>()),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          if (Constants.userModel != null) {
            cubit.targetScreen = const UserProfileView();
          } else if (CacheHelper.getData(key: 'inco') == null) {
            var cubit = ProfileCubit.get(context);
            cubit.checkUser(uId: CacheHelper.getData(key: 'uId'));
          } else if (CacheHelper.getData(key: 'inco') != null) {
            cubit.targetScreen = const IncognitoView();
          }
          return cubit.targetScreen;
        },
      ),
    );
  }
}
