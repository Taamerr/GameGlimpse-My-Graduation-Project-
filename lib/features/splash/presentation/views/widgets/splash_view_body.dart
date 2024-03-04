import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/cache_helper.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToNextView();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        CircleAvatar(
          radius: width / 3.5,
          backgroundColor: Colors.blue[300],
          child: Container(
            decoration: BoxDecoration(
              color: TAppColors.kScaffoldColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: TAppColors.kBlue,
                width: 2.0,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  TAppAssets.appLogo,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Animate(
          effects: const [
            ShakeEffect(
              delay: Duration(
                seconds: 1,
                milliseconds: 200,
              ),
            ),
          ],
          child: const Text(
            'GameGlimpse',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Animate(
          effects: const [
            FadeEffect(
              duration: Duration(
                milliseconds: 400,
              ),
            ),
          ],
          child: const Text(
            'Don\'t miss a goal',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }

  void navigateToNextView() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (CacheHelper.getData(key: 'uId') == null &&
            CacheHelper.getData(key: 'inco') == null) {
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeLayout);
        }
      },
    );
  }
}
