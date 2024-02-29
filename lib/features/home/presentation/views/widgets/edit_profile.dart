import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/utils/service_locator.dart';
import 'package:gp_app/features/home/data/repos/edit_profile_repo/edit_profile_repo_impl.dart';
import 'package:gp_app/features/home/presentation/view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:gp_app/features/home/presentation/views/widgets/edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => EditProfileCubit(
          ServiceLocator.getIt.get<EditProfileRepoImpl>(),
        ),
        child: const Scaffold(
          body: EditProfileBody(),
        ),
      ),
    );
  }
}
