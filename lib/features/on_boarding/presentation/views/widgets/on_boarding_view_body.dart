import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/functions/custom_login_bottom_sheet.dart';
import '../../../../auth/presentation/views/functions/custom_register_bottom_sheet.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});
  static var boardingController = PageController();
  static final GlobalKey<FormState> loginFormKey = GlobalKey();
  static final GlobalKey<FormState> registerFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 40.0.w,
        right: 36.0.w,
        bottom: 50.0.h,
        top: 20.0.h,
      ),
      child: Column(
        children: [
          const Expanded(
            child: CustomPageView(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                backgroundColor: TAppColors.kBlue,
                textColor: TAppColors.kWhite,
                text: 'Sign in',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                width: 200.w,
                height: 58.h,
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
                  style: TextStyle(
                    color: TAppColors.kWhite,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
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
        ],
      ),
    );
  }
}
