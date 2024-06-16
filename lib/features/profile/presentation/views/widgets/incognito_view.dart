import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../view_model/profile_cubit/profile_cubit.dart';

class IncognitoView extends StatelessWidget {
  const IncognitoView({
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
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: const AssetImage(TAppAssets.incognitoIcon),
                height: (MediaQuery.of(context).size.width * 0.4).w,
                width: (MediaQuery.of(context).size.width * 0.4).w,
              ),
              Text(
                'Please login first',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                backgroundColor: TAppColors.kBlue,
                textColor: TAppColors.kWhite,
                text: 'Login',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                onPressed: () async {
                  await cubit.signOut();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
