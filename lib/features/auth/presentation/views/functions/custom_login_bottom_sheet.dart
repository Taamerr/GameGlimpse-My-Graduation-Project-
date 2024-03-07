import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/custom_snack_bar.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/conditional_builder.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/repos/auth_repo_impl.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'custom_register_bottom_sheet.dart';

Future<dynamic> customLoginShowBottomSheet({
  required BuildContext context,
  required GlobalKey<FormState> loginFormKey,
  required GlobalKey<FormState> registerFormKey,
}) {
  return showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: TAppColors.kBlack3,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(45),
        topRight: Radius.circular(45),
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
            left: 24.0,
            right: 24.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginSuccessState ||
                  state is AuthLoginGoogleSuccessState) {
                Navigator.pop(context);
                GoRouter.of(context).pushReplacement(AppRouter.kHomeLayout);
              } else if (state is AuthLoginFailureState ||
                  state is AuthLoginGoogleFailureState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return IgnorePointer(
                ignoring: state is AuthLoginLoadingState,
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: 66,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Align(
                          alignment: Alignment.topCenter,
                          child: Divider(
                            color: Color(0xff383846),
                            thickness: 4,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 28,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                              color: TAppColors.kWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
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
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        obscureText: cubit.isHide,
                        fillColor: TAppColors.kBlack2,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordIcon(cubit.isHide);
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
                      const SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            text: 'Forgot Password',
                            style: const TextStyle(
                              color: TAppColors.kWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      ConditionalBuilder(
                        condition: state is AuthLoginLoadingState,
                        fallback: CustomButton(
                          backgroundColor: TAppColors.kBlue,
                          textColor: TAppColors.kWhite,
                          text: 'Sign in',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          width: MediaQuery.of(context).size.width,
                          height: 58,
                          onPressed: () async {
                            if (loginFormKey.currentState!.validate()) {
                              await cubit.signInWithEmailAndPassword(
                                email: cubit.email,
                                password: cubit.password,
                              );
                            }
                          },
                        ),
                        builder: Container(
                          decoration: BoxDecoration(
                            color: TAppColors.kBlue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 58,
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: TAppColors.kWhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
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
                      const SizedBox(
                        height: 10.0,
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
                              showSnackBar(
                                message:
                                    'oops an error occurred. please try again.',
                                context: context,
                              );
                            },
                            icon: const Icon(
                              FontAwesomeIcons.facebook,
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
                            icon: const Image(
                              image: AssetImage(
                                TAppAssets.incognitoIcon,
                              ),
                              fit: BoxFit.fill,
                              height: 36,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Don\'t have account? ',
                              style: TextStyle(
                                color: Color(0xffC4C4C4),
                              ),
                            ),
                            TextSpan(
                              text: 'SignUp',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff246BFD),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                  customRegisterShowBottomSheet(
                                    context: context,
                                    loginFormKey: loginFormKey,
                                    registerFormKey: registerFormKey,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
