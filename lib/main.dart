import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:gp_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

import 'core/constants/colors.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/video_summary_repo/video_summ_repo_impl.dart';
import 'features/home/presentation/view_model/video_summary_cubit/video_summary_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ServiceLocator.setup();
  CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: TAppColors.kScaffoldColor,
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => VideoSummaryCubit(
                ServiceLocator.getIt.get<VideoSummaryRepoImpl>(),
              )..getAllMatchDocuments(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            themeMode: ThemeMode.dark,
            theme: TLightTheme.lightTheme,
            darkTheme: TDarkTheme.darkTheme,
          ),
        );
      },
    );
  }
}
