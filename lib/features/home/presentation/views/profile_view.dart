import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/utils/cache_helper.dart';
import 'package:gp_app/features/home/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:gp_app/features/home/presentation/views/widgets/profile/user_profile_view.dart';

import '../../../../core/constants/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          if (Constants.userModel == null) {
            var cubit = ProfileCubit.get(context);
            cubit.checkUser(uId: CacheHelper.getData(key: 'uId'));
          } else {
            cubit.targetScreen = const UserProfileView();
          }
          return cubit.targetScreen;
        },
      ),
    );
  }
}
