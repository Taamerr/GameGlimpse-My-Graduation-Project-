import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/functions/custom_login_bottom_sheet.dart';
import '../../../../auth/presentation/views/functions/custom_register_bottom_sheet.dart';
import '../../../data/models/on_boarding_model.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});
  static final List<OnBoardingModel> onBoardingItems = [
    OnBoardingModel(
      image: TAppAssets.onBoarding1,
      title: 'Offer every fan a home for their football audience.',
    ),
    OnBoardingModel(
      image: TAppAssets.onBoarding2,
      title: 'Check the latest score',
    ),
    OnBoardingModel(
      image: TAppAssets.onBoarding3,
      title: 'Keep up with your favorite teams and players',
    ),
    OnBoardingModel(
      image: TAppAssets.onBoarding4,
      title: 'Follow every moment of the sport',
    ),
  ];
  static var boardingController = PageController();
  static final GlobalKey<FormState> loginFormKey = GlobalKey();
  static final GlobalKey<FormState> registerFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          const Expanded(
            child: CustomPageView(),
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                backgroundColor: TAppColors.kBlue,
                textColor: TAppColors.kWhite,
                text: 'Sign in',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                width: 200,
                height: 58,
                onPressed: () {
                  customLoginShowBottomSheet(
                    context: context,
                    loginFormKey: loginFormKey,
                    registerFormKey: registerFormKey,
                  );
                },
              ),
              RichText(
                text: TextSpan(
                  text: 'Sign Up',
                  style: const TextStyle(
                    color: TAppColors.kWhite,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      customRegisterShowBottomSheet(
                        context: context,
                        loginFormKey: loginFormKey,
                        registerFormKey: registerFormKey,
                      );
                    },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
