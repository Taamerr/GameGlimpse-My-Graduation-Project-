import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../view_model/profile_cubit/profile_cubit.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_button.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSignOutSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding);
        }
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage(TAppAssets.profileBackground),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.147,
                      backgroundColor: TAppColors.kScaffoldColor,
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width * 0.14 * 2,
                        height: MediaQuery.of(context).size.width * 0.14 * 2,
                        imageUrl: Constants.userModel!.image,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                Constants.userModel!.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Constants.userModel!.bio,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: TAppColors.kGrey1,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              CustomButton(
                backgroundColor: TAppColors.kBlue,
                textColor: TAppColors.kWhite,
                text: 'Edit Profile',
                width: MediaQuery.of(context).size.width,
                onPressed: () async {
                  GoRouter.of(context).push(AppRouter.kEditProfile);
                },
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 48,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                backgroundColor: TAppColors.kBlue,
                textColor: TAppColors.kWhite,
                text: 'Logout',
                width: MediaQuery.of(context).size.width,
                onPressed: () async {
                  await cubit.signOut();
                },
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 48,
              ),
            ],
          ),
        );
      },
    );
  }
}
