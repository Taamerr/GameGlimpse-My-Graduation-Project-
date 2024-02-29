import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/constants/assets.dart';
import 'package:gp_app/core/constants/colors.dart';
import 'package:gp_app/core/utils/app_router.dart';
import 'package:gp_app/core/widgets/custom_button.dart';
import 'package:gp_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class IncognitoView extends StatelessWidget {
  const IncognitoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSignOutSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding);
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: const AssetImage(TAppAssets.incognitoIcon),
                height: MediaQuery.of(context).size.width * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const Text(
                'Please login first',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                backgroundColor: TAppColors.kBlue,
                textColor: TAppColors.kWhite,
                text: 'Login',
                fontSize: 18,
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
