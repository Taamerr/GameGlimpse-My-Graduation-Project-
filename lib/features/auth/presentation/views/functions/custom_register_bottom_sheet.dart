import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/functions/custom_alert_dialog.dart';
import '../../../../../core/utils/functions/custom_snack_bar.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/conditional_builder.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/repos/auth_repo_impl.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'custom_login_bottom_sheet.dart';

Future<dynamic> customRegisterShowBottomSheet({
  required BuildContext context,
  required GlobalKey<FormState> loginFormKey,
  required GlobalKey<FormState> registerFormKey,
}) {
  return showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: TAppColors.kBlack3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(45.r),
        topRight: Radius.circular(45.r),
      ),
    ),
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => AuthCubit(
          ServiceLocator.getIt.get<AuthRepoImpl>(),
          context,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: 24.0.w,
            right: 24.0.w,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              switch (state) {
                case AuthLoginGoogleSuccessState():
                  {
                    Navigator.pop(context);
                    showSnackBar(
                      message: 'Login Successfully',
                      context: context,
                    );
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeLayout);
                  }
                  break;
                case AuthRegisterSuccessState():
                  {
                    Navigator.pop(context);
                    showMyDialog(
                      context: context,
                      title: 'Verify your email',
                      message: 'Please verify your email!',
                      buttonText: 'OK',
                    );
                  }
                  break;
                case AuthRegisterFailureState():
                  {
                    Navigator.pop(context);
                    showSnackBar(
                      message: state.errMessage,
                      context: context,
                    );
                  }
                  break;
                case AuthLoginGoogleFailureState():
                  {
                    Navigator.pop(context);
                    showSnackBar(
                      message: state.errMessage,
                      context: context,
                    );
                  }
                  break;
                default:
                  {
                    
                  }
                  break;
              }
            },
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return IgnorePointer(
                ignoring: state is AuthRegisterLoadingState ||
                    state is AuthLoginGoogleLoadingState,
                child: Form(
                  key: registerFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(
                        width: 66.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: const Align(
                          alignment: Alignment.topCenter,
                          child: Divider(
                            color: Color(0xff383846),
                            thickness: 4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 28.h,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              color: TAppColors.kWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 28.0.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Name',
                        fillColor: TAppColors.kBlack2,
                        prefixIcon: const Icon(FontAwesomeIcons.user),
                        validator: (String? data) {
                          if (data!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        onChanged: (String input) {
                          cubit.name = input;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Email',
                        fillColor: TAppColors.kBlack2,
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        validator: (String? data) {
                          if (data!.isEmpty) {
                            return 'This field is required';
                          } else if (!data.contains('@')) {
                            return 'Email must contain @';
                          }
                          return null;
                        },
                        onChanged: (String input) {
                          cubit.email = input;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        obscureText: cubit.isHide,
                        fillColor: TAppColors.kBlack2,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordIcon();
                          },
                          icon: Icon(cubit.passwordIcon),
                        ),
                        onChanged: (String input) {
                          cubit.password = input;
                        },
                        validator: (String? data) {
                          if (data!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                      ConditionalBuilder(
                        condition: state is AuthRegisterLoadingState,
                        fallback: CustomButton(
                          backgroundColor: TAppColors.kBlue,
                          textColor: TAppColors.kWhite,
                          text: 'Sign Up',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          width: (MediaQuery.of(context).size.width).w,
                          height: 58.h,
                          onPressed: () async {
                            if (registerFormKey.currentState!.validate()) {
                              await cubit.createUserWithEmailAndPassword(
                                email: cubit.email,
                                password: cubit.password,
                              );
                            }
                          },
                        ),
                        builder: Container(
                          decoration: BoxDecoration(
                            color: TAppColors.kBlue,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          height: 58.h,
                          width: (MediaQuery.of(context).size.width).w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: TAppColors.kWhite,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 2.0,
                                endIndent: 5.0,
                              ),
                            ),
                          ),
                          Text(
                            'OR',
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 2.0,
                                indent: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await cubit.signInWithGoogle();
                            },
                            icon: const Icon(
                              FontAwesomeIcons.google,
                              color: TAppColors.kGrey2,
                              size: 32,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.incognitoSignIn();
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.kHomeLayout);
                            },
                            icon: Image(
                              image: const AssetImage(
                                TAppAssets.incognitoIcon,
                              ),
                              fit: BoxFit.fill,
                              height: 36.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18.0.h,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Have account already? ',
                              style: TextStyle(
                                color: Color(0xffC4C4C4),
                              ),
                            ),
                            TextSpan(
                              text: 'Sign in',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff246BFD),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                  customLoginShowBottomSheet(
                                    context: context,
                                    loginFormKey: loginFormKey,
                                    registerFormKey: registerFormKey,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
